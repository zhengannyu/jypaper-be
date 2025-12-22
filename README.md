# jypaper-be

## Directus contact requests setup

Create a contact_requests collection in Directus so that the frontend contact form can successfully submit and store data.

### Prerequisites
- Directus instance available (defaults to http://localhost:8055 from docker-compose).
- Admin static token with permission to manage schema (set as `DIRECTUS_STATIC_TOKEN`).

### One-time setup
Run the helper script to create the collection and fields if they do not already exist:

```bash
DIRECTUS_URL=http://localhost:8055 \
DIRECTUS_STATIC_TOKEN=your_admin_static_token \
node scripts/setup-contact-requests.js
```

The script will ensure the collection exists with fields for `id`, `name`, `email`, `message`, and an auto-populated `created_at` timestamp.
