---
tipo: proyecto
estado: activo
aliases: [orange radar, job scout, career.vendara.com.do]
stack: [Python, FastAPI, React, Vite]
repo: /var/www/career-scout (git local, sin remoto)
actualizado: 2026-09-25
---
# Career Scout (Orange Radar)

## Resumen
Herramienta personal de Bryan para su búsqueda de trabajo — no es un producto de Reputation Bundle. Escanea vacantes en Canadá y Estados Unidos, las cruza contra su perfil profesional y arma un digest diario de las mejores oportunidades para aplicar. Diseño deliberadamente "asistido, no auto-apply": el sistema encuentra/filtra/prepara, Bryan aprueba el envío final, para evitar el riesgo de ban de cuenta por bots en LinkedIn/Indeed.

## Arquitectura
- Backend: FastAPI (`backend/`), pensado para separarse en microservicios (scanner, matcher, notificador) a medida que crezca. Corre como servicio systemd `career-scout-backend` (activo).
- Frontend: React + Vite (`frontend/`), build servido como estáticos.
- Fuentes de vacantes: APIs públicas y legítimas — RemoteOK, Arbeitnow, Greenhouse. Sin scraping a LinkedIn/Indeed.
- Motor de matching por keywords (roles + skills + ubicación/modalidad).
- Servidor: nginx (proxy `/api` + estáticos) + systemd, sin Docker. Desplegado en `career.vendara.com.do`.
- Ruta en esta máquina: `/var/www/career-scout`.
- Secretos: `.env` en `backend/` (no versionado, no hay `.env.example`) — claves: `OWNER_EMAIL`, `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS`, `SMTP_FROM_NAME`, `SESSION_COOKIE_NAME`, `PUBLIC_BASE_URL`.

## Estado
Perfil cargado, scanner conectado a las 3 fuentes y motor de matching funcionando end-to-end. Ya desplegado en este VPS con systemd + nginx, HTTPS y cron para el scan diario (ver `DEPLOY.md` del repo).

## Pendientes
- Verificar resultados reales en producción y ajustar el scoring.
- Sumar más fuentes (Adzuna, Job Bank Canada, Lever).
- Notificación por email del digest diario.
- Generador de CV/cover letter adaptado por vacante.
- Autenticación básica para `PUT /profile`.

## Decisiones
- Sin decisiones fechadas registradas en el repo.

## Enlaces
- Repo: /var/www/career-scout (git local, sin remoto)
- Producción: https://career.vendara.com.do
