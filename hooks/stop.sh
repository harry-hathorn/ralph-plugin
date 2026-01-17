#!/bin/bash
set -euo pipefail

STATE_FILE=".claude/ralph.state"

# Exit if no active loop
[[ ! -f "$STATE_FILE" ]] && exit 0

# Read state
source "$STATE_FILE"

# Check max iterations
if [[ $MAX -gt 0 ]] && [[ $ITERATION -ge $MAX ]]; then
  rm -f "$STATE_FILE"
  exit 0
fi

# Increment and update
NEXT=$((ITERATION + 1))
echo "ITERATION=$NEXT" > "$STATE_FILE"
echo "MAX=$MAX" >> "$STATE_FILE"
echo "PROMPT=$PROMPT" >> "$STATE_FILE"

# THE MAGIC: Output /clear command, then the prompt
# This clears conversation context and re-runs prompt
jq -n \
  --arg prompt "$PROMPT" \
  --arg msg "Iteration $NEXT" \
  '{
    "decision": "block",
    "reason": "/clear\n\n" + $prompt,
    "systemMessage": $msg
  }'
