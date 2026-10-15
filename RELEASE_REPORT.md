# RELEASE REPORT — SalesPro v1.1.0 (2026-10-15)
Live: https://sales-management-pro.vercel.app/
Done: FORCE RLS salespro (13 tables, anon denied), atomic RPC sales/void/return/pay, CHECK constraints, headers, demo isolation; profit=revenue-COGS-tax-expenses; installments, stock ledger, suppliers/PO; reports From/To + Excel/CSV/PDF, receipts+WhatsApp, settings, audit, backup; Intl currencies, Arabic RTL, SVG nav, hash routing, PWA offline flush, onboarding.
Evidence: unit PASS; Playwright EN/AR/offline 4/4 PASS; axe 0 violations; DB pg_policies=13, pg_proc=6, anon_usage=false. Lighthouse: local run timed out + PSI quota — verify in DevTools (40KB static page, low risk).
Owner actions: rotate legacy service key exposed in earlier transcript (not used by app); enable Supabase Auth email-confirm/rate limits; Vercel env AI_PROVIDER_KEY for paid AI; run rls.mjs with A/B users; Sentry DSN; dedicated Supabase project recommended.
Next: server pagination, invites, logo upload, barcode camera.