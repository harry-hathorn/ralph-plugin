# Ralph Loop Plugin

A simple Claude Code plugin that runs your prompt in a loop with **fresh context each iteration**.

## The Secret Sauce

Uses Claude Code's built-in `/clear` command to wipe the conversation context between iterations, giving you a clean context window every time.

## Installation

```bash
# Clone this repo
git clone git@github.com:harry-hathorn/ralph-plugin.git ~/.claude/plugins/ralph

# Or symlink if you cloned elsewhere
ln -s /path/to/ralph-plugin ~/.claude/plugins/ralph
```

## Usage

```bash
# Start an infinite loop
/ralph "refactor this code to be more readable"

# Run exactly 5 iterations
/ralph "improve the error handling" --max 5

# Stop the loop
/cancel
```

## How It Works

1. Run `/ralph "your prompt"` to start
2. Claude works on your prompt
3. When you try to exit, the stop hook intercepts:
   - Runs `/clear` (wipes conversation context)
   - Re-runs your prompt with fresh context
4. Repeat until you `/cancel` or hit `--max` iterations

## Why Use This?

- **Fresh context each iteration** - no conversation bloat
- **Persistent work** - your changes are saved to files/git
- **Simple** - just `/ralph "prompt"` and `/cancel`
