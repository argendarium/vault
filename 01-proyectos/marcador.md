---
tipo: proyecto
estado: activo
aliases: ["marcador.lol"]
stack: [FastAPI, Next.js, PostgreSQL, Stripe, Telegram bot, systemd, nginx]
repo: git@github.com-marcador:argendarium/marcador.git
actualizado: 2026-10-03
---
# marcador.lol

## Resumen
Ranking público de pago para marcas y negocios dominicanas ("no manda el
algoritmo, manda el que más paga"). Monolito modular: API en FastAPI,
frontend en Next.js, bot de Telegram para alertas internas. En
producción, servido en `srv1129784` (el mismo servidor donde vive este
vault).

## Arquitectura
- `apps/api`: FastAPI, Python 3.11, Postgres via SQLAlchemy/Alembic.
  Modulos: ranking, pagos, marcas, apoyos, logros, notificaciones,
  tarjetas, newsletter, videos, deploy.
- `apps/web`: Next.js 16 (Turbopack).
- `apps/bot`: bot de Telegram (alertas de pagos/apoyos al dueño).
- Sin Docker: cada app corre nativa, 3 servicios systemd
  (`marcador-api` puerto 8020, `marcador-web` puerto 3020,
  `marcador-bot`), nginx como proxy + TLS (certbot).
- Pagos con Stripe (checkout con Elements, webhooks separados para
  `pagos` y `apoyos`).

## Estado
Deploy automático funcionando end-to-end desde 2026-10-03: push a
`master` en GitHub → webhook firmado (`POST /api/deploy/webhook`,
HMAC-SHA256) → `deploy/deploy.sh` (en el propio servidor, corre como
`www-data`) → git pull + pip/npm install + alembic upgrade + build de
Next.js + restart de los 3 servicios. Documentado en
`deploy/README.md` del repo.

Infra de soporte que quedó aplicada en el servidor (no versionada):
- `/etc/sudoers.d/marcador-deploy`: `www-data` puede reiniciar sin
  password SOLO esos 3 servicios (nada más).
- `deploy/marcador_deploy` + `deploy/ssh_config`: copia de la Deploy
  Key de solo lectura de GitHub, para que `www-data` (sin
  `~/.ssh/config` propio) pueda hacer `git pull`.
- `/swapfile` de 4GB en `/etc/fstab`: el servidor tiene solo 3.8GB RAM
  y `next build` se quedaba sin memoria (OOM) sin swap.
- Webhook de GitHub creado via `gh api` (hook id `691780234`, evento
  `push`), secreto en `DEPLOY_WEBHOOK_SECRET` (`apps/api/.env`, no
  versionado).

## Pendientes
- [ ] Verificar disponibilidad de marcador.lol/marcador.com.do, marca en INDOCAL, usuarios en redes.
- [ ] Resolver entidad legal/moneda de la cuenta Stripe y metodo de respaldo para tarjetas dominicanas.
- [ ] Definir montos minimos y umbrales de clubes (bronce/plata/oro son placeholders).
- [ ] Terminos, privacidad y politica de reembolsos (con abogado).
- [ ] Definir quien opera videos, newsletter y menciones en redes.
- [ ] Rotar logs de `deploy/deploy.log` (hoy crece sin limite).

## Decisiones
- 2026-10-03 - Deploy automático via webhook en la propia API (no GitHub Actions por SSH, no cron polling). Por qué: instantáneo, no abre SSH entrante nuevo, reutiliza la infraestructura HTTPS/nginx ya existente; el servidor ya pull-eaba el repo con una Deploy Key propia (patrón ya usado en otros proyectos de este server: `radar_deploy`, `career_scout_deploy`, etc.).
- 2026-10-03 - `marcador-api` se reinicia SIEMPRE al final en `deploy.sh`. Por qué: el script corre como proceso hijo de la API (el webhook lo lanza), y el `KillMode=control-group` default de systemd mata todo el cgroup al reiniciar ese servicio — si se reiniciaba primero, el script moría a mitad de camino y nunca llegaba a reiniciar bot/web.
- 2026-10-03 - Se agregó swap de 4GB permanente. Por qué: `next build` tronaba por OOM en el VPS de 3.8GB RAM sin swap; es necesario en cada deploy, no solo esta vez.

## Enlaces
- Repo: git@github.com-marcador:argendarium/marcador.git (Deploy Key dedicada, ver `/root/.ssh/config` host `github.com-marcador`)
- Producción: https://marcador.lol
- Deploy: `deploy/README.md` en el repo
