---
tipo: proyecto
estado: activo
aliases: [radar de productos ganadores]
stack: [Python 3.11+, FastAPI, SQLAlchemy 2, SQLite, Apify, Claude API]
repo: /var/www/radar-productos (git local, sin remoto)
actualizado: 2026-09-25
---
# Radar de productos ganadores

## Resumen
Venture nuevo y separado de Bryan: máquina para detectar productos ganadores para e-commerce contra entrega (COD) en República Dominicana, usando México y Colombia como señal adelantada. Piloto en RD, con expansión planeada a otros mercados COD.

## Arquitectura
- Backend: Python 3.11+, FastAPI, SQLAlchemy 2 (SQLite hoy, Postgres después vía `DATABASE_URL`).
- Recolección de datos: Apify (scrapers administrados) para Meta Ad Library y TikTok Creative Center — **nunca** la Graph API oficial de Meta (no devuelve anuncios comerciales fuera de la UE/UK) ni cookies/cuenta personal de Facebook (arriesga la cuenta publicitaria).
- Normalización: Claude API (Haiku 4.5) agrupa anuncios en productos usando visión + texto.
- Scoring: `score = 0.35 longevidad + 0.25 copias + 0.20 intensidad + 0.20 viabilidad`, con penalizaciones por tallas/fragilidad/peso (disparan devoluciones en COD).
- Notificaciones: top 3 diario por Telegram.
- Dashboard: un único HTML (`dashboard/index.html`) servido por FastAPI en `/`, modo oscuro incluido.
- Servicio: corre como systemd `radar-productos.service` (activo, FastAPI/uvicorn).
- Ruta en esta máquina: `/var/www/radar-productos`.
- Secretos: `.env` (no versionado) — claves: `ANTHROPIC_API_KEY`, `APIFY_TOKEN`, `APIFY_MAX_CHARGE_USD`, `CLAUDE_MODEL`, `DATABASE_URL`, `MAX_NORMALIZE_PER_RUN`, `META_ACTOR_ID`, `META_COUNTRIES`, `META_KEYWORDS`, `META_RESULTS_LIMIT`, `TIKTOK_ACTOR_ID`, `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID`, `USD_TO_DOP`, pesos del score (`W_*`).

## Estado
MVP corriendo (setup 2026-09-17). Bloqueado en producción real hasta que Bryan cargue `APIFY_TOKEN` y `ANTHROPIC_API_KEY` reales en `.env`.

## Pendientes
- Enriquecimiento con AliExpress Affiliate API (búsqueda por imagen → proveedor y costo automático).
- Migrar a Postgres + `psycopg[binary]` y docker compose con un contenedor por servicio.
- Aprendizaje: usar resultados de productos en prueba (ganador/descartado) para recalibrar los pesos del score.
- Análisis de comentarios de anuncios para medir intención de compra real.

## Decisiones
- 2026-09-17 - Usar Apify sobre la biblioteca pública de Meta Ad Library en vez de la Graph API oficial. Por qué: la API oficial no devuelve anuncios comerciales fuera de la UE/UK.
- 2026-09-17 - Nunca usar cookies ni cuenta personal de Facebook del usuario en los scrapers. Por qué: arriesga la cuenta publicitaria real de Bryan.

## Enlaces
- Repo: /var/www/radar-productos (git local, sin remoto)
- Producción: http://127.0.0.1:8000 (proxied en radar.vendara.com.do)
