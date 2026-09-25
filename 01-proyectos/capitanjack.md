---
tipo: proyecto
estado: activo
aliases: [capitán jack, jackcana tours, cap.vendara.com.do]
stack: [Laravel 13, PHP 8.3, Filament 3, Blade, Tailwind v4, Vite, SQLite]
repo: /var/www/capitanjack (git local, sin remoto)
actualizado: 2026-09-25
---
# Capitán Jack (JackCana Tours)

## Resumen
Sitio de reservas para excursiones en barco (party boat) en Punta Cana, República Dominicana. Negocio real de turismo bajo `vendara.com.do`, sin relación con Reputation Bundle ni las demás propiedades de Bryan (ver [[bundle-origin-and-identity]] si existe).

## Arquitectura
- Backend: Laravel 13.33 (PHP 8.3), panel admin Filament ^3.3.
- Frontend: Blade + Tailwind v4 (sin framework JS), Vite para assets, fuentes self-hosteadas vía bunny() (Instrument Sans + Archivo Black).
- Base de datos: SQLite (`database/database.sqlite`). Sesiones, caché y colas con driver `database` (no Redis).
- Colas: worker systemd `capjack-queue` (activo). Scheduler: `php artisan schedule:run` por cron de `www-data` cada minuto.
- Tickets: QR real firmado con HMAC (`TICKET_SECRET`, librería `chillerlan/php-qrcode`).
- Correo: SMTP de ForwardEmail — credenciales todavía vacías en `.env`, el envío de correo falla hasta configurarlas.
- Servidor: nginx + PHP-FPM 8.3 en este VPS, Cloudflare delante del origen.
- Dominio: desplegado en `cap.vendara.com.do` (subdominio provisional); dominio final planeado `capitanjack.net`.
- Ruta en esta máquina: `/var/www/capitanjack`.
- Secretos: `.env` presente, no versionado — incluye `TICKET_SECRET` (HMAC de los QR: nunca reutilizar `APP_KEY` ni rotarla, invalidaría todos los tickets ya emitidos), credenciales SMTP (vacías), `GOOGLE_REVIEW_URL` (vacío).
- Documentación viva del código: `ARQUITECTURA.md` en el propio repo — se actualiza en el mismo commit que introduce cambios de tablas, rutas o integraciones.

## Estado
Muy activo. Commits recientes: chárteres privados con agenda libre + libro mayor de transferencias/referidos, resumen financiero con gastos en DOP, módulo de contabilidad (gastos categorizados + resumen venta/costo/utilidad), catálogo de productos con inventario real, upsell de checkout (toallas, protector solar, lentes), sistema completo de e-tickets con QR real firmado + check-in + vendors + calificación.

## Pendientes
- Pasarela de pago real (hoy las reservas quedan "pendientes de pago").
- Cargar costo, inventario y activar los 3 extras del catálogo (hoy inactivos a propósito, sin inventar precios/stock).
- Credenciales reales de ForwardEmail en `.env` (sin esto no sale ni un correo).
- Número de WhatsApp real y `GOOGLE_REVIEW_URL` real.
- Analítica/tracking de conversión (Google Ads, Meta Pixel, GA4).
- Dominio final `capitanjack.net` (hoy en `cap.vendara.com.do`).
- `APP_DEBUG=true` → pasar a `false` antes de producción real.
- SPF/DKIM/DMARC del dominio final en Cloudflare.
- Respaldo automático programado de `database/database.sqlite`.

## Decisiones
- 2026-09-24 - Mantener `ARQUITECTURA.md` actualizado en el mismo commit que introduce el cambio. Por qué: es la fuente de verdad del estado real del código para cualquier agente que retome el proyecto.

## Enlaces
- Repo: /var/www/capitanjack (git local, sin remoto)
- Producción: https://cap.vendara.com.do
