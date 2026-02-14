# Frontmatter Reference

All YAML frontmatter fields for SKILL.md.

## Contents

- Required fields
- Optional fields
- Invocation control matrix

## Required Fields

### name

- Max 64 characters
- Lowercase letters, numbers, hyphens only
- No XML tags, no reserved words ("anthropic", "claude")
- Becomes the `/slash-command` name
- If omitted, uses the directory name as fallback

### description

- Max 1024 characters, non-empty, no XML tags
- **Third person** ("Processes files" not "I process files")
- Must include WHAT the skill does AND WHEN to use it
- This is the PRIMARY triggering mechanism
- Include keywords users would naturally say

Example:

```yaml
description: >
  Extract text and tables from PDF files, fill forms, merge documents.
  Use when working with PDF files or when the user mentions PDFs,
  forms, or document extraction.
```

## Optional Fields

### argument-hint

Hint shown during autocomplete. Example: `[issue-number]`, `[filename] [format]`

### disable-model-invocation

`true` = Only user can invoke via `/name`. Use for workflows with side effects (`/deploy`, `/commit`, `/send-message`).

### user-invocable

`false` = Hidden from `/` menu. Only Claude can invoke. Use for background knowledge.

### allowed-tools

Tools Claude can use without asking permission when skill is active.

```yaml
allowed-tools: Read, Grep, Glob
```

### model

Override the model when this skill is active.

### context

Set to `fork` to run in a forked subagent context. Only useful for skills with explicit task instructions (not guidelines).

### agent

Which subagent type to use with `context: fork`. Options: `Explore`, `Plan`, `general-purpose`, or custom agents from `.claude/agents/`.

### hooks

Hooks scoped to this skill's lifecycle.

## Invocation Control Matrix

| Frontmatter                      | User invokes | Claude invokes | Context behavior                              |
|----------------------------------|-------------|----------------|-----------------------------------------------|
| (default)                        | Yes         | Yes            | Description always loaded, body on invocation |
| `disable-model-invocation: true` | Yes         | No             | Description NOT in context                    |
| `user-invocable: false`          | No          | Yes            | Description always loaded, body on invocation |
