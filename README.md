# HAFSAN CLOUD STORAGE — Vercel + Supabase

GitHub stores **only website source code**. User uploads go to a **private Supabase Storage bucket**, not GitHub and not Vercel's filesystem.

## 1) Create private storage
1. Create a Supabase project at https://supabase.com/
2. Open **SQL Editor**, paste `supabase_setup.sql`, and Run.
3. Project Settings → API: copy **Project URL** and the **anon/public publishable key**. Never use the service-role key.

## 2) Deploy website to Vercel
1. Upload these project files to a GitHub repository (private repository recommended).
2. Import that repository at https://vercel.com/
3. Framework preset: **Other**. Build command: leave blank. Output directory: `.`. Deploy.
4. Open the deployed URL. Enter your Supabase Project URL and public anon key in the initial setup screen. They are stored in this browser only.

## 3) Create your account
Create account with your email/password. If email confirmation is enabled, confirm the email before signing in. Sign in; files are stored in a private bucket under your user ID.

## Features
- Private user login (Supabase Auth)
- Multi-file upload (50 MB per file limit set in SQL)
- List/search, download and delete files
- Uploads are not committed to GitHub

## Important
- This is a personal starter site. Supabase free-plan storage/bandwidth limits apply.
- Do not share the anon key as a secret (it is designed for browser use); do not ever put a service-role key in the website.
- Configure Supabase Auth email settings. Do not turn off confirmation unless you intentionally want that.
- Use a strong password and enable any account security features available.
- This site is not an SD-card manager: a deployed website cannot browse your phone's full storage automatically. You select files using the phone file picker.
