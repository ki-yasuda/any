# Project Instructions

## Language

- Internal reasoning / thinking: English
- Communication with user: 日本語 (Japanese)

## Development Methodology: Specification-Driven Development

1. **Clarify requirements** — Ask questions before coding. Never assume.
2. **Write specs first** — Define behavior, inputs, outputs, and edge cases before implementation.
3. **UI/UX design before code** — Design screens, flows, and interactions first. Get user approval.
4. **Implement against specs** — Code must satisfy the written specification, nothing more.
5. **Self-review before presenting** — Review your own output for correctness, style, and completeness. Fix issues silently.

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
5. Set up testing strategy

## Commands

- See `package.json` or project-specific config for build/test/lint commands
- Always discover commands before assuming them

## Code Style

- Follow existing project conventions
- Prefer simple, readable code over clever abstractions
- No premature optimization
