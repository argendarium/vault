---
tipo: proyecto
estado: activo
aliases: [karina beauty center, karinabeauty]
stack: [Laravel 13, PHP, Filament 3, Alpine.js, Tailwind v4, Vite]
repo: git local, sin remoto
actualizado: 2026-09-25
---
# Karina Beauty Center

## Resumen
Ecommerce (catálogo + checkout por WhatsApp) para el negocio de Karina, que vende extensiones de cabello indú de alta calidad. Cliente real de Bryan, similar en naturaleza a [[gruas247-felix-client]] (sitio para un tercero, no producto propio de Bryan). Categoría "E-commerce Luxury" según su propio sistema de diseño.

## Arquitectura
- Backend: Laravel 13 + panel admin Filament ^3.3. Sqlite como base de datos (mismo patrón que capitanjack).
- Frontend: Blade + Alpine.js + Tailwind v4, build con Vite.
- Modelos: `Product`, `Category`, `Order`, `User`.
- Rutas públicas: `/` (home), `/producto/{product}`, `/carrito`, `POST /pedido` (checkout).
- Flujo de compra: catálogo público → carrito (localStorage) → formulario de datos → se crea un pedido en BD y se redirige a WhatsApp con el mensaje del pedido armado. Sin pago en línea (decisión explícita).
- Panel admin (`/admin`) gestiona categorías, productos (fotos, precio, stock, destacado) y pedidos entrantes.
- Sistema de diseño propio en `design-system/karina-beauty-center/MASTER.md`: paleta "premium dark + gold accent" (negro `#1C1917` + acento dorado `#A16207`), tipografía Cormorant (headings) + Montserrat (body).
- Ruta en esta máquina: `/var/www/karinabeauty`.
- `bootstrap/app.php` usa `trustProxies(at: '*')` porque el sitio está detrás de Cloudflare (necesario para URLs https correctas).

## Estado
Desplegado y funcionando en `karina.vendara.com.do` (subdominio temporal bajo vendara.com.do, proxy Cloudflare). Catálogo, carrito y checkout por WhatsApp verificados de punta a punta. Datos de catálogo son de ejemplo (categorías Lacio/Ondulado/Rizado/Kinky Curly, productos placeholder sin fotos reales). Número de WhatsApp, Instagram y dirección en el sitio son placeholders (`config/store.php` vía `.env`).

## Pendientes
- Bryan/Karina: número de WhatsApp real, fotos y precios reales de los productos, Instagram y dirección reales.
- Definir si Karina quiere dominio propio (ej. karinabeautycenter.com) a futuro.
- Verificar con un navegador humano normal si `/admin` carga bien en producción: al probar desde el navegador automatizado de esta sesión (Chrome vía CDP a través de Cloudflare) dio 403, pero el origen (nginx/Laravel) responde correctamente sin pasar por Cloudflare — login, sesión y redirects verificados por ese lado. Posible bloqueo de Cloudflare (Bot Fight Mode / WAF) hacia tráfico de navegador automatizado, similar al caso de [[career-scout-orange-radar]] con Cloudflare Access.

## Decisiones
- 2026-09-25 - Catálogo + checkout por WhatsApp en vez de carrito con pago en línea. Por qué: estándar para negocios pequeños en RD, lanzamiento inmediato sin gestionar pasarela de pago.
- 2026-09-25 - Subdominio temporal `karina.vendara.com.do` en vez de dominio propio. Por qué: lanzar ya, migrar dominio propio después (mismo patrón que Capitán Jack y Radar).
- 2026-09-25 - Stack Laravel + Filament (no PHP plano como gruas247). Por qué: necesita panel admin real para que Karina gestione productos/pedidos sin tocar código.

## Enlaces
- Repo: git local, sin remoto configurado
- Producción: https://karina.vendara.com.do
