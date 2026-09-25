---
tipo: proyecto
estado: activo
aliases: [vault, segundo cerebro, memoria de Claude Code]
repo: https://github.com/argendarium/vault
actualizado: 2026-09-25
---
# Claude Vault

## Resumen
Este vault: memoria permanente para Claude Code, sincronizada con Git entre el VPS, la laptop y la laptop del trabajo.

## Arquitectura
- Repo privado `argendarium/vault`.
- Windows: `C:\Users\Bryan\vault`. VPS (Ubuntu 24.04, root): `/root/vault`.
- Hooks de Claude Code: SessionStart hace pull; Stop y SessionEnd hacen push.
- VPS usa deploy key propia `~/.ssh/vault_key` con escritura, configurada en `core.sshCommand`.
- Obsidian con plugin Git en las laptops.

## Decisiones
- 2026-09-25 - Obsidian + Git en lugar de cmem/claude-mem. Por qué: control total y archivos legibles.
- 2026-09-25 - Instalador de doble clic. Por qué: solo lo usa Bryan, debe ser simple.
- 2026-09-25 - Sesiones en Claude Desktop en modo Local o SSH > VPS, no en la nube. Por qué: la nube no tiene acceso al vault.
