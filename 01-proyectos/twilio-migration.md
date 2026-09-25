---
tipo: proyecto
estado: cerrado
aliases: [migración Telnyx a Twilio, project-twilio-migration]
actualizado: 2026-09-25
---
# Migración de Telnyx a Twilio (caller-agent de Reputation Bundle)

## Resumen
El `caller-agent` (agente de llamadas con IA) de [[reputation-bundle]] se migró de Telnyx a Twilio el 2026-09-15.

## Por qué
Telnyx arrastraba el error 90046 sin resolver durante más de 12 días, bloqueando las llamadas del agente.

## Estado
Migración completada. Corre como servicio systemd `caller-agent` (activo) en `caller.theorangebusiness.com`. Secretos relevantes en `caller-agent/.env`: `TELNYX_*` (legado), `TWILIO_ACCOUNT_SID`/`AUTH_TOKEN`/`FROM_NUMBER`, `CALL_PROVIDER`.

## Nota
Creada a partir de menciones dispersas en [[reputation-bundle]] (antes había dos enlaces rotos con nombres distintos para este mismo hecho, apuntando a una nota de memoria de sesión que nunca existió como archivo).
