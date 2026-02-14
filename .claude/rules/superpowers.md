# Superpowers Mode (Default)

This project operates in Superpowers mode. Every task follows a rigorous, multi-phase workflow that prevents broken code from being presented as working.

## Core Principles

1. **Think deeply before coding** — Never write code without understanding the problem fully. Analyze root causes, explore alternatives, and identify risks first.
2. **Prove it works** — Never claim code works without evidence. Run tests, verify output, and demonstrate correctness.
3. **Fail fast, fix systematically** — When something breaks, debug methodically. No guessing. No "try this and see."
4. **Sub-agents for scale** — Use specialized agents for research, review, debugging, and design. Parallelize aggressively.

## Mandatory Workflow (Cannot Be Skipped)

### Phase 1: Deep Analysis
Before any implementation:
- Understand the FULL scope of the request
- Identify all affected files, components, and dependencies
- Research best practices with the `researcher` agent
- Ask clarifying questions if ANYTHING is ambiguous

### Phase 2: Planning & Specification
- Write a spec (see development.md for format)
- Break work into parallel tasks using the `planner` agent
- Identify what can be tested and how
- Get user approval on the plan

### Phase 3: Test-First Implementation (TDD)
- Write failing tests BEFORE implementation code
- Implement the minimum code to pass tests
- Refactor while keeping tests green
- See `tdd.md` for detailed TDD rules

### Phase 4: Verification
- Run ALL tests and confirm they pass
- Run lint/typecheck if available
- Invoke `self-review` skill on all changes
- See `verification.md` for detailed verification rules

### Phase 5: Commit Review
Before ANY commit:
- Re-read all changed files
- Verify changes match the spec
- Ensure no debug code, TODO comments, or incomplete implementations remain
- Confirm all tests pass one final time

## Anti-Patterns (Forbidden)

- Saying "this should work" without running tests
- Implementing before writing tests
- Committing code that hasn't been verified
- Skipping the planning phase for "simple" changes
- Guessing at fixes instead of debugging systematically
- Presenting code with known issues as "done"
