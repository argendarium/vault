---
tipo: proyecto
estado: activo
aliases: [monitor de despacho, dispatch monitor, fire-monitor]
stack: [Next.js 15, TypeScript, shadcn/ui, Leaflet, Recharts, Prisma, SQLite, SSE]
repo: https://github.com/argendarium/fire-monitor.git
actualizado: 2026-09-25
---
# Monitor de despachos CBDN

## Resumen
Sistema de monitoreo en tiempo real que ingiere los mensajes de despacho del grupo de WhatsApp del departamento de comunicaciones del CBDN y los muestra en un mapa. Necesita un prototipo para presentarlo al mando y obtener aprobación y un número de WhatsApp dedicado. Parte del ecosistema [[fireid]].

## Arquitectura
- Next.js 15 (App Router, TypeScript), shadcn/ui únicamente, Leaflet con CartoDB Dark, Recharts.
- Prisma + SQLite (cambio a PostgreSQL en una línea). Server-Sent Events para tiempo real.
- Parser 100% determinístico basado en reglas: pipeline secuencial de 8 pasos, sin IA.
- Dos pantallas: monitor TV a pantalla completa (mapa, popups en vivo, ticker) y dashboard web de analítica.
- Tipografía Geist Mono + Inter, paleta oscura por variables CSS, sin emojis.
- Formato de mensaje ejemplo: `B-31-B-5 Av Gustavo mejia Ricart #243 sector Quisqueya a un F-1`.
- Archivo KML con ubicación de estaciones disponible.

## Estado
Prototipo en construcción para demo al mando.

## Pendientes
- [ ] Demo con datos reales de mayo 2026 y endpoint de replay que emite un despacho cada 30 s por SSE.
- [ ] Escalar de la estación X4 a las 16 estaciones.

## Decisiones
- Ciclo de vida MVP: activo, escalado, falsa alarma, expirado; cierre automático a las 3 horas por cron; sin cierre manual.
- Popups: se ocultan a los 2 minutos, pila de 3 con opacidad decreciente.
- Todos los incidentes se tratan igual en la interfaz. Por qué: F-1 a F-10 son tipos, no niveles de gravedad; el mapa de calor muestra densidad, no severidad.
