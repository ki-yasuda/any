# Project Instructions

## Language

- Internal reasoning / thinking: English
- Communication with user: 日本語 (Japanese)

## Default Mode: Superpowers

This project runs in **Superpowers mode** by default. See `.claude/rules/superpowers.md` for the full protocol.

### What Superpowers Mode Enforces

1. **Deep analysis before coding** — Research, plan, and spec BEFORE writing any code. Use the `planner` and `researcher` agents for complex tasks.
2. **Test-Driven Development** — Write failing tests first, implement minimum code, refactor. Never skip tests. See `.claude/rules/tdd.md`.
3. **Systematic debugging** — When something breaks, follow the reproduce-isolate-analyze-fix protocol. Use the `debugger` agent. See `.claude/rules/verification.md`.
4. **Verification at every step** — Run tests after every change. Never claim "it works" without proof. All tests must pass before presenting results.
5. **Self-review before presenting** — Use the `self-review` skill before showing any code to the user.

### Available Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| `planner` | Deep task analysis and planning | Complex or multi-file tasks |
| `researcher` | Best practices and library research | Start of any new feature |
| `designer` | UI/UX design and wireframes | User-facing features |
| `reviewer` | Code review for correctness/security | Before presenting code |
| `debugger` | Systematic root cause analysis | When tests fail or bugs appear |

### Available Skills

| Skill | Purpose | Invocation |
|-------|---------|------------|
| `tdd-cycle` | Execute RED-GREEN-REFACTOR | `/tdd-cycle [description]` |
| `self-review` | Review changes before presenting | `/self-review [description]` |
| `project-init` | Initialize new project/feature | `/project-init [name]` |

## Development Methodology: Specification-Driven Development + TDD

1. **Clarify requirements** — Ask questions before coding. Never assume.
2. **Write specs first** — Define behavior, inputs, outputs, and edge cases before implementation.
3. **UI/UX design before code** — Design screens, flows, and interactions first. Get user approval.
4. **Write tests first** — Tests define the contract. Implementation follows tests.
5. **Implement against specs** — Code must satisfy the written specification, nothing more.
6. **Verify everything** — Run tests, lint, typecheck. Prove it works.
7. **Self-review before presenting** — Review your own output for correctness, style, and completeness. Fix issues silently.

## Planning Rules

Every plan MUST include:
- Loading or creating relevant **agents** (subagents) for parallel execution
- Loading or creating relevant **skills** for reusable workflows
- Explicit parallelization strategy — identify independent tasks and run them concurrently
- Research phase using web search for latest best practices relevant to the task

## Project Start Checklist

When starting a new project or major feature:
1. Research latest best practices and frameworks via web search
2. Review and update Claude Code configuration (skills, agents, hooks) based on latest docs
3. Design UI/UX first — wireframes, user flows, component hierarchy
4. Write specifications before any implementation
5. Set up testing strategy and framework
6. Write tests before implementation

## Commands

- See `package.json` or project-specific config for build/test/lint commands
- Always discover commands before assuming them

## Code Style

- Follow existing project conventions
- Prefer simple, readable code over clever abstractions
- No premature optimization
