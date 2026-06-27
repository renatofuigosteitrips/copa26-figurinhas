# Copa 26 · Figurinhas

App web pra controlar o álbum Panini da Copa do Mundo 2026. Cada usuário cria conta,
entra e gerencia o próprio álbum (980 figurinhas + Coca-Cola + Extras), com calculadora
de custo pra completar e lista de faltantes pronta pra trocar.

**Stack:** `index.html` estático + Supabase (auth + Postgres com Row Level Security).
Sem build.

## Rodar
1. Crie um projeto no Supabase e rode `supabase-schema.sql` no SQL Editor.
2. Em Project Settings → API, copie a **Project URL** e a **anon key**.
3. No topo do `<script>` em `index.html`, preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY`.
4. Publique (Vercel ou GitHub Pages) e aponte o domínio.

Cada progresso é um JSON por usuário; ninguém vê o álbum do outro (RLS).
