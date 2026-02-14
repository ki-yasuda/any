# Test-Driven Development Rules

## TDD Is Mandatory

All new code MUST follow the RED-GREEN-REFACTOR cycle. No exceptions.

## The Cycle

### 1. RED — Write a Failing Test
- Write the test FIRST, before any implementation
- The test must clearly express the expected behavior
- Run the test and confirm it FAILS
- If the test passes without new code, the test is wrong or the feature already exists

### 2. GREEN — Write Minimum Code
- Write the SMALLEST amount of code to make the test pass
- Do not add extra logic, optimizations, or features
- Run the test and confirm it PASSES
- If it fails, fix the implementation (not the test)

### 3. REFACTOR — Clean Up
- Improve code quality while keeping all tests green
- Remove duplication, improve naming, simplify logic
- Run tests after EVERY refactoring change
- If any test breaks during refactoring, revert and try again

## Test Requirements

### Coverage
- Every public function/method must have at least one test
- Edge cases must be tested (null, empty, boundary values, error states)
- Error handling paths must be tested
- Integration points must have integration tests

### Test Quality
- Tests must be independent (no shared mutable state)
- Tests must be deterministic (no flaky tests)
- Test names must describe the behavior being tested
- Each test should test ONE thing

## Verification After Each Cycle

After completing a RED-GREEN-REFACTOR cycle:
1. Run the full test suite (not just the new test)
2. Confirm no regressions
3. Only then move to the next cycle

## When Tests Don't Exist Yet

If the project has no testing infrastructure:
1. Set up the testing framework FIRST
2. Write tests for existing code that will be modified
3. Then proceed with TDD for new changes

## Forbidden

- Writing implementation code before tests
- Deleting or modifying tests to make them pass (instead of fixing the code)
- Skipping test runs between changes
- Marking tests as skipped/pending without a documented reason
- Claiming "it works" based on manual testing alone
