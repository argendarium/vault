---
tipo: proyecto
estado: activo
aliases: [AgroLink, Tierra Alta Gestión, Tierra Alta Trazabilidad, Tierra Alta ID]
stack: [Laravel, FilamentPHP, MQTT, The Things Network, Tailwind]
actualizado: 2026-09-25
---
# AgroLink (plataforma de Tierra Alta)

## Resumen
Plataforma SaaS de agricultura de precisión, "Impulsado por Tierra Alta Dominicana". Las operaciones de campo están en [[tierra-alta-dominicana]]. Meta a largo plazo: Colombia y México.

## Líneas de producto
- Tierra Alta Gestión: facturación e-CF vía PSFE homologado por la DGII, gastos (tipo y método de pago), CRM, reportes 606/607. Entrada por porcicultura.
- Tierra Alta Trazabilidad: genealogía, registros veterinarios, cumplimiento (objetivo GLOBALG.A.P).
- Tierra Alta ID: identificación individual por NFC, QR o RFID con bitácora digital por animal; estación de pesaje automático opcional.

## Arquitectura
- Frontend: templates HTML, datos JSON, `js/app.js`. Tailwind, Fraunces (display), Inter (cuerpo), IBM Plex Mono (etiquetas), iconos Lucide, fondo sutil de puntos, tonos tierra.
- IoT: nodos LoRa hacia gateway, The Things Network, MQTT y backend Laravel/FilamentPHP.
- Conector fiscal intercambiable por región: RD vía PSFE, Colombia vía DIAN, México vía SAT.

## Estado
Login confirmado con el estilo; register era el siguiente.

## Pendientes
- [ ] Templates: register, claim-business, checkout, navbar, footer, 404.

## Decisiones
- Integrar un PSFE en lugar de autocertificarse para e-CF.
- No usar el nombre "PigID".
- Trabajo iterativo: una plantilla a la vez, revisada en el navegador.
