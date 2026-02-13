# Specification-Driven Development Rules

## Workflow Order (Strict)

1. **Requirements Gathering** — Understand the full scope. Ask clarifying questions.
2. **Research** — Search for latest best practices, patterns, and libraries relevant to the task.
3. **Spec Writing** — Write clear specifications (behavior, API contracts, data models, edge cases).
4. **UI/UX Design** — For any user-facing work, design the interface first. Present to user for approval.
5. **Planning** — Break down into parallel tasks. Assign to agents/skills where possible.
6. **Implementation** — Code to satisfy the spec. Use TDD when practical.
7. **Self-Review** — Invoke the self-review agent/skill. Fix all issues before presenting.
8. **Presentation** — Show the user clean, reviewed output.

## Spec Format

When writing specs, include:
- **Goal**: One sentence summary
- **Requirements**: Numbered list of must-haves
- **API/Interface**: Input/output contracts
- **Edge Cases**: Known boundary conditions
- **Out of Scope**: What this does NOT cover
