---
tipo: proyecto
estado: activo
aliases: [The Orange Creators, microsites, orange creators minisites, sites.theorangebusiness.com, minisites]
stack: [HTML estático]
repo: sin repositorio git
actualizado: 2026-09-25
---
# The Orange Creators (Minisites)

## Resumen
Servicio de sitios web profesionales (microsites) entregados en 4 horas a precio fijo, bajo The Orange Business. El negocio de Bryan de menor prioridad frente a [[reputation-bundle]] (ver [[project-business-priority]]). En producción es una colección de mini-sitios HTML estáticos de una sola página para clientes individuales — la landing personal de un agente o negocio (seguros, comida, tecnología).

## Arquitectura (real, desplegada)
- HTML estático puro, sin build ni framework — un archivo por cliente en la raíz del directorio.
- `index.html` es el home de The Orange Creators ("Pides tu sitio a las 9, lo compartes con tus clientes a la 1").
- Sitios de clientes activos: All Print Multiservices, Ángela Salas (Stargate Injury), Arroz Chino Venezolano, Maria Payares (1-800-NO-FAULT), Robert Franco (AT&T), Rosario Viera, Yenis Díaz (1-800-NO-FAULT), Yuli Fajardo (Stargate Injury).
- Servidor: nginx, root directo en `/var/www/minisites`. Desplegado en `sites.theorangebusiness.com`.
- Ruta en esta máquina: `/var/www/minisites`.
- Sin secretos ni backend — no hay `.env`.

## Pipeline descrito (no confirmado contra lo real)
Una descripción anterior de este proyecto menciona un pipeline por lotes en Node.js/Handlebars que genera HTML a partir de archivos JSON por cliente, en verticales como legal, comida y auto — no coincide con la arquitectura real de arriba (archivos HTML estáticos sueltos, sin pipeline de generación visible). Se conserva sin borrar por si describe un plan o una versión anterior; confirmar con Bryan cuál es la vigente.

## Estado
Publicado y activo con 8 mini-sitios de clientes reales.

## Pendientes
- Sin roadmap documentado en el directorio (sin README ni CLAUDE.md propios).

## Decisiones
- Sin decisiones fechadas registradas en el propio directorio.

## Enlaces
- Repo: sin repositorio git
- Producción: https://sites.theorangebusiness.com
- Contacto: contacto@theorangebusiness.com
