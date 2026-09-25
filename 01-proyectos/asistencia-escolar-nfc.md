---
tipo: proyecto
estado: activo
aliases: [app de entrada y salida de niños, asistencia escolar NFC, asistencia escolar RFID]
actualizado: 2026-09-25
---
# Asistencia escolar con NFC

## Resumen
App para registrar la entrada y salida de los niños en el colegio (unos 600 estudiantes). Piloto con uno o dos cursos.

## Arquitectura
- Pulseras NFC, no carnets: el niño pasa la mano por el lector y suena.
- Lectores NFC impermeables conectados a la API. Evaluando lector Secukey (OSDP/Wiegand, RS485) para el portón.
- Módulo relacionado: tags NFC para pertenencias (loncheras, libros, mochilas) asociados al perfil del niño, cuidando qué datos se muestran por seguridad.

## Estado
Pidiendo 100 pulseras de prueba a proveedor chino.

## Decisiones
- Pulseras en lugar de carnets. Por qué: un niño de 4 años lo pierde o lo muerde, y por estética.
- NFC con gesto de acercar la mano en lugar de lectura automática sin contacto. Por qué: más sensato y confiable.
