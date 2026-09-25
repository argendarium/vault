---
tipo: proyecto
estado: activo
aliases: [reputation bundle, bundle.theorangebusiness.com, the orange business, Review Automation]
stack: [HTML/CSS/JS estático, PHP, Python, SQLite, Telnyx, Twilio]
repo: /var/www/reputation-bundle-site (git, remoto github.com/argendarium/reputation-bundle-site)
actualizado: 2026-09-25
---
# Reputation Bundle

## Resumen
Producto principal de Bryan (prioridad sobre Orange Creators — ver [[minisites]]): gestión de reputación/reseñas de Google para contratistas de servicios en EE.UU. (roofing, HVAC, plomería, tree service, house cleaning, pressure washing, property managers). Bundle de herramientas: sitio de marketing multi-idioma, CRM/scraper de leads, agente de llamadas con IA, y generación de contenido/blog. A la fecha, cero clientes reales pagando — el cuello de botella es outreach/ventas, no producto.

## Arquitectura
El proyecto vive repartido en dos directorios de esta máquina:

**`/var/www/reputation-bundle-site`** (con `.git`, remoto `git@github.com:argendarium/reputation-bundle-site.git`) — el repo real:
- Sitio: HTML/CSS/JS estático sin build ni framework, cada página es un `.html` completo servido directo por nginx. Home en 3 idiomas (`/`, `es/`, `fr/` — URLs reales, no toggle). Landing por oficio (`roofing/`, `hvac/`, `plumbing/`, `tree-service/`, `house-cleaning/`, `pressure-washing/`, `property-managers/`). Blog con publicación programada vía cron root que se autoborra al terminar (ver `README.md` del repo para el mecanismo completo).
- `partials/` es la fuente única del nav/footer — se inyectan a las 14 páginas con `sync_partials.py` (nunca editar página por página).
- `api/lead.php` + `api/lib/`: guarda leads en SQLite, envía correo, verifica Cloudflare Turnstile.
- `caller-agent/`: agente de llamadas con IA (Python) — ver [[twilio-migration]]. Corre como servicio systemd `caller-agent` (activo), expuesto en `caller.theorangebusiness.com` (proxy a `127.0.0.1:8000`). Migrado de Telnyx a Twilio el 2026-09-15 tras 12+ días de error 90046 sin resolver (ver [[project-twilio-migration]]). Secretos en `caller-agent/.env`: `ANTHROPIC_API_KEY`, `DEEPGRAM_API_KEY`, `TELNYX_*`, `TWILIO_ACCOUNT_SID`/`AUTH_TOKEN`/`FROM_NUMBER`, `CALL_PROVIDER`, límites de llamada.
- `scrapper/`: scraper de leads (Python), usa `SERPAPI_KEY`.
- Deploy sin CI/CD: scp archivo por archivo a `/var/www/bundle.theorangebusiness.com/` en este VPS, luego `chown www-data:www-data` + `chmod 644`.

**`/var/www/bundle.theorangebusiness.com`** (sin `.git`) — la copia desplegada en producción, root real del vhost nginx `bundle.theorangebusiness.com`. Es el destino del deploy manual descrito arriba, no un repo independiente.

**`/var/www/reputation-bundle/scrapper`** (sin `.git`) — copia de trabajo suelta del scraper de leads (mismo propósito que `reputation-bundle-site/scrapper`, con salidas ya generadas en `output/`: CSVs/JSONs de leads y `outreach_templates.md`).

- Dominio adicional relacionado, actualmente cerrado por seguridad: `leer.vendara.com.do` apuntaba al mismo backend interno (`127.0.0.1:8000`) que `caller.theorangebusiness.com` sin restricción — devuelve 404 a propósito hasta confirmar si tiene un propósito distinto.
- Pagos: LemonSqueezy, plan Founding $199 / Standard $299, flujo de pago-antes-del-formulario, sin reembolsos pero cancelación en cualquier momento (ver [[project-payments]] en memoria de sesión).
- Ruta en esta máquina: `/var/www/reputation-bundle-site` (fuente), `/var/www/bundle.theorangebusiness.com` (producción), `/var/www/reputation-bundle` (scraper suelto).

## Estado
CRM/scraper, agente de llamadas con IA y generación de contenido están construidos y funcionando. El bloqueo real es comercial: cero clientes reales pagando — outreach y ventas son el cuello de botella, no el producto (ver [[project-reputation-bundle-zero-clients]] en memoria de sesión). Enlaces de autoridad con Orange Creators ya cerrados (footer cruzado bidireccional). Verificación del Google Business Profile y Search Console siguen pendientes.

## Pendientes
- Verificar el Google Business Profile (falta grabar el video de verificación, en pausa a propósito).
- Verificar propiedad en Search Console y enviar `sitemap.xml`.
- Directorios locales (Bing Places, Apple Business Connect, LinkedIn, cámara de comercio de Polk County) — requiere que Bryan cree las cuentas directamente.
- Decidir dominio propio vs. subdominio — por ahora se queda en `bundle.theorangebusiness.com` hasta que el proyecto genere ingresos.
- Contactar asociaciones gremiales de Florida (FRSA, RCASF, Florida PHCC, Florida ACCPA) para enlaces de autoridad — objetivos identificados, pendiente que Bryan los contacte.
- Confirmar si `leer.vendara.com.do` tiene un propósito real o se puede eliminar del todo.
- Resolver cómo recibir USD sin LLC en EE.UU. (PayPal Business o Wise Business).
- Contactar a los 13 prospectos reales de Kissimmee del tracker.

## Decisiones
- 2026-08-29 - Pivote de Canadá bilingüe ($199 CAD) a Florida. Por qué: EE.UU. paga más fácil por servicios digitales y Bryan se muda allá.
- 2026-08-29 - Concierge manual en vez de construir la plataforma de 8 fases. Por qué: ingresos inmediatos.
- Mobile Text Alerts solo como canal secundario. Por qué: está hecho para suscriptores opt-in, no para outreach en frío.
- 2026-09-15 - Migrar el caller-agent de Telnyx a Twilio. Por qué: 12+ días con el error 90046 de Telnyx sin resolver (ver [[project-twilio-migration]]).
- Enlaces de autoridad Fase 4 cerrados entre Orange Creators y Reputation Bundle (footer cruzado bidireccional).

## Enlaces
- Repo: https://github.com/argendarium/reputation-bundle-site
- Producción (sitio): https://bundle.theorangebusiness.com
- Producción (caller-agent): https://caller.theorangebusiness.com

## Importado de otra sesión/máquina (2026-08-29, verificar si sigue vigente)
Nota fusionada desde `vault-import.zip`; describe un modelo anterior (concierge, $149-249/mes) que parece haber evolucionado al modelo self-serve actual (LemonSqueezy, $199-299) descrito arriba. Se conserva sin borrar por si algo de esto sigue aplicando.

- Modelo: Precio Founding Partner $149/mes fijo para los primeros 10 negocios, luego $249/mes. Incluye respuestas a reseñas con Claude, solicitudes de reseña manuales y reporte mensual.
- Leads: Apollo.io y Outscraper (mejor para teléfono, rating y cantidad de reseñas).
- Diseño: fondo charcoal, tarjetas color crema tipo ticket, naranja/ámbar de marca. Scoutie Sans (títulos), Public Sans (cuerpo), IBM Plex Mono (etiquetas).
- Copy centrado en un momento concreto: el cliente que prometió una reseña y nunca la dejó.
- Ruta mencionada en el VPS: `/opt/reputation-bundle/` (no coincide con las rutas `/var/www/...` de arriba — confirmar cuál es la vigente).
