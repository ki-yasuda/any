# Planning Rules

## Mandatory Plan Structure

Every implementation plan MUST contain these sections:

### 1. Research Phase
- Web search for latest best practices
- Codebase exploration to understand existing patterns
- Identify reusable components and patterns

### 2. Agent & Skill Strategy
- List which existing agents/skills will be used
- Identify new agents/skills to create for the task
- Define parallelization plan — which tasks run concurrently

### 3. Design Phase (for user-facing work)
- UI/UX wireframes or descriptions
- User flow diagrams
- Component hierarchy
- User approval checkpoint

### 4. Implementation Phase
- Ordered task list with dependencies marked
- Parallel execution groups clearly identified
- Testing strategy per component

### 5. Review Phase
- Self-review checklist
- Automated checks (lint, type-check, tests)

## Parallelization Guidelines

- Always use Task tool to launch independent research in parallel
- Use multiple Bash calls for independent commands
- Group file reads/writes that don't depend on each other
- Never serialize work that can be parallelized
