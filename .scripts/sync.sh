#!/usr/bin/env bash
# Sincroniza el vault con el remoto Git.
# Uso: sync.sh pull   -> al iniciar sesion
#      sync.sh push   -> al cerrar sesion
# Disenado para correr desde hooks: nunca bloquea ni rompe la sesion.

set -u
MODE="${1:-pull}"
VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG="$VAULT/.scripts/.sync.log"
HOST="$(hostname 2>/dev/null || echo desconocido)"

export GIT_TERMINAL_PROMPT=0
export GIT_SSH_COMMAND="${GIT_SSH_COMMAND:-ssh -o BatchMode=yes -o ConnectTimeout=10}"

log()  { printf '%s [%s] %s\n' "$(date '+%F %T')" "$HOST" "$*" >> "$LOG"; }
warn() { log "$*"; echo "AVISO vault: $*"; }

cd "$VAULT" || exit 0
[ -d .git ] || { warn "no es un repo git ($VAULT)"; exit 0; }

# Candado para evitar corridas simultaneas (Obsidian Git + Claude Code)
LOCK="$VAULT/.git/vault-sync.lock"
if ! mkdir "$LOCK" 2>/dev/null; then
  if [ -n "$(find "$LOCK" -maxdepth 0 -mmin +5 2>/dev/null)" ]; then
    rmdir "$LOCK" 2>/dev/null; mkdir "$LOCK" 2>/dev/null || exit 0
  else
    log "otro sync en curso, se omite"; exit 0
  fi
fi
trap 'rmdir "$LOCK" 2>/dev/null' EXIT

commit_local() {
  if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -qm "$1 [$HOST] $(date '+%F %T')" >>"$LOG" 2>&1
  fi
}

pull_remote() {
  if ! git pull --rebase -q >>"$LOG" 2>&1; then
    git rebase --abort >/dev/null 2>&1
    warn "no se pudo traer cambios (sin red o conflicto). Revisa con: cd \"$VAULT\" && git status"
    return 1
  fi
}

case "$MODE" in
  pull)
    commit_local "auto: cambios locales pendientes"
    pull_remote && log "pull ok"
    ;;
  push)
    commit_local "sesion"
    pull_remote || exit 0
    if git push -q >>"$LOG" 2>&1; then log "push ok"; else warn "push fallo, se reintentara en la proxima sesion"; fi
    ;;
  *)
    echo "uso: sync.sh pull|push"; exit 0 ;;
esac
exit 0
