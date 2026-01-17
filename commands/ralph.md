---
description: "Start Ralph loop with fresh context each iteration"
argument-hint: "PROMPT [--max N]"
allowed-tools: ["Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup.sh:*)"]
---

# Ralph Loop

! "${CLAUDE_PLUGIN_ROOT}/scripts/setup.sh" $ARGUMENTS

Ralph loop started. Each iteration:
1. Conversation is cleared (fresh context!)
2. Your prompt is re-run
3. Previous work visible in files/git

To stop: /cancel
