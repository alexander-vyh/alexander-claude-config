#!/usr/bin/env bash
# Install jixia-advisors agents for Claude Code.
#
# Usage:
#   ./INSTALL.sh             # backup any existing real file, symlink the new
#   ./INSTALL.sh --uninstall # remove symlinks (backups are left alone)
#
# Backup-then-symlink: nothing is silently clobbered. If a file at the
# destination is already a symlink, it's replaced. If it's a real file,
# it's backed up to <name>.backup-YYYYMMDD-HHMMSS before being symlinked.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
AGENTS_SRC="$REPO_DIR/claude/agents"
AGENTS_DST="$CLAUDE_DIR/agents"

UNINSTALL=0
[ "${1:-}" = "--uninstall" ] && UNINSTALL=1

mkdir -p "$AGENTS_DST"

ts="$(date +%Y%m%d-%H%M%S)"
n=0

for src in "$AGENTS_SRC"/*.md; do
  [ -f "$src" ] || continue
  name="$(basename "$src")"
  dst="$AGENTS_DST/$name"

  if [ "$UNINSTALL" = "1" ]; then
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
      rm "$dst"
      echo "    removed: $dst"
      n=$((n+1))
    fi
    continue
  fi

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    backup="$dst.backup-$ts"
    mv "$dst" "$backup"
    echo "    backup:  $dst -> $backup"
  fi

  ln -s "$src" "$dst"
  echo "    link:    $dst -> ${src#$HOME/}"
  n=$((n+1))
done

if [ "$UNINSTALL" = "1" ]; then
  echo "==> removed $n symlinks"
else
  echo "==> installed $n symlinks"
fi
