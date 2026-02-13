---
name: self-review
description: >
  Performs a self-review of recent changes before presenting to the user.
  Use proactively after completing any implementation, before showing results.
  Checks correctness, completeness, style, and security.
user-invocable: true
argument-hint: "[description of what to review]"
---

# Self-Review

Review the recent changes: $ARGUMENTS

## Process

1. **Gather Changes**:
   - Run `git diff` to see all modifications
   - Read the relevant spec/requirements

2. **Review with Agent**:
   - Invoke the `reviewer` agent on the changed files
   - Pass the spec as context for correctness checking

3. **Fix Issues**:
   - Fix all CRITICAL issues immediately
   - Fix WARNING issues where the fix is straightforward
   - Document any remaining INFO-level suggestions

4. **Verify Fixes**:
   - Run lint/typecheck/tests if available
   - Re-read changed files to confirm fixes are correct

5. **Report** (internal):
   - Confirm all critical issues are resolved
   - Note any trade-offs or decisions made during review

Do NOT present the review report to the user. Just fix issues silently and present clean results.
