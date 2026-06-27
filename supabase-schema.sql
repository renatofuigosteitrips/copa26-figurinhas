-- ============================================================
--  Copa 26 · Figurinhas — schema Supabase (rode no SQL Editor)
--  Cada usuário só enxerga e edita o PRÓPRIO progresso (RLS).
-- ============================================================

create table if not exists public.sticker_progress (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  owned      jsonb not null default '{}'::jsonb,   -- { "BRA14": 1, "MEX5": 1, ... }
  updated_at timestamptz not null default now()
);

-- Liga Row Level Security
alter table public.sticker_progress enable row level security;

-- Políticas: o dono (auth.uid()) faz tudo; ninguém vê dado dos outros
drop policy if exists "progress_select_own" on public.sticker_progress;
create policy "progress_select_own"
  on public.sticker_progress for select
  using (auth.uid() = user_id);

drop policy if exists "progress_insert_own" on public.sticker_progress;
create policy "progress_insert_own"
  on public.sticker_progress for insert
  with check (auth.uid() = user_id);

drop policy if exists "progress_update_own" on public.sticker_progress;
create policy "progress_update_own"
  on public.sticker_progress for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- (Opcional) deletar a própria conta de progresso
drop policy if exists "progress_delete_own" on public.sticker_progress;
create policy "progress_delete_own"
  on public.sticker_progress for delete
  using (auth.uid() = user_id);
