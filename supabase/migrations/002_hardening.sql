alter table salespro.products add constraint chk_products_nonneg check (price>=0 and cost>=0 and stock>=0 and low_stock>=0);
alter table salespro.sales add constraint chk_sales_nonneg check (subtotal>=0 and discount>=0 and tax>=0 and delivery>=0 and total>=0 and cogs>=0);
alter table salespro.sale_items add constraint chk_items_qty check (qty>0 and returned_qty>=0 and returned_qty<=qty);
alter table salespro.expenses add constraint chk_expenses_amt check (amount>=0);
alter table salespro.installments add constraint chk_inst check (total>=0 and paid>=0 and paid<=total);
alter table public.profiles force row level security; alter table public.products force row level security; alter table public.customers force row level security; alter table public.sales force row level security; alter table public.expenses force row level security;
revoke all on public.profiles, public.products, public.customers, public.sales, public.expenses from anon;
