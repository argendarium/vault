---
tipo: negocio
estado: activo
aliases: [Grupo Drake, Grúas 24/7, Titán Grúas, Titán Grúas RD, gruasrd247, gruas247, félix drake]
stack: [PHP, dompdf]
repo: /var/www/gruas247 (git local, sin remoto)
actualizado: 2026-09-25
---
# Grupo Drake / Titán Grúas RD

## Resumen
**Grupo Drake Transporte Especializado SRL** es la empresa legal, con RNC, dueña del negocio. **Titán Grúas RD** (ex "Grúas 24/7") es su marca comercial: la plataforma de despacho de grúas estilo InDrive para el cliente Félix Drake. Bryan gestiona el desarrollo (web, app móvil) junto a [[paomy]] (trámites y diseño).

## Empresa (Grupo Drake)
- Razón social: Grupo Drake Transporte Especializado SRL.
- Presidente, socio mayoritario y gerente: Félix Bautista Drake Tejeda. Segundo socio: Michael Wayne Drake Tejeda.
- Capital: RD$300,000 en 3,000 cuotas (Félix 90%, Michael 10%). Los Estatutos notariados ya reflejan esta cifra.
- Formulario de la Cámara de Comercio llenado: `Formulario_Grupo_Drake_LLENO.xlsx`.
- Correo: Forward Email Enhanced Protection ($3/mes) para grupodrake.com.do, theorangebusiness.com y titangruasrd.do; evaluando plan Team ($9/mes) para cuentas aisladas por usuario.

## Marca (Titán Grúas RD, ex Grúas 24/7)
Plataforma de despacho de grúas en República Dominicana para Félix Drake (SRL en trámite). Landing + solicitud de servicio estilo InDrive (el cliente propone su propio precio) + panel de choferes + panel admin. Rebrand de "Grúas 24/7" a "Titán Grúas RD" el 2026-09-23.

## Modelo
- App: el cliente solicita, los operadores pujan en vivo, rastreo GPS y pagos integrados. Diferenciador: transparencia, especialización y reseñas.
- Arranque: flota rentada de 2 grúas con chofer a RD$80,000/mes cada una (luego 3), antes de abrir la app a operadores independientes.
- El cliente fija su propio precio en `/solicitar/` (estilo InDrive) — `api/pricing.php` / `api/admin_pricing_save.php`.

## Arquitectura (técnica)
- Backend: PHP plano sin framework; `composer.json` solo trae `dompdf/dompdf` (para recibos/PDF).
- Estructura: `api/` (leads, pricing, solicitudes, choferes, admin), `admin/`, `chofer/` (panel de choferes), `alianza/`, `legal/` (privacidad y términos), `docs/superpowers/` (specs/plans de desarrollo).
- Choferes: registro, login, consentimiento, actualización de ubicación en vivo (`api/driver_location_update.php`).
- Correo: `api/lib/smtp_mailer.php` + `api/lib/email_templates.php`.
- No hay `.env` — la configuración vive directo en el código PHP (revisar `api/lib/db.php` para credenciales de base de datos si hace falta rotarlas).
- Servidor: nginx, root `/var/www/gruas247`. **Dos dominios activos apuntan al mismo root**: `titangruasrd.do` (nuevo, principal) y `gruasrd247.com.do` (legado).
- Ruta en esta máquina: `/var/www/gruas247`.
- Dominio web: gruasrd247.com.do (legado, ver pendientes).

## Diseño
- Versión vigente: `gruas247-premium.html`, Space Grotesk (títulos) + Inter (cuerpo), paleta ink `#14171F` + ember `#E8590C`, espaciado generoso en móvil.
- Mockup de app: 3 pantallas (inicio con mapa, tipo de carga, selección de operador): `gruas247-app-mockup.html`.
- Línea gráfica renombrada de ámbar/hazard a azul/rojo, coherente con "Titán Grúas".

## Estado
Marca renombrada a "Titán Grúas RD". Trámites de ONAPI y Cámara de Comercio en curso. En desarrollo activo: rediseño del hero a dos columnas y sección de ventaja tecnológica, rebrand completo de línea gráfica, corrección de hallazgos de seguridad (exposición de fuente PHP, rate-limit por IP real, visibilidad del precio ofertado, throttle de ubicación, UI admin de email de chofer, unicidad de email, smoke test endurecido), precio propio del cliente estilo InDrive, páginas legales (privacidad/términos).

## Pendientes
- ONAPI: se registró por error una Marca en vez de Nombre Comercial (expediente E/2026-61919, pagado RD$5,720 el 07/09/2026). Llevar carta de modificación firmada por Paomy (`Carta_Modificacion_ONAPI.docx`, faltan cédulas). Costo de modificación: RD$1,355.
- Registrar la marca con clases de servicios: transporte especializado y pesado, remolque, grúas, izaje, logística, contenedores, mudanzas, operaciones portuarias, aduanas, custodia, rastreo, refrigerado, mantenimiento, web y apps.
- Confirmar migración/apagado completo de `gruasrd247.com.do` hacia `titangruasrd.do` (DNS/redirects) — hoy ambos dominios sirven el mismo sitio.
- App móvil para choferes/clientes sigue siendo solo un pitch, sin desarrollo iniciado.
- Formalización de la SRL de Félix Drake (en trámite — no es un pendiente técnico, pero condiciona el contrato).

## Decisiones
- El nombre "Grúa RD 24/7" se descartó. Por qué: ONAPI lo consideró demasiado genérico.
- Empezar con flota rentada en vez de marketplace. Por qué: operar y validar antes de abrir a terceros.
- 2026-09-23 - Rebrand de "Grúas 24/7" a "Titán Grúas RD" con dominio `titangruasrd.do`.
- 2026-09-23 - Cambio de línea gráfica de ámbar/hazard a azul/rojo, coherente con el nuevo naming.

## Enlaces
- Repo: /var/www/gruas247 (git local, sin remoto)
- Producción: https://titangruasrd.do (alias activo: https://gruasrd247.com.do)
