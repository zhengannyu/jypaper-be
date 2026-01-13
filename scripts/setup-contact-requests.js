const { createDirectus, rest, authentication, readCollections, readFields } = require("@directus/sdk");

const DIRECTUS_URL = process.env.DIRECTUS_URL || "http://localhost:8055";
const ADMIN_EMAIL = process.env.ADMIN_EMAIL || "admin@example.com";
const ADMIN_PASSWORD = process.env.ADMIN_PASSWORD || "admin1234";

async function setupContactRequests() {
  try {
    console.log("正在連接到 Directus...");
    const client = createDirectus(DIRECTUS_URL).with(authentication()).with(rest());

    // 登入管理員帳號
    console.log("正在登入...");
    await client.login({ email: ADMIN_EMAIL, password: ADMIN_PASSWORD });

    // 檢查 collection 是否已存在
    const collections = await client.request(readCollections());
    const existingCollection = collections.find((c) => c.collection === "contact_requests");

    if (existingCollection) {
      console.log("contact_requests collection 已存在，跳過創建。");
    } else {
      console.log("正在創建 contact_requests collection...");
      // 使用 REST API 創建 collection
      await client.request({
        method: "POST",
        path: "/collections",
        body: {
          collection: "contact_requests",
          meta: {
            collection: "contact_requests",
            icon: "mail",
            note: "儲存前端聯絡表單提交的資料",
            display_template: "{{name}} - {{email}}",
            hidden: false,
            singleton: false,
          },
          schema: {
            name: "contact_requests",
          },
        },
      });
      console.log("✓ contact_requests collection 創建成功");
    }

    // 檢查並創建欄位
    const fields = await client.request(readFields("contact_requests"));
    const existingFieldNames = fields.map((f) => f.field);

    const fieldsToCreate = [
      {
        field: "name",
        type: "string",
        meta: {
          interface: "input",
          required: true,
          width: "half",
          note: "聯絡人姓名",
        },
        schema: {
          is_nullable: false,
        },
      },
      {
        field: "email",
        type: "string",
        meta: {
          interface: "input",
          required: true,
          width: "half",
          note: "聯絡人電子郵件",
          options: {
            iconRight: "email",
          },
        },
        schema: {
          is_nullable: false,
        },
      },
      {
        field: "subject",
        type: "string",
        meta: {
          interface: "input",
          required: false,
          width: "full",
          note: "訊息主題",
        },
        schema: {
          is_nullable: true,
        },
      },
      {
        field: "message",
        type: "text",
        meta: {
          interface: "input-rich-text-html",
          required: true,
          width: "full",
          note: "聯絡訊息內容",
        },
        schema: {
          is_nullable: false,
        },
      },
      {
        field: "status",
        type: "string",
        meta: {
          interface: "select-dropdown",
          required: false,
          width: "half",
          note: "處理狀態",
          options: {
            choices: [
              { text: "待處理", value: "pending" },
              { text: "已讀", value: "read" },
              { text: "已回覆", value: "replied" },
            ],
          },
        },
        schema: {
          is_nullable: true,
          default_value: "pending",
        },
      },
    ];

    for (const fieldConfig of fieldsToCreate) {
      if (existingFieldNames.includes(fieldConfig.field)) {
        console.log(`  - ${fieldConfig.field} 欄位已存在，跳過創建。`);
      } else {
        console.log(`正在創建欄位: ${fieldConfig.field}...`);
        await client.request({
          method: "POST",
          path: "/fields/contact_requests",
          body: fieldConfig,
        });
        console.log(`  ✓ ${fieldConfig.field} 欄位創建成功`);
      }
    }

    console.log("\n✅ contact_requests collection 設置完成！");
    console.log("\n下一步：");
    console.log("1. 在 Directus 管理介面中設置權限（Settings > Roles & Permissions）");
    console.log("2. 為 Public 角色授予 contact_requests 的 Create 權限");
    console.log("3. 前端可以使用以下端點提交資料：");
    console.log(`   POST ${DIRECTUS_URL}/items/contact_requests`);
  } catch (error) {
    console.error("❌ 設置失敗:", error?.response?.errors || error.message);
    process.exit(1);
  }
}

setupContactRequests();
