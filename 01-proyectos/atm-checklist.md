---
tipo: proyecto
estado: activo
aliases: [checklist atm, checklist triinet]
stack: [Python, FastAPI, SQLite, systemd, nginx]
repo: /var/www/atm-checklist (git local, sin remoto)
actualizado: 2026-09-25
---
# Checklist ATM

## Resumen
Microservicio para que los técnicos de campo (trabajo de Bryan en Triinet, ver [[preferencias]]) completen el checklist de mantenimiento de cajeros ATM desde el celular, con el progreso guardado en el servidor — no en el dispositivo — para poder continuar un checklist entre turnos o técnicos distintos.

## Arquitectura
- Backend: Python 3 + FastAPI, base de datos SQLite (`data/checklist.db`, se crea sola).
- Auth: cuentas por técnico gestionadas por CLI (`scripts/create_user.py add|list|passwd|remove`); el último commit agregó login por magic-link.
- Frontend: HTML/JS estático servido por el propio backend (`static/`: login, sesiones, checklist).
- Evidencia fotográfica por paso, roles de usuario, correo de finalización con plantilla de marca.
- Infraestructura: servicio systemd `atm-checklist` (activo, confirmado con `systemctl is-active`), puerto interno 47391 solo en `127.0.0.1`, expuesto por nginx vía proxy en `checklist.vendara.com.do`.
- Ruta en esta máquina: `/var/www/atm-checklist`.
- Secretos: `.env` (secreto de sesión) — presente, no versionado, no listado en `.env.example` con valores reales.

## Estado
Activo y corriendo en producción. Último commit: mover el proyecto a `/var/www`, login por magic-link, correos con plantilla de marca.

## Pendientes
- Sin pendientes explícitos documentados en el repo.

## Decisiones
- 2026-09-05 - El progreso del checklist se guarda en el servidor, no en el celular. Por qué: permite que un técnico distinto continúe un checklist que otro empezó en un turno diferente, sin perder nada.

## Enlaces
- Repo: /var/www/atm-checklist (git local, sin remoto)
- Producción: https://checklist.vendara.com.do
