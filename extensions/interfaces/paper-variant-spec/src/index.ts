import { defineInterface } from '@directus/extensions-sdk';
import InterfaceComponent from './interface.vue';

export default defineInterface({
  id: 'paper-variant-spec',
  name: 'Paper Variant Spec',
  icon: 'layers',
  description: 'Select specs filtered by current paper',
  types: ['alias'],
  relational: true,
  component: InterfaceComponent,
  options: null,  // ← 加這行
});
