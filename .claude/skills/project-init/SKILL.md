---
name: project-init
description: >
  Initializes a new project or major feature with full research and setup.
  Use when starting any new project, feature, or significant piece of work.
  Performs best-practice research, Claude Code config review, and creates specs.
user-invocable: true
argument-hint: "[project-or-feature-name]"
---

# Project Initialization

Initialize the project/feature: $ARGUMENTS

## Steps

1. **Research Phase** (parallel):
   - Use the `researcher` agent to find latest best practices for the technology stack
   - Use web search to check for latest Claude Code features and configuration options
   - Explore the existing codebase for patterns and conventions

2. **Claude Code Environment Review**:
   - Check if `.claude/settings.json`, agents, skills, and rules are up to date
   - Update configuration if new best practices are found
   - Create task-specific agents/skills if needed

3. **Specification**:
   - Write a clear spec for the project/feature based on research findings
   - Include requirements, API contracts, edge cases, and out-of-scope items

4. **UI/UX Design** (if user-facing):
   - Use the `designer` agent to create wireframes and user flows
   - Present design to user for approval before proceeding

5. **Implementation Plan**:
   - Break work into parallel tasks
   - Assign agents/skills to each task
   - Define execution order and dependencies

Present the spec and plan to the user for approval before implementation.
