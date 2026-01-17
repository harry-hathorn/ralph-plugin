#!/bin/bash
set -euo pipefail

STATE_FILE=".claude/ralph.state"
ARGS=("$@")

# Parse arguments
PROMPT=""
MAX=0

i=0
while [[ $i -lt ${#ARGS[@]} ]]; do
  arg="${ARGS[$i]}"
  if [[ "$arg" == "--max" ]]; then
    i=$((i + 1))
    MAX="${ARGS[$i]}"
  else
    # Build prompt from remaining args
    if [[ -n "$PROMPT" ]]; then
      PROMPT="$PROMPT $arg"
    else
      PROMPT="$arg"
    fi
  fi
  i=$((i + 1))
done

# Validate prompt
if [[ -z "$PROMPT" ]]; then
  echo "Error: No prompt provided"
  echo "Usage: /ralph PROMPT [--max N]"
  exit 1
fi

# Create .claude dir if needed
mkdir -p .claude

# Write state file
cat > "$STATE_FILE" << EOF
ITERATION=1
MAX=$MAX
PROMPT=$PROMPT
EOF

echo "Ralph loop initialized: $PROMPT"
