# Design Patterns for Skills

Proven patterns for structuring effective skills.

## Contents

- Progressive disclosure patterns
- Workflow patterns
- Feedback loop pattern
- Template pattern
- Examples pattern
- Conditional workflow pattern
- Dynamic context pattern
- Subagent pattern

## Progressive Disclosure Patterns

### Pattern 1: High-level guide with references

```markdown
# PDF Processing

## Quick start
Extract text with pdfplumber:
[code example]

## Advanced features
- **Form filling**: See [FORMS.md](FORMS.md)
- **API reference**: See [REFERENCE.md](REFERENCE.md)
- **Examples**: See [EXAMPLES.md](EXAMPLES.md)
```

Claude loads referenced files only when needed.

### Pattern 2: Domain-specific organization

```
bigquery-skill/
├── SKILL.md (overview and navigation)
└── reference/
    ├── finance.md (revenue, billing metrics)
    ├── sales.md (opportunities, pipeline)
    └── product.md (API usage, features)
```

SKILL.md points to the right domain file. Claude reads only the relevant one.

### Pattern 3: Conditional details

```markdown
# DOCX Processing

## Creating documents
Use docx-js for new documents. See [DOCX-JS.md](DOCX-JS.md).

## Editing documents
For simple edits, modify XML directly.
**For tracked changes**: See [REDLINING.md](REDLINING.md)
**For OOXML details**: See [OOXML.md](OOXML.md)
```

### Rules

- References ONE level deep from SKILL.md only
- Files >100 lines: include table of contents at top
- No duplication between SKILL.md and reference files

## Workflow Patterns

### Sequential workflow with checklist

For complex multi-step operations, provide a checklist:

````markdown
## Deployment workflow

Copy this checklist and track progress:

```
- [ ] Step 1: Run test suite
- [ ] Step 2: Build application
- [ ] Step 3: Deploy to staging
- [ ] Step 4: Verify staging
- [ ] Step 5: Deploy to production
```

**Step 1: Run test suite**
[detailed instructions]

**Step 2: Build application**
[detailed instructions]
````

### Conditional workflow

```markdown
## Modification workflow

1. Determine type:
   **Creating new?** -> Follow "Creation workflow"
   **Editing existing?** -> Follow "Editing workflow"

2. Creation workflow:
   - Build from scratch
   - Export to format

3. Editing workflow:
   - Unpack existing
   - Modify directly
   - Validate after each change
```

## Feedback Loop Pattern

Run validator -> fix errors -> repeat. Greatly improves output quality.

```markdown
## Editing process

1. Make edits
2. **Validate immediately**: `python scripts/validate.py output/`
3. If validation fails:
   - Review error message
   - Fix the issues
   - Run validation again
4. **Only proceed when validation passes**
5. Finalize output
```

## Template Pattern

### Strict (API responses, data formats)

````markdown
## Report structure

ALWAYS use this exact template:

```markdown
# [Title]

## Executive summary
[One-paragraph overview]

## Key findings
- Finding 1 with data
- Finding 2 with data

## Recommendations
1. Actionable recommendation
2. Actionable recommendation
```
````

### Flexible (when adaptation is useful)

````markdown
## Report structure

Sensible default format. Adjust based on analysis:

```markdown
# [Title]
## Summary
## Findings
## Recommendations
```
````

## Examples Pattern

Provide input/output pairs for quality-dependent skills:

````markdown
## Commit message format

**Example 1:**
Input: Added user authentication with JWT tokens
Output:
```
feat(auth): implement JWT-based authentication

Add login endpoint and token validation middleware
```

**Example 2:**
Input: Fixed date display bug in reports
Output:
```
fix(reports): correct date formatting in timezone conversion
```
````

## Dynamic Context Pattern

Use `!`command`` to inject live data before Claude sees the prompt:

```yaml
---
name: pr-summary
description: Summarize changes in a pull request
context: fork
agent: Explore
---

## PR context
- PR diff: !`gh pr diff`
- PR comments: !`gh pr view --comments`
- Changed files: !`gh pr diff --name-only`

## Task
Summarize this pull request.
```

Commands execute BEFORE Claude receives the prompt. Claude sees the output, not the command.

## Subagent Pattern

Use `context: fork` for isolated execution:

```yaml
---
name: deep-research
description: Research a topic thoroughly
context: fork
agent: Explore
---

Research $ARGUMENTS thoroughly:

1. Find relevant files using Glob and Grep
2. Read and analyze the code
3. Summarize findings with specific file references
```

Results are summarized and returned to the main conversation.

Agent options: `Explore`, `Plan`, `general-purpose`, or custom agents from `.claude/agents/`.
