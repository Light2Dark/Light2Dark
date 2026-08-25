#!/usr/bin/env bash
# Link this directory's AGENTS.md and skills into every agent harness.
# Idempotent — re-run after adding a skill. Edits to existing files need no re-run.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALLED="$HOME/.agents/skills"          # skills managed by the `skills` CLI

CLAUDE="$HOME/.claude/skills"
CODEX="$HOME/.codex/skills"
CURSOR="$HOME/.cursor/skills"             # NOT skills-cursor, which is Cursor-internal

link() {  # link <target> <linkpath>
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    echo "  skip $2 (real file, not a symlink)" >&2
    return
  fi
  ln -sfn "$1" "$2"
}

# --- global instructions: one file, three entry points ---
link "$SRC/AGENTS.md" "$HOME/.claude/CLAUDE.md"
link "$SRC/AGENTS.md" "$HOME/.codex/AGENTS.md"
link "$SRC/AGENTS.md" "$HOME/AGENTS.md"   # Cursor finds this by walking up from any project

# --- skills: one symlink per skill so each harness keeps its own built-ins ---
mkdir -p "$CLAUDE" "$CODEX" "$CURSOR"

for src_dir in "$SRC"/*/ "$INSTALLED"/*/; do
  [ -d "$src_dir" ] || continue
  [ -f "${src_dir}SKILL.md" ] || continue
  skill="${src_dir%/}"
  name="$(basename "$skill")"
  for dest in "$CLAUDE" "$CODEX" "$CURSOR"; do
    link "$skill" "$dest/$name"
  done
  echo "linked $name"
done
