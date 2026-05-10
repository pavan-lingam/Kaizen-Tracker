-- Safe to run multiple times -- skips if already exists

create table if not exists processes (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, name text not null, owner text, dept text, status text default 'active', priority text default 'medium', progress int default 0, notes text, sort_order int default 0, updated_at timestamptz default now());
create table if not exists tasks (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, title text not null, cat text default 'Normal', time text, date text, done boolean default false, created_at timestamptz default now());
create table if not exists calendar_events (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, title text not null, date text, time text, type text default 'Meeting', notes text);
create table if not exists plans (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, term text default 'short', title text not null, description text, target_date text, category text default 'Work', status text default 'Not Started', sort_order int default 0);
create table if not exists future_events (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, title text not null, date text, type text default 'Event', notes text);
create table if not exists task_history (id uuid default gen_random_uuid() primary key, user_id uuid references auth.users not null, date text not null, count int default 0, unique(user_id, date));

alter table processes enable row level security;
alter table tasks enable row level security;
alter table calendar_events enable row level security;
alter table plans enable row level security;
alter table future_events enable row level security;
alter table task_history enable row level security;

do $$ begin
  create policy "own" on processes for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;

do $$ begin
  create policy "own" on tasks for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;

do $$ begin
  create policy "own" on calendar_events for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;

do $$ begin
  create policy "own" on plans for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;

do $$ begin
  create policy "own" on future_events for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;

do $$ begin
  create policy "own" on task_history for all using (auth.uid() = user_id);
exception when duplicate_object then null; end $$;
