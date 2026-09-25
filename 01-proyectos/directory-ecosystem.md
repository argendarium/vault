---
tipo: proyecto
estado: activo
aliases: [directorio de contratistas, directory.vendara.com.do]
stack: [Laravel 13, PHP, Filament 3, Python (scripts de import)]
repo: sin repositorio git
actualizado: 2026-09-25
---
# Directory Ecosystem (directorio de contratistas)

## Resumen
Directorio de contratistas (por número de licencia) con backend Laravel + panel Filament y una API REST. Por el modelo `Prospect` y los scripts de importación en la raíz del backend, parece alimentarse de datos de licencias de contratistas — el mismo tipo de leads que usa Reputation Bundle ([[reputation-bundle]]) — para mostrarlos en un directorio público navegable.

## Arquitectura
- Backend: Laravel 13 + Filament (`ProspectResource` en el panel admin). Modelos: `Prospect`, `Category`, `User`.
- Rutas públicas: `/` (landing), `/contractor/{license}` (ficha de contratista).
- API: `GET /api/v1/prospects`, `/api/v1/prospects/{license_number}`, `/api/v1/categories`.
- Scripts Python sueltos en la raíz de `backend/` (`fix_names.py`, `parse_to_db.py`, `clean_import.py`, `fix_db.py`) para limpiar/importar datos de licencias a la base.
- `frontend/` y `services/` existen como carpetas vacías dentro del proyecto — planeados, no construidos todavía.
- Servidor: nginx + PHP-FPM 8.3, root en `backend/public`. Desplegado en `directory.vendara.com.do`.
- Ruta en esta máquina: `/var/www/directory-ecosystem`.
- Secretos: `.env` y un backup `.env.bak-20260905011123` dentro de `backend/` (no versionados).
- **Sin `.git` en el proyecto** — no hay control de versiones real hoy, todo el historial depende de esos backups manuales de `.env`.

## Estado
Backend y panel admin funcionando con datos de prospectos ya cargados. Frontend y la capa de "services" (mencionados en la estructura de carpetas) aún no se construyeron. No tiene README ni CLAUDE.md propios — solo queda el README genérico de Laravel.

## Pendientes
- Iniciar control de versiones (`git init` en `/var/www/directory-ecosystem/backend` como mínimo).
- Construir `frontend/` y `services/` (carpetas vacías, sin definición documentada de qué van a hacer).
- Documentar el propósito real del proyecto y su relación con Reputation Bundle (no hay ninguna nota de negocio en el repo).

## Decisiones
- Sin decisiones fechadas registradas — no hay README de proyecto ni CLAUDE.md.

## Enlaces
- Repo: sin repositorio git
- Producción: http://directory.vendara.com.do
