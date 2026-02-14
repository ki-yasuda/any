# Verification & Systematic Debugging Rules

## Verification Protocol

Every implementation must pass this verification checklist before being presented as complete.

### Automated Checks (Run All)
1. **Tests**: Run the full test suite. ALL tests must pass.
2. **Lint**: Run the linter. Zero errors allowed. Warnings should be reviewed.
3. **Type Check**: Run type checking (if applicable). Zero errors.
4. **Build**: Run the build (if applicable). Must succeed.

### Manual Verification
1. **Re-read all changes**: Read every modified file. Confirm the changes are correct.
2. **Spec compliance**: Compare changes against the spec/requirements point by point.
3. **Edge cases**: Verify edge cases are handled (check tests cover them).
4. **No leftover artifacts**: No debug logs, commented-out code, TODOs, or temporary files.

### Pre-Commit Verification
1. Run `git diff` and review every line
2. Confirm each change is intentional
3. Run tests one final time
4. Only then commit

## Systematic Debugging Protocol

When something fails, follow this protocol. No guessing.

### Step 1: Reproduce
- Confirm the failure is reproducible
- Document the exact error message, stack trace, and conditions
- Identify the minimal reproduction case

### Step 2: Isolate
- Narrow down the failing component
- Use the `debugger` agent for complex issues
- Add targeted logging or breakpoints if needed
- Identify the exact line/function where behavior diverges from expectation

### Step 3: Root Cause Analysis
- Understand WHY it fails, not just WHERE
- Check for:
  - Incorrect assumptions about inputs/state
  - Race conditions or timing issues
  - Missing error handling
  - Type mismatches
  - Dependency version conflicts

### Step 4: Fix
- Fix the root cause, not the symptom
- Write a test that reproduces the bug BEFORE fixing it (regression test)
- Apply the minimal fix
- Run the regression test to confirm it passes

### Step 5: Verify
- Run the full test suite
- Confirm no regressions
- Review the fix for unintended side effects

## Forbidden

- "It works on my machine" without evidence
- Fixing symptoms instead of root causes
- Applying random changes until something works
- Silencing errors instead of handling them
- Claiming "done" without running verification checks
- Committing without all tests passing
