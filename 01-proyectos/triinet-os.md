---
tipo: proyecto
estado: activo
aliases: [TRIINET OS]
stack: [Astro, SQLite, FastAPI, Telegram]
actualizado: 2026-09-25
---
# TRIINET OS

## Resumen
Plataforma interna de operaciones de campo para servicio de cajeros e infraestructura bancaria. Ver [[triinet]].

## Arquitectura
- Módulos: despacho, notificaciones, auditoría e inteligencia documental.
- Seguimiento de acondicionamiento de ATMs: Astro + SQLite + bot de Telegram + microservicio OCR en FastAPI.
- Sistema de diseño: paleta slate oscura con ámbar, sin emojis, bordes rounded-lg en todo.
