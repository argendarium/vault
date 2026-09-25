---
tipo: proyecto
estado: activo
aliases: [FireID, cbdn-platform, Cuenta CBDN]
stack: [Laravel 11, FilamentPHP v3, PostgreSQL, Next.js 15, Expo SDK 52, Docker]
repo: 
actualizado: 2026-09-25
---
# FireID

## Resumen
Ecosistema de gestión digital para el CBDN y, a largo plazo, implementación de referencia para cuerpos de bomberos de Latinoamérica. Es la fuente única de identidad del personal dentro del portafolio de [[cbdn-contexto]].

## Arquitectura
- Monorepo `cbdn-platform/` con cuatro proyectos: API Laravel 11 + panel FilamentPHP v3, dos sitios Next.js 15 (`web-institucional` y `web-fireid`) y app móvil Expo SDK 52.
- PostgreSQL como única base de datos, con tablas prefijadas por módulo.
- Docker para local y producción en VPS. Desarrollo local con Laravel Herd; despliegue con Laravel Forge.
- Modelo de socios: empresas externas reciben API keys gratuitas otorgadas por el CBDN para dar beneficios a los bomberos. No es SaaS comercial.
- Móvil: iBeacons Feasycom FSC-BP104D con `react-native-beacons-manager`, requisito desde el día uno.
- Identidad visual institucional: rojo #C41E3A, dorado #A8871F, navy #1B2A4A. Syne + DM Sans en perfiles públicos.

## Módulos
- Perfiles digitales con página pública de verificación por QR y expediente privado.
- Número FireID: `CBDN-00001`.
- Horas de voluntarios con check-in/check-out y verificación por geolocalización.
- Registros disciplinarios con procedimientos distintos para permanentes y voluntarios.
- Blog institucional con generación automática de posts de ascensos.
- Control de acceso por roles.
- Operaciones: solo parser de WhatsApp y mapa interactivo (ver [[fire-monitor]]).

## Estado
Fase 1 completa: base, estructura de datos, estaciones y autenticación.

## Pendientes
- [ ] Orden de implementación: Docker, Identidad, Asistencia, Operaciones, Comunicaciones, Móvil, web-fireid, web-institucional.
- [ ] Módulos diferidos: Flota, Academia, Solicitudes, Disciplina.

## Decisiones
- Los proyectos se presentan como iniciativas independientes y vendibles por separado, no como fases. Por qué: permite al mando priorizar con flexibilidad.
