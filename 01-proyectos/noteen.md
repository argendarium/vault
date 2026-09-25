---
tipo: proyecto
estado: cerrado
aliases: [noteen]
stack: [JavaScript, Editor.js, GitHub]
actualizado: 2026-09-25
---
# noteen

## Resumen
App de notas en JavaScript puro con sincronización a GitHub, Editor.js, identidad por UUID y offline-first. Construida y desplegada.

## Decisiones
- Separar identidad de la nota del nombre de archivo, y resolver condiciones de carrera en la sincronización concurrente con GitHub.
- En este proyecto se adoptó trabajar diagnosticando primero y con snippets puntuales, no reescrituras completas.
