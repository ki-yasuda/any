---
name: skill-creator
description: >
  Create or update Claude Code skills (SKILL.md) following Anthropic's official best practices.
  Use when the user wants to create a new skill, update an existing skill, build a slash command,
  or asks about skill structure and authoring patterns. Covers frontmatter, progressive disclosure,
  directory layout, workflows, testing, and iteration.
argument-hint: "[skill-name-or-description]"
---

# Skill Creator

Create or update a skill: $ARGUMENTS

## Process

### Step 1: Understand the Skill

Before writing anything, clarify with the user:

- What task or workflow does this skill automate?
- What triggers should activate it? (keywords, contexts, slash command)
- Who invokes it? (user via `/name`, Claude automatically, or both)
- Does it need side effects control? (`disable-model-invocation: true`)
- What inputs does it accept? (`$ARGUMENTS`, `$0`, `$1`, etc.)

Ask 2-3 focused questions max. Avoid overwhelming the user.

### Step 2: Plan the Skill Contents

Analyze each use case to identify:

- **Scripts** (`scripts/`): Code rewritten repeatedly or needing deterministic reliability
- **References** (`references/`): Documentation Claude should consult as needed
- **Assets** (`assets/`): Templates, images, fonts used in output (not loaded into context)

If none are needed, a single SKILL.md is sufficient.

### Step 3: Write the SKILL.md

#### Frontmatter (YAML)

Required fields only:

```yaml
---
name: kebab-case-name
description: >
  What the skill does AND when to use it. Include trigger keywords.
  This is the PRIMARY discovery mechanism. Max 1024 chars.
---
```

Rules:
- `name`: lowercase letters, numbers, hyphens only. Max 64 chars. No "anthropic" or "claude"
- `description`: Third person. Specific triggers. No XML tags
- Optional fields: `disable-model-invocation`, `user-invocable`, `allowed-tools`, `context`, `agent`, `argument-hint`, `model`
- See [references/frontmatter.md](references/frontmatter.md) for all optional fields

#### Body (Markdown)

Core rules:
- **Under 500 lines**. Split to reference files if longer
- **Claude is smart**. Only add what Claude doesn't already know
- **Imperative form**. "Extract text" not "You should extract text"
- **Concise examples over verbose explanations**
- **No "When to Use" sections** in body (that belongs in description)

Structure the body with:
1. Overview (1-2 lines)
2. Inputs/outputs
3. Execution steps (numbered)
4. References to supporting files

### Step 4: Apply Design Patterns

Choose the right pattern based on task type. See [references/patterns.md](references/patterns.md) for details.

**Freedom level**:
- High freedom (guidelines): Multiple valid approaches, context-dependent
- Medium freedom (pseudocode): Preferred pattern exists, some variation OK
- Low freedom (exact scripts): Fragile operations, consistency critical

**Progressive disclosure**:
- Keep core workflow in SKILL.md
- Move variant-specific details to reference files
- Reference files: ONE level deep from SKILL.md only
- Files >100 lines: add table of contents at top

**Dynamic context**: Use `!`command`` to inject shell output before Claude sees the prompt

**Subagent execution**: Add `context: fork` + `agent: <type>` for isolated tasks

### Step 5: Validate

Checklist before presenting:

- [ ] `description` includes WHAT it does AND WHEN to use it (third person)
- [ ] `name` is kebab-case, max 64 chars, no reserved words
- [ ] Body under 500 lines
- [ ] No time-sensitive information
- [ ] Consistent terminology throughout
- [ ] References are one level deep
- [ ] No unnecessary files (no README.md, CHANGELOG.md, etc.)
- [ ] Forward slashes in all paths
- [ ] If using MCP tools: fully qualified `ServerName:tool_name`

### Step 6: Test and Iterate

1. Test trigger accuracy: does the skill load when expected?
2. Test with actual tasks, not just test scenarios
3. Watch for unexpected behaviors and iterate
4. Ask: "Does Claude really need this explanation?"

## Directory Structure

```
skill-name/
├── SKILL.md              # Required. Frontmatter + instructions
├── references/           # Optional. Docs loaded on demand
│   ├── api-docs.md
│   └── schemas.md
├── scripts/              # Optional. Deterministic code
│   └── helper.py
└── assets/               # Optional. Output resources (not loaded into context)
    └── template.html
```

## Quick Reference: String Substitutions

| Variable               | Description                            |
|------------------------|----------------------------------------|
| `$ARGUMENTS`           | All args passed after skill name       |
| `$ARGUMENTS[N]` / `$N` | Nth argument (0-based)                |
| `${CLAUDE_SESSION_ID}` | Current session ID                     |
| `!`command``           | Shell command output (preprocessing)   |
