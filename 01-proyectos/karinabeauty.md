---
tipo: proyecto
estado: activo
aliases: [karina beauty center]
stack: [Laravel 13, PHP, Filament 3, Alpine.js, Tailwind v4, Vite]
repo: sin repositorio git
actualizado: 2026-09-25
---
# Karina Beauty Center

## Resumen
Tienda e-commerce de belleza de lujo ("Karina Beauty Center", categoría "E-commerce Luxury" según su propio sistema de diseño). Catálogo de productos, carrito y checkout. Proyecto nuevo, generado el mismo día de esta nota (2026-09-25), aún sin desplegar.

## Arquitectura
- Backend: Laravel 13 + panel admin Filament ^3.3.
- Frontend: Blade + Alpine.js + Tailwind v4, build con Vite.
- Modelos: `Product`, `Category`, `Order`, `User`.
- Rutas públicas: `/` (home), `/producto/{product}`, `/carrito`, `POST /pedido` (checkout).
- Sistema de diseño propio en `design-system/karina-beauty-center/MASTER.md`: paleta "premium dark + gold accent" (negro `#1C1917` + acento dorado `#A16207`), tipografía Cormorant (headings) + Montserrat (body).
- Ruta en esta máquina: `/var/www/karinabeauty`.
- Secretos: `.env` presente (no versionado) — variables típicas de Laravel (mail, AWS/S3, base de datos) todavía sin llenar según `.env.example`.
- **Sin `.git` en el proyecto** — no hay control de versiones todavía.
- **Sin vhost de nginx ni dominio asignado** — no está desplegado.

## Estado
Estructura base de Laravel + Filament + modelos de tienda ya creados, con sistema de diseño definido. Sin repositorio git. Sin desplegar.

## Pendientes
- Iniciar control de versiones (`git init`).
- Definir y configurar dominio + vhost de nginx para publicarlo.
- Completar `.env` real (base de datos, mail, storage).
- Aclarar con Bryan el alcance real de negocio (catálogo, inventario, pagos) — no hay documentación de negocio en el repo más allá del sistema de diseño visual.

## Decisiones
- Sin decisiones fechadas registradas — proyecto recién generado.

## Enlaces
- Repo: sin repositorio git
- Producción: no desplegado
