#!/bin/bash
# PreCompact Hook: Save transcript and generate recovery summary before compaction
# Runs before context compaction to preserve session state

set -euo pipefail

INPUT=$(cat)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path // empty')
TRIGGER=$(echo "$INPUT" | jq -r '.trigger // "auto"')
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

BACKUP_DIR="$CLAUDE_PROJECT_DIR/.claude/compaction-backups"
mkdir -p "$BACKUP_DIR"

# 1. Backup full transcript
if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ]; then
  cp "$TRANSCRIPT_PATH" "$BACKUP_DIR/${TIMESTAMP}_${SESSION_ID}.jsonl"

  # Keep only last 10 backups to avoid bloat
  ls -t "$BACKUP_DIR"/*.jsonl 2>/dev/null | tail -n +11 | xargs -r rm -f
fi

# 2. Generate recovery summary via subagent
SUMMARY=""
if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ] && command -v claude >/dev/null 2>&1; then
  RECENT=$(tail -200 "$TRANSCRIPT_PATH" 2>/dev/null || true)
  if [ -n "$RECENT" ]; then
    SUMMARY=$(echo "$RECENT" | claude -p "You are a session recovery assistant. Analyze this conversation transcript and produce a concise handover brief in this format:

## Session Recovery Brief

### Current Task
What is being worked on right now? (1-2 sentences)

### Key Decisions Made
- Bullet list of important decisions and their rationale

### Progress So Far
- What has been completed
- What is in progress

### Critical Context
- File paths, variable names, API details that must not be lost
- Any specs or requirements being followed

### Next Steps
- What should happen next, in order

Be concise. Focus on actionable information." 2>/dev/null || true)
  fi
fi

# 3. Save recovery brief
if [ -n "$SUMMARY" ]; then
  echo "$SUMMARY" > "$BACKUP_DIR/${TIMESTAMP}_recovery.md"

  # Return custom instructions to influence compaction
  jq -n --arg instructions "During compaction, prioritize preserving: current task context, file paths being edited, specs and requirements, and next steps. Recovery brief: $SUMMARY" \
    '{hookSpecificOutput: {hookEventName: "PreCompact", customInstructions: $instructions}}'
else
  # No summary generated, just ensure key context is preserved
  jq -n '{hookSpecificOutput: {hookEventName: "PreCompact", customInstructions: "During compaction, prioritize preserving: current task and progress, file paths being edited, specs and requirements, key decisions made, and next steps."}}'
fi
