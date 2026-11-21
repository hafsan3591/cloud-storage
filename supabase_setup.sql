-- Run this in Supabase Dashboard > SQL Editor.
-- Creates a private bucket and limits access to each signed-in user folder.
insert into storage.buckets (id, name, public, file_size_limit)
values ('hafsan-private', 'hafsan-private', false, 52428800)
on conflict (id) do update set public = false, file_size_limit = 52428800;

create policy "Users can list their own folder"
on storage.objects for select to authenticated
using (bucket_id = 'hafsan-private' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Users can upload to their own folder"
on storage.objects for insert to authenticated
with check (bucket_id = 'hafsan-private' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Users can delete their own files"
on storage.objects for delete to authenticated
using (bucket_id = 'hafsan-private' and (storage.foldername(name))[1] = auth.uid()::text);
