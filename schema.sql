-- Maktab Class Manager - jalankan SEKALI di Supabase > SQL Editor > New query > Run
create table if not exists public.records (
  id uuid primary key,
  owner uuid not null default auth.uid() references auth.users(id) on delete cascade,
  kind text not null,
  data jsonb not null default '{}'::jsonb,
  deleted boolean not null default false,
  updated_at timestamptz not null default now()
);
create index if not exists records_owner_idx on public.records(owner, kind);

alter table public.records enable row level security;

drop policy if exists "baca data sendiri" on public.records;
drop policy if exists "tambah data sendiri" on public.records;
drop policy if exists "ubah data sendiri" on public.records;
drop policy if exists "hapus data sendiri" on public.records;

create policy "baca data sendiri"  on public.records for select using (owner = auth.uid());
create policy "tambah data sendiri" on public.records for insert with check (owner = auth.uid());
create policy "ubah data sendiri"  on public.records for update using (owner = auth.uid()) with check (owner = auth.uid());
create policy "hapus data sendiri" on public.records for delete using (owner = auth.uid());

-- Realtime
alter table public.records replica identity full;
do $$ begin
  alter publication supabase_realtime add table public.records;
exception when duplicate_object then null; end $$;
