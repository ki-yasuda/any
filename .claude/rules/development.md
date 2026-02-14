# Specification-Driven Development Rules

## Workflow Order (Strict — Superpowers Mode)

1. **Requirements Gathering** — Understand the full scope. Ask clarifying questions. Never assume.
2. **Research** — Use the `researcher` agent. Search for latest best practices, patterns, and libraries.
3. **Spec Writing** — Write clear specifications (behavior, API contracts, data models, edge cases).
4. **UI/UX Design** — For user-facing work, use the `designer` agent. Present to user for approval.
5. **Planning** — Use the `planner` agent for complex tasks. Break into parallel tasks. Assign agents/skills.
6. **Test Writing (RED)** — Write failing tests that define the expected behavior. Run them. Confirm they fail.
7. **Implementation (GREEN)** — Write minimum code to pass tests. Run tests. Confirm they pass.
8. **Refactoring (REFACTOR)** — Clean up code while keeping tests green. Run tests after each change.
9. **Verification** — Run full test suite, lint, typecheck, build. Use the verification protocol.
10. **Self-Review** — Invoke the `self-review` skill. Use the `reviewer` agent. Fix all issues.
11. **Presentation** — Show the user clean, verified, reviewed output.

## Spec Format

When writing specs, include:
- **Goal**: One sentence summary
- **Requirements**: Numbered list of must-haves
- **API/Interface**: Input/output contracts
- **Edge Cases**: Known boundary conditions
- **Out of Scope**: What this does NOT cover
- **Test Cases**: Key scenarios to test

## Debugging Protocol

When tests fail or bugs are found:
1. **DO NOT guess** — Follow the systematic debugging protocol in `verification.md`
2. **Use the `debugger` agent** for complex issues
3. **Write a regression test** before fixing the bug
4. **Verify the fix** by running the full test suite
