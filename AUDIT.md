# AUDIT — SalesPro (2026-10-15)
Live single-file app, Supabase publishable key only (no service_role found). Shared public schema with 50 tables = collision risk.

## Critical
C1 XSS via innerHTML with user data. C2 Browser-trusted totals/profit/stock, no atomic sale. C3 SalesPro in shared public schema. C4 No server AI route/rate limit. C5 Demo fragile isolation.

## High
H1 RLS on old 5 public tables only, no FORCE/A-B proof. H2 Missing security headers. H3 No pw rules/reset/verify UI. H4 Profit lacks tax/delivery/COGS separation, returns/void/installments missing. H5 Hardcoded $, awkward Arabic, emoji, no routing/PWA.

## Medium
No reports/export/receipts/settings/roles/audit/backup/SKU/variants/stock ledger; no meta/tests/CI/migrations/monitoring; a11y gaps.

## Resolution in v1.0
Isolated salespro schema (13 tables, FORCE RLS, authenticated-only), atomic complete_sale/void/return/pay RPCs, safe DOM rendering, hash routing, PWA offline queue, Intl currency, RTL, deterministic insights + /api/ai-summary, reports/receipts/settings, unit+RLS+e2e tests, CI. See RELEASE_REPORT.md.
