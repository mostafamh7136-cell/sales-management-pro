-- Run in Supabase Dashboard > SQL Editor
create table if not exists public.profiles (id uuid primary key, email text, business_name text, business_type text, created_at timestamptz default now());
create table if not exists public.products (id uuid primary key default gen_random_uuid(), user_id uuid not null, name text not null, price numeric default 0, cost numeric default 0, stock int default 0, category text, extra jsonb default '{}'::jsonb, created_at timestamptz default now());
create table if not exists public.customers (id uuid primary key default gen_random_uuid(), user_id uuid not null, name text not null, phone text, email text, notes text, created_at timestamptz default now());
create table if not exists public.sales (id uuid primary key default gen_random_uuid(), user_id uuid not null, customer_name text, items jsonb default '[]'::jsonb, total numeric default 0, profit numeric default 0, payment_method text default 'Cash', created_at timestamptz default now());
create table if not exists public.expenses (id uuid primary key default gen_random_uuid(), user_id uuid not null, title text not null, amount numeric default 0, category text, created_at timestamptz default now());
alter table public.profiles enable row level security;
alter table public.products enable row level security;
alter table public.customers enable row level security;
alter table public.sales enable row level security;
alter table public.expenses enable row level security;
create policy "own profiles" on public.profiles for all using (auth.uid()=id) with check (auth.uid()=id);
create policy "own products" on public.products for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own customers" on public.customers for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own sales" on public.sales for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own expenses" on public.expenses for all using (auth.uid()=user_id) with check (auth.uid()=user_id);