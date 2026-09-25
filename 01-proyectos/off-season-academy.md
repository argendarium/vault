---
tipo: proyecto
estado: activo
aliases: [Off Season Academy, Radio Academy, Prompt Maestro v2]
stack: [React, Prisma, nginx]
actualizado: 2026-09-25
---
# Off Season Academy

## Resumen
Plataforma de aprendizaje autodidacta con estética industrial/brutalista para radiocomunicaciones, redes, ciberseguridad, rescate y sistemas/DevOps. Lema: "Aprende lo que importa, cuando nadie te está mirando."

## Arquitectura
- Sistema interno de generación de cursos con "Prompt Maestro v2": teoría profunda, varias preguntas por lección, tareas con criterios de éxito y recursos externos.
- Esquema Prisma con categorías, prerrequisitos, objetivos y recursos.
- App "Radio Academy" en React con gamificación (XP, rangos, rachas, logros), sin emojis y con analogías de redes.
- Brazo de contenido en LinkedIn: artículos de unas 500 palabras en 5 bloques (gancho, problema, explicación, aplicación práctica, cierre breve), un concepto por artículo.

## Estado
- Catálogo maestro de 89 cursos en 26 series.
- Primer curso de la serie de 4 sobre VPN mesh con Tailscale generado.

## Pendientes
- [ ] Desplegar Radio Academy en el VPS con autenticación y perfiles.
- [ ] Completar la serie de Tailscale.
- [ ] Ampliar el catálogo en las cinco categorías.

## Decisiones
- Contenido práctico, cero relleno, un concepto por lección. Por qué: lo académico es contraproducente para esta audiencia.
- Analogías redes-radio: frecuencia = IP, CTCSS = tag VLAN, repetidor = router, ROIP = VoIP, SWR = pérdida de paquetes.
