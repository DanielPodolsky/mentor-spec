---
name: feature
description: Create a feature specification using spec-driven development
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, mcp__context7__resolve-library-id, mcp__context7__get-library-docs, mcp__octocode__githubSearchCode, mcp__octocode__githubGetFileContent, mcp__octocode__githubSearchRepositories
---

# /mentor-spec:feature

Create a feature specification using **Spec-Driven Development (SDD)**.

## Overview

This command follows the SDD workflow:
1. **AI generates** spec.md, design.md, tasks.md based on minimal input
2. **Junior reviews** the generated specs
3. **Junior adds** any missing edge cases or requirements
4. **Then** implementation begins with mentorship

**Output:**
- `mentorspec/specs/active/[feature-name]/spec.md` — Feature specification
- `mentorspec/specs/active/[feature-name]/design.md` — Technical design
- `mentorspec/specs/active/[feature-name]/tasks.md` — Phased implementation checklist

---

## The SDD Philosophy

> "Spec first, code second. But YOU write the code."

Unlike other SDD tools where AI writes code, MentorSpec uses SDD for PLANNING only.
The implementation phase is where the junior learns by doing.

---

## Execution Flow

### Phase 1: Core Requirements (Minimal Input)

Ask only what's needed to generate specs:

**1a. Feature Name:**
> "What are you building? Give it a short name (e.g., 'login form', 'user settings', 'dark mode')."

Generate slug: `login-form`, `user-settings`, `dark-mode`

**1b. One-Line Description:**
> "In one sentence, what does this feature do?"

**1c. User Story (Keep it simple):**
> "Complete this: As a [user type], I want to [action] so that [benefit]."

Push back ONLY if they skip the 'so that' part — that's the value.

---

### Phase 2: MCP-Powered Research

Before generating specs, gather intelligence:

#### Context7 — Official Documentation
Fetch latest docs for relevant libraries:
```
Use mcp__context7__get-library-docs for:
- Form handling (if form feature)
- Authentication (if auth feature)
- Data fetching (if API feature)
- State management patterns
```

#### Octocode — Production Implementations
Search GitHub for how real apps implement similar features:
```
Use mcp__octocode__githubSearchCode to find:
- How popular projects implement this feature
- Common patterns and approaches
- Edge cases handled in production

Example: For "login form", search:
- "login form react" in popular repos
- "authentication flow next.js"
- "form validation typescript"
```

Present research findings:
```
📖 Documentation (Context7):
- React 19 recommends [pattern] for forms
- Key API: useActionState for async form handling

🔍 Production Examples (Octocode):
- [popular-app] implements login with [approach]
- Common pattern: separate validation logic
- Edge case often handled: rate limiting
```

---

### Phase 3: AI Generates Specs (The SDD Part)

**Read the project context:**
1. Check `mentorspec/product/mission.md` for project goals
2. Check `mentorspec/product/stack.md` for technology constraints
3. Scan existing code structure to understand patterns

**Generate all three files based on:**
- User's input from Phase 1
- MCP research from Phase 2
- Project context
- Technology stack
- Best practices from documentation AND production examples

---

### Phase 4: Present Specs for Review

After generating, present a summary:

```
I've generated your feature specs based on your requirements, official docs,
and how production apps implement this.

📋 spec.md — What we're building
   • User Story: [their story]
   • Acceptance Criteria: [3-4 items I generated]
   • Edge Cases: [4-5 I identified from research]
   • Out of Scope: [2-3 exclusions]

🏗️ design.md — How we're building it
   • Components: [list]
   • Data Flow: [summary]
   • State: [where it lives]
   • Patterns: [based on Context7 + Octocode research]

✅ tasks.md — Implementation phases
   • Phase 1: Foundation [X tasks]
   • Phase 2: Core Logic [X tasks]
   • Phase 3: Integration [X tasks]
   • Phase 4: Polish [X tasks]

Please review these specs. You should:
1. Read through spec.md and design.md
2. ADD any edge cases I missed
3. MODIFY anything that doesn't match your vision
4. REMOVE anything out of scope

When ready:
- Run /mentor-spec:advise to prepare for implementation
- Then /mentor-spec:guide to start Phase 1
```

---

### Phase 5: Junior Review & Acceptance

Use AskUserQuestion:

```
Question: "Have you reviewed the specs?"

Options:
1. Yes, they look good
   Description: Ready to start implementation

2. I want to add edge cases
   Description: Tell me what scenarios I missed

3. I want to modify something
   Description: Tell me what needs to change

4. Let me read them first
   Description: Take your time — run this command again when ready
```

Based on response:
- **Looks good:** Finalize and move to implementation
- **Add/Modify:** Make changes, regenerate summary
- **Read first:** End command, let them review

---

## Generated File Templates

### spec.md

```markdown
# Feature: [Feature Name]

> Generated by MentorSpec. Review and modify as needed.

## User Story

As a [user type], I want to [action] so that [benefit].

## Acceptance Criteria

When these pass, the feature is DONE:

- [ ] [Criterion 1 - specific and testable]
- [ ] [Criterion 2]
- [ ] [Criterion 3]
- [ ] [Criterion 4]

## Edge Cases

| Scenario | Expected Behavior |
|----------|-------------------|
| Empty input | Show validation error, focus on field |
| Network failure | Show error message, allow retry |
| Double submission | Disable button after first click |
| [From Octocode research] | [Appropriate handling] |
| [From Octocode research] | [Appropriate handling] |

> **Junior:** Add any edge cases I missed below:
> - [ ] _Your edge case here_

## Out of Scope

What this feature does NOT include (keeps focus):

- [Exclusion 1 — future feature]
- [Exclusion 2 — different feature]
- [Exclusion 3 — out of MVP]

## Dependencies

Before starting:
- [ ] [Any prerequisites]
- [ ] [APIs that must exist]
- [ ] [Components that must be built first]

## Research References

- Context7: [Library docs referenced]
- Octocode: [Repos examined for patterns]
```

### design.md

```markdown
# Technical Design: [Feature Name]

> Generated by MentorSpec based on your stack, official docs, and production patterns.

## Overview

[One paragraph explaining the technical approach, based on project stack and research]

## Architecture

```
[ASCII diagram showing component relationships]
```

## Components

| Component | Purpose | New/Modified | Location |
|-----------|---------|--------------|----------|
| [Component 1] | [What it does] | New | src/components/ |
| [Component 2] | [What it does] | Modified | src/pages/ |

## Data Flow

1. **Trigger:** [User action that starts this]
2. **Frontend:** [What happens in UI]
3. **State Update:** [How state changes]
4. **API Call:** [If applicable]
5. **Response:** [What comes back]
6. **UI Update:** [How UI reflects result]

## State Management

| State | Type | Location | Initial Value |
|-------|------|----------|---------------|
| [state name] | boolean | useState | false |
| [state name] | object | [per stack] | null |

## Error Handling

| Error Type | User Sees | Code Does |
|------------|-----------|-----------|
| Validation | "Please enter a valid email" | Prevent submit, focus field |
| Network | "Something went wrong. Try again." | Log error, show retry button |
| Auth | "Please log in to continue" | Redirect to login |

## Security Considerations

- [ ] Input validation on frontend AND backend
- [ ] No sensitive data in localStorage
- [ ] [Other considerations based on feature]

## Patterns from Research

Based on Context7 and Octocode research:
- [Pattern 1 from docs or production apps]
- [Pattern 2]
- [Anti-pattern to avoid]
```

### tasks.md

```markdown
# Implementation Tasks: [Feature Name]

> Work through these phases IN ORDER. Each phase builds on the previous.

## Before You Start

- [ ] Read and understand spec.md
- [ ] Read and understand design.md
- [ ] Run /mentor-spec:advise for pre-work preparation
- [ ] Check that dependencies are met
- [ ] Ask mentor if anything is unclear

---

## Phase 1: Foundation
> Build the skeleton. No logic yet.

- [ ] Create component file(s) at correct location
- [ ] Set up basic structure (HTML/JSX only)
  └── Depends on: Component file exists
- [ ] Add placeholder styling
  └── Depends on: Basic structure

**Checkpoint:** You should see the component render (empty/unstyled is fine).

---

## Phase 2: Core Logic
> Add the main functionality.

- [ ] [First core task]
  └── Depends on: Phase 1 complete
- [ ] [Second core task]
  └── Depends on: [specific task]
- [ ] [Third core task]
  └── Depends on: [specific task]

**Checkpoint:** Core functionality works with happy path.

---

## Phase 3: Edge Cases
> Handle what can go wrong.

- [ ] Handle empty/invalid input
- [ ] Handle network failures
- [ ] Handle loading states
- [ ] [Other edge cases from spec]

**Checkpoint:** Feature handles errors gracefully.

---

## Phase 4: Polish
> Make it production-ready.

- [ ] Add proper error messages
- [ ] Add loading indicators
- [ ] Final styling pass
- [ ] Test against acceptance criteria

**Checkpoint:** All acceptance criteria pass.

---

## Completion

- [ ] Self-review: Does it match the spec?
- [ ] Run /mentor-spec:done for 5 Gates + code review + STAR story
- [ ] Run /mentor-spec:retrospective to capture learnings

## Progress Tracking

| Phase | Status | Started | Completed |
|-------|--------|---------|-----------|
| Foundation | Not Started | - | - |
| Core Logic | Not Started | - | - |
| Edge Cases | Not Started | - | - |
| Polish | Not Started | - | - |

---

*Remember: YOU write the code. Ask your mentor when stuck.*
```

---

## Important Notes

1. **AI generates, junior reviews** — This is the SDD model
2. **Keep specs lean** — Verbose specs amplify confusion, not clarity
3. **Phases are mandatory** — Don't skip to Phase 3 before Phase 1 is done
4. **Edge cases are pre-populated** — Junior adds any we missed
5. **Out of Scope is critical** — Prevents feature creep
6. **Use MCPs** — Context7 for docs, Octocode for production patterns
7. **Prompt /advise** — Before implementing, run /advise for preparation
