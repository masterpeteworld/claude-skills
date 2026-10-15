#!/usr/bin/env bash
# Sync skills from this repo into ~/.claude/skills so they load in every project.
#
# Usage:
#   ./skills.sh                       pull latest and install all skills
#   ./skills.sh meeting-assistant ads install only the named skills
#   ./skills.sh --list                list skills in the repo
#
# Overwrites same-named skills in ~/.claude/skills. Never deletes skills
# that are not in this repo.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/.claude/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

if [ "${1:-}" = "--list" ]; then
  ls "$SRC"
  exit 0
fi

if git -C "$REPO_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Pulling latest from $(git -C "$REPO_DIR" remote get-url origin 2>/dev/null || echo origin)..."
  git -C "$REPO_DIR" pull --ff-only --quiet || echo "Pull failed; installing local copy."
fi

mkdir -p "$DEST"

if [ "$#" -gt 0 ]; then
  names=("$@")
else
  names=()
  for d in "$SRC"/*/; do names+=("$(basename "$d")"); done
fi

installed=0
for name in "${names[@]}"; do
  if [ ! -f "$SRC/$name/SKILL.md" ]; then
    echo "Skipped: '$name' not found in repo"
    continue
  fi
  rm -rf "${DEST:?}/$name"
  cp -R "$SRC/$name" "$DEST/$name"
  installed=$((installed + 1))
done

echo "Installed $installed skill(s) into $DEST. Restart Claude Code to load them."
