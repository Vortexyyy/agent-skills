#!/usr/bin/env bash
# Installs every skill in ./skills into Claude Code and/or Codex.
# usage: ./install.sh [claude|codex|both]   (default: both)
set -euo pipefail
cd "$(dirname "$0")"
TARGET="${1:-both}"

install_into() {
  local dest="$1"
  mkdir -p "$dest"
  for skill in skills/*/; do
    name="$(basename "$skill")"
    rm -rf "${dest:?}/$name"
    cp -R "$skill" "$dest/$name"
    echo "installed $name -> $dest/$name"
  done
}

case "$TARGET" in
  claude) install_into "$HOME/.claude/skills" ;;
  codex)  install_into "${CODEX_HOME:-$HOME/.codex}/skills" ;;
  both)   install_into "$HOME/.claude/skills"; install_into "${CODEX_HOME:-$HOME/.codex}/skills" ;;
  *) echo "usage: $0 [claude|codex|both]" >&2; exit 1 ;;
esac
echo "Done. Start a new session to pick the skills up."
