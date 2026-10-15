-- RLS proof must run via authenticated API (tests/rls.mjs); SQL editor bypasses RLS.
select relname, relforcerowsecurity as forced from pg_class c join pg_namespace n on n.oid=c.relnamespace where n.nspname='salespro' and relkind='r' order by 1;
select proname from pg_proc p join pg_namespace n on n.oid=p.pronamespace where n.nspname='salespro' order by 1;