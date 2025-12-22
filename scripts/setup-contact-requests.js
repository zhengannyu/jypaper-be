const {
  createDirectus,
  rest,
  staticToken,
  readCollection,
  createCollection,
  readField,
  createField,
  isDirectusError,
} = require('@directus/sdk');

const DIRECTUS_URL = process.env.DIRECTUS_URL || 'http://localhost:8055';
const DIRECTUS_STATIC_TOKEN = process.env.DIRECTUS_STATIC_TOKEN;

if (!DIRECTUS_STATIC_TOKEN) {
  console.error('Missing DIRECTUS_STATIC_TOKEN environment variable.');
  process.exit(1);
}

const client = createDirectus(DIRECTUS_URL).with(staticToken(DIRECTUS_STATIC_TOKEN)).with(rest());
const COLLECTION = 'contact_requests';

async function ensureCollection() {
  try {
    await client.request(readCollection(COLLECTION));
    console.log(`Collection "${COLLECTION}" already exists.`);
  } catch (error) {
    if (!isNotFound(error)) throw error;

    await client.request(
      createCollection({
        collection: COLLECTION,
        meta: {
          collection: COLLECTION,
          icon: 'email',
          note: 'Contact form submissions',
        },
        schema: {
          name: COLLECTION,
        },
      })
    );

    console.log(`Collection "${COLLECTION}" created.`);
  }
}

async function ensureField(fieldName, payload) {
  try {
    await client.request(readField(COLLECTION, fieldName));
    console.log(`Field "${COLLECTION}.${fieldName}" already exists.`);
  } catch (error) {
    if (!isNotFound(error)) throw error;

    await client.request(createField(COLLECTION, payload));
    console.log(`Field "${COLLECTION}.${fieldName}" created.`);
  }
}

function isNotFound(error) {
  return (
    isDirectusError(error) &&
    (error?.extensions?.code === 'NOT_FOUND' || error?.extensions?.code === 'RECORD_NOT_FOUND')
  );
}

async function main() {
  await ensureCollection();

  await ensureField('id', {
    field: 'id',
    type: 'integer',
    schema: {
      name: 'id',
      table: COLLECTION,
      is_primary_key: true,
      has_auto_increment: true,
    },
    meta: {
      hidden: true,
      interface: 'input',
    },
  });

  await ensureField('name', {
    field: 'name',
    type: 'string',
    schema: {
      name: 'name',
      table: COLLECTION,
      is_nullable: true,
    },
    meta: {
      interface: 'input',
      display: 'formatted-value',
      required: false,
      note: 'Name provided on the contact form',
    },
  });

  await ensureField('email', {
    field: 'email',
    type: 'string',
    schema: {
      name: 'email',
      table: COLLECTION,
      is_nullable: false,
    },
    meta: {
      interface: 'input',
      display: 'formatted-value',
      required: true,
      note: 'Email address to reply to',
    },
  });

  await ensureField('message', {
    field: 'message',
    type: 'text',
    schema: {
      name: 'message',
      table: COLLECTION,
      is_nullable: false,
    },
    meta: {
      interface: 'textarea',
      required: true,
      note: 'Body of the contact request',
    },
  });

  await ensureField('created_at', {
    field: 'created_at',
    type: 'timestamp',
    schema: {
      name: 'created_at',
      table: COLLECTION,
      is_nullable: false,
    },
    meta: {
      interface: 'datetime-created',
      special: ['date-created'],
      display: 'datetime',
      display_options: {
        relative: true,
      },
    },
  });
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
