# MallIQ — privacy-safe demo

Privacy-safe shopping mall ERP demo with simulated tenants, occupancy, and work orders.

**Live demo:** https://malliq.pages.dev/

Part of the OmegaAPI set of small, free, demo-ready builds.

Built by **Krishna Prakash Ojha (Leon)** at **OmegaAPI** · [omegaapi.com](https://omegaapi.com)

> Simulated data only. No real customer, patient, student, tenant, or inventory records are used.

---

## What it shows

- 10 sample units — Fictional tenants
- No billing — No invoices or payment code
- Local log only — Nothing sent to a server
- Free to host — Cloudflare free tier
- A three-step workflow and four quick actions
- An activity log stored in the demo database

## Full-stack architecture

- Frontend: static HTML/CSS/JS served by Cloudflare Pages.
- Backend: Pages Functions with a D1 binding named `DB`.
- Database: shared D1 database `omegaapi-demos`; this app uses its own namespace `MallIQ`.
- API:
  - `GET /api/state` — read config, records, and activity.
  - `POST /api/action` — record a simulated quick action.
  - `POST /api/records` — add a server-generated sample row.
  - `DELETE /api/records?id=<id>` — remove a sample row.
  - `POST /api/reset` — restore original simulated seed data.

Apply the schema once before the first deploy:

```bash
npm run db:seed
```

## Safety and privacy

Tenant names and units are invented. No invoices, contracts, or customer data are processed.

Original local SVG illustrations are included in this repository. No stock photos, real people, or external images are used.

There is no sign-up, no payment code, no API key, and no external data service. A Cloudflare D1 database stores only invented seed rows and simulated action logs. The signed three-day preview cookie is set by a Pages Function and contains only an expiry timestamp.

## Run locally

```bash
npm install
npm test
npm run dev
```

Open `http://localhost:8788`.

## Deploy

```bash
npm run db:seed
wrangler pages secret put DEMO_TRIAL_SECRET --project-name malliq
npm run deploy
```

Set `DEMO_TRIAL_SECRET` to a long random value. Never commit it.

## Support

Goal: **10 monthly sponsors** · tiers from **$5 to $250**. [View tiers](https://github.com/sponsors/omegaapi-india?interval=monthly).

[♥ Sponsor OmegaAPI](https://github.com/sponsors/omegaapi-india)

Contact: [info@omegaapi.com](mailto:info@omegaapi.com) · [Telegram](https://t.me/Omegaapiofficial)

## License

MIT — Copyright © 2026 Krishna Prakash Ojha (Leon), OmegaAPI.
