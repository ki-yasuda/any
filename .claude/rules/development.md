# Specification-Driven Development Rules

## Workflow Order (Strict)

1. **Requirements Gathering** — Understand the full scope. Ask clarifying questions. **← User interaction required**
2. **Research** — Search for latest best practices, patterns, and libraries relevant to the task.
3. **Spec Writing** — Write clear specifications (behavior, API contracts, data models, edge cases).
4. **UI/UX Design** — For any user-facing work, design the interface first. Present to user for approval.
5. **Planning** — Break down into parallel tasks. Assign to agents/skills where possible.
6. **Implementation** — Code to satisfy the spec. Use TDD when practical.
7. **Self-Review** — Invoke the self-review agent/skill. Fix all issues before presenting.
8. **Quality Gate** — Evaluate quality on a 10-point scale (see criteria below). If score < 9, return to step 6 and iterate.
9. **Presentation** — Show the user clean, reviewed, quality-assured output.

## Autonomous Execution Rule

After requirements (step 1) are confirmed by the user, execute steps 2-9 autonomously without pausing for intermediate approval. The quality gate (step 8) ensures output meets the bar before presentation.

## Quality Evaluation Criteria (10-Point Scale)

Rate each dimension 1-10, then average. **All dimensions must be ≥ 8 and average must be ≥ 9** to pass.

| Dimension        | What to evaluate                                                  |
|------------------|-------------------------------------------------------------------|
| **Correctness**  | Does it work? Does it satisfy all requirements? No bugs?          |
| **Completeness** | Are all requirements addressed? No missing edge cases?            |
| **Code Quality** | Clean, readable, idiomatic? Follows project conventions?          |
| **Security**     | No vulnerabilities (injection, XSS, etc.)? Safe defaults?        |
| **Testing**      | Tests pass? Adequate coverage for critical paths?                 |

If the score is below threshold:
1. Identify the weakest dimensions
2. Fix the specific issues
3. Re-evaluate — repeat until threshold is met

## Spec Format

When writing specs, include:
- **Goal**: One sentence summary
- **Requirements**: Numbered list of must-haves
- **API/Interface**: Input/output contracts
- **Edge Cases**: Known boundary conditions
- **Out of Scope**: What this does NOT cover
