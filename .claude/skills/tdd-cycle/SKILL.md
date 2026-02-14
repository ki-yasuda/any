---
name: tdd-cycle
description: >
  Executes a strict TDD RED-GREEN-REFACTOR cycle for a specific feature or fix.
  Ensures tests are written before implementation and all verification steps pass.
user-invocable: true
argument-hint: "[feature or fix description]"
---

# TDD Cycle

Execute a TDD cycle for: $ARGUMENTS

## Process

### 1. Understand the Requirement
- Parse the feature/fix description
- Identify the expected behavior, inputs, and outputs
- Identify edge cases

### 2. RED — Write Failing Tests
- Create test file(s) if they don't exist
- Write test cases that describe the expected behavior:
  - Happy path
  - Edge cases (null, empty, boundary values)
  - Error cases
- Run the tests and **confirm they FAIL**
- If any test passes unexpectedly, investigate why

### 3. GREEN — Implement
- Write the MINIMUM code to make all tests pass
- Do not add anything beyond what the tests require
- Run tests and **confirm they ALL PASS**
- If tests fail, fix the implementation (NOT the tests)

### 4. REFACTOR — Clean Up
- Review the implementation for code quality
- Simplify, remove duplication, improve naming
- Run tests after each change to ensure they still pass
- If a test breaks, revert the refactoring change

### 5. Verify
- Run the FULL test suite (not just new tests)
- Run lint/typecheck if available
- Confirm zero regressions

### 6. Report
After completing the cycle:
- Summarize what was implemented
- List all tests written
- Confirm all checks pass

Do NOT skip any step. If a step fails, stop and debug before proceeding.
