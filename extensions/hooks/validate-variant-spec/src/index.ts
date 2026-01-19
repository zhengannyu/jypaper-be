import { defineHook } from '@directus/extensions-sdk';

export default defineHook(({ filter }) => {
  // 監聽 papervariants 的 create & update
  filter('papervariants.items.create', validateSpec);
  filter('papervariants.items.update', validateSpec);
});

async function validateSpec(
  payload: any,
  meta: Record<string, any>,
  context: any
) {
  const { database } = context;
  const paperId = payload.paper;
  
  if (!paperId) return payload; // 沒選 paper 就跳過

  // 檢查 spec 是否為陣列格式（M2M junction）
  if (!payload.spec || !Array.isArray(payload.spec)) return payload;

  const specIds = payload.spec.map((junction: any) => junction.papervariantspec_id);

  if (specIds.length === 0) return payload;

  // 查詢這些 spec 所屬的 product
  const specs = await database
    .select('id', 'product')
    .from('papervariantspec')
    .whereIn('id', specIds);

  // 找出不符的 spec
  const invalidSpecs = specs.filter((spec: any) => spec.product !== paperId);

  if (invalidSpecs.length > 0) {
    const invalidIds = invalidSpecs.map((s: any) => s.id).join(', ');
    throw new Error(`這些 Spec 不屬於您選擇的 Paper (ID: ${paperId})，請移除：${invalidIds}`);
  }

  return payload;
}
