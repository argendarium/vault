---
tipo: proyecto
estado: activo
aliases: [orange creators minisites, sites.theorangebusiness.com, the orange creators]
stack: [HTML estático]
repo: sin repositorio git
actualizado: 2026-09-25
---
# Minisites (Orange Creators)

## Resumen
Colección de mini-sitios HTML estáticos de una sola página para clientes individuales de "The Orange Creators", el negocio de Bryan de menor prioridad frente a Reputation Bundle (ver [[project-business-priority]] si existe esa nota). Cada archivo es la landing personal de un agente o negocio (seguros, comida, tecnología).

## Arquitectura
- HTML estático puro, sin build ni framework — un archivo por cliente en la raíz del directorio.
- `index.html` es el home de The Orange Creators ("Pides tu sitio a las 9, lo compartes con tus clientes a la 1").
- Sitios de clientes activos: All Print Multiservices, Ángela Salas (Stargate Injury), Arroz Chino Venezolano, Maria Payares (1-800-NO-FAULT), Robert Franco (AT&T), Rosario Viera, Yenis Díaz (1-800-NO-FAULT), Yuli Fajardo (Stargate Injury).
- Servidor: nginx, root directo en `/var/www/minisites`. Desplegado en `sites.theorangebusiness.com`.
- Ruta en esta máquina: `/var/www/minisites`.
- Sin secretos ni backend — no hay `.env`.

## Estado
Publicado y activo con 8 mini-sitios de clientes reales.

## Pendientes
- Sin roadmap documentado en el directorio (sin README ni CLAUDE.md propios).

## Decisiones
- Sin decisiones fechadas registradas en el propio directorio.

## Enlaces
- Repo: sin repositorio git
- Producción: https://sites.theorangebusiness.com
