---
tipo: proyecto
estado: activo
aliases: [titán grúas rd, grúas 24/7, titangruasrd.do, gruasrd247.com.do, félix drake]
stack: [PHP, dompdf]
repo: /var/www/gruas247 (git local, sin remoto)
actualizado: 2026-09-25
---
# Titán Grúas RD (ex Grúas 24/7)

## Resumen
Plataforma de despacho de grúas en República Dominicana para un cliente real, Félix Drake (SRL en trámite). Landing + solicitud de servicio estilo InDrive (el cliente propone su propio precio) + panel de choferes + panel admin. Rebrand de "Grúas 24/7" a "Titán Grúas RD" el 2026-09-23.

## Arquitectura
- Backend: PHP plano sin framework; `composer.json` solo trae `dompdf/dompdf` (para recibos/PDF).
- Estructura: `api/` (leads, pricing, solicitudes, choferes, admin), `admin/`, `chofer/` (panel de choferes), `alianza/`, `legal/` (privacidad y términos), `docs/superpowers/` (specs/plans de desarrollo).
- Choferes: registro, login, consentimiento, actualización de ubicación en vivo (`api/driver_location_update.php`).
- Precios: el cliente fija su propio precio en `/solicitar/` (estilo InDrive) — `api/pricing.php` / `api/admin_pricing_save.php`.
- Correo: `api/lib/smtp_mailer.php` + `api/lib/email_templates.php`.
- No hay `.env` — la configuración vive directo en el código PHP (revisar `api/lib/db.php` para credenciales de base de datos si hace falta rotarlas).
- Servidor: nginx, root `/var/www/gruas247`. **Dos dominios activos apuntan al mismo root**: `titangruasrd.do` (nuevo, principal) y `gruasrd247.com.do` (legado, ver [[twilio-migration]] y [[project-business-priority]] si aplican).
- Ruta en esta máquina: `/var/www/gruas247`.

## Estado
En desarrollo activo. Commits recientes: rediseño del hero a dos columnas y sección de ventaja tecnológica, rebrand completo de línea gráfica (ámbar/hazard → azul/rojo de Titán Grúas RD), corrección de hallazgos de seguridad (exposición de fuente PHP, rate-limit por IP real, visibilidad del precio ofertado, throttle de ubicación, UI admin de email de chofer, unicidad de email, smoke test endurecido), precio propio del cliente estilo InDrive, páginas legales (privacidad/términos).

## Pendientes
- Confirmar migración/apagado completo de `gruasrd247.com.do` hacia `titangruasrd.do` (DNS/redirects) — hoy ambos dominios sirven el mismo sitio.
- App móvil para choferes/clientes sigue siendo solo un pitch, sin desarrollo iniciado.
- Formalización de la SRL de Félix Drake (en trámite — no es un pendiente técnico, pero condiciona el contrato).

## Decisiones
- 2026-09-23 - Rebrand de "Grúas 24/7" a "Titán Grúas RD" con dominio `titangruasrd.do`.
- 2026-09-23 - Cambio de línea gráfica de ámbar/hazard a azul/rojo, coherente con el nuevo naming.

## Enlaces
- Repo: /var/www/gruas247 (git local, sin remoto)
- Producción: https://titangruasrd.do (alias activo: https://gruasrd247.com.do)
