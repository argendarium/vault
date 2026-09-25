---
tipo: proyecto
estado: cerrado
aliases: [terminal biométrica Banreservas]
stack: [Python, Flask, DigitalPersona, API biométrica JCE]
actualizado: 2026-09-25
---
# Terminal biométrica de depósitos (Banreservas)

## Resumen
Aplicación de terminal de depósitos con verificación biométrica para Banreservas.

## Arquitectura
- Python Flask + lector de huellas DigitalPersona + API biométrica de la JCE.
- Manejo de tokens OAuth2 y switch de fuente de datos dummy/producción.
- Relacionado: script de configuración de kiosko Windows para despliegues de ATMs de Banreservas.
