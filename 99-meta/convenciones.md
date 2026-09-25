---
tipo: meta
---
# Convenciones del vault

## Archivos
- Nombres en minúsculas con guiones: `atm-tracker.md`, `canada-atm-network.md`.
- Una nota por tema. Antes de crear, buscar si ya existe (grep por nombre y alias).
- Enlaces internos con `[[nombre-nota]]`.

## Frontmatter mínimo
```yaml
---
tipo: proyecto | negocio | persona | procedimiento | sesion | meta
estado: activo | pausado | cerrado
aliases: []
actualizado: AAAA-MM-DD
---
```

## Decisiones
Siempre como lista con fecha, nunca en tabla (las listas se fusionan mejor en Git):
`- 2026-09-25 - Decisión tomada. Por qué: razón concreta.`

## Sesiones
- Un archivo por sesión: `90-sesiones/AAAA-MM-DD-maquina-tema.md`.
- Nunca agregar a un archivo de sesión compartido (evita conflictos entre máquinas).
- Usar la plantilla `99-meta/plantillas/sesion.md`.

## Estilo
- Español, conciso, hechos concretos. Sin emojis.
- Registrar el por qué de las decisiones, no solo el qué.
- Actualizar el campo `actualizado` al editar.

## Prohibido guardar
Contraseñas, tokens, claves API, números de cuenta o tarjeta, documentos de identidad.
Referenciar dónde viven (ej: "clave en el gestor de contraseñas, entrada X"), nunca el valor.
