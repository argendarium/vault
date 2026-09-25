---
tipo: proyecto
estado: activo
aliases: [quisqueya news]
stack: [PHP, SQLite, cron]
repo: sin repositorio git
actualizado: 2026-09-25
---
# Quisqueya News (quisqueyanetwork)

## Resumen
Agregador de noticias de República Dominicana. Modelo de negocio nativo en anuncios (sin Google AdSense). Reescribe artículos con IA a partir de fuentes externas.

## Arquitectura
- Backend: PHP plano (sin framework), `src/` con clases propias: `Polls.php` (encuestas), `Ads.php` (anuncios nativos), `Rewriter.php` (reescritura de artículos con IA), `auth.php`, `db.php`, `config.php` (carga `.env` a mano).
- Base de datos: SQLite (`database/database.sqlite`, esquema en `database/schema.sql`).
- Cron: `cron/fetch_sources.php` (trae artículos de fuentes externas) y `cron/rewrite_articles.php` (los reescribe con IA), logueado en `cron/cron.log`.
- Proveedores de IA configurables por orden de preferencia (`AI_PROVIDER_ORDER`): Gemini, Cerebras, Groq, Mistral.
- Público: `public/index.php`, `public/votar.php` (encuestas), `public/anunciate.php` (contratar anuncios).
- Scripts de setup: `scripts/create_admin.php`, `scripts/seed_polls.php`, `scripts/seed_sources.php`.
- Servidor: nginx + PHP-FPM, root en `public/`. Desplegado en `quisqueyanetwork.com`.
- Ruta en esta máquina: `/var/www/quisqueyanetwork`.
- Secretos: `.env` presente (no versionado) — claves: `GEMINI_API_KEY`, `CEREBRAS_API_KEY`, `GROQ_API_KEY`, `MISTRAL_API_KEY` (modelo y orden de proveedor configurables), `APP_NAME`, `APP_URL`, `AUTO_PUBLISH`.
- **Sin `.git` en el proyecto** — no hay control de versiones real hoy.

## Estado
Sitio en vivo en `quisqueyanetwork.com` desde el 2026-09-07. Según el estado registrado previamente, necesita `GEMINI_API_KEY` configurada para empezar a reescribir artículos automáticamente (confirmar si ya se cargó).

## Pendientes
- Confirmar que `GEMINI_API_KEY` (u otro proveedor de `AI_PROVIDER_ORDER`) esté cargada y el cron de reescritura esté corriendo de verdad.
- Iniciar control de versiones (`git init`) — hoy no hay `.git`.
- Modelo de negocio: seguir construyendo el canal de anuncios nativos (`anunciate.php`) en vez de depender de AdSense.

## Decisiones
- 2026-09-07 - Modelo de negocio basado en anuncios nativos propios, sin Google AdSense. Por qué: mayor control y margen que depender de la aprobación/políticas de AdSense.

## Enlaces
- Repo: sin repositorio git
- Producción: https://quisqueyanetwork.com
