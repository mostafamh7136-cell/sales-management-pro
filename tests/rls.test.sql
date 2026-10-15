-- Verify FORCE RLS
select relname,relrowsecurity,relforcerowsecurity from pg_class c join pg_namespace n on n.oid=c.relnamespace where n.nspname='salespro' and relkind='r';
-- A/B: as user B, select on salespro.products must return 0 of A's rows; insert into A's business must fail; anon must be denied.
