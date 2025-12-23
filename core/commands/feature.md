---
name: feature
description: Create a feature specification through guided Q&A
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
---

# /mentor-spec:feature

Create a detailed feature specification through interactive Q&A.

## Overview

This command guides the user through defining a feature BEFORE any code is written. The output is a structured spec that serves as the implementation roadmap.

**Output:**
- `mentorspec/specs/active/[feature-name]/spec.md` — Feature specification
- `mentorspec/specs/active/[feature-name]/design.md` — Technical design
- `mentorspec/specs/active/[feature-name]/tasks.md` — Implementation checklist

---

## The 5-Minute Architect Rule

> "Never start coding without a plan."

Before any implementation, the user must answer:
1. What are we building? (User story)
2. What are the acceptance criteria?
3. What are the edge cases?
4. What's the technical approach?

---

## Execution Flow

### Phase 1: Feature Naming

Ask:
> "What feature are you building? Give it a short name."

(User types: e.g., "User authentication", "Contact form", "Dark mode")

Generate a slug: `user-authentication`, `contact-form`, `dark-mode`

---

### Phase 2: User Story (Free Text — Forces Thinking)

**Ask this exact question:**

> "Complete this user story:
>
> As a [type of user], I want to [action] so that [benefit].
>
> This forces you to think WHO and WHY, not just WHAT.
>
> Example:
> - Bad: 'A login form'
> - Good: 'As a returning user, I want to log in quickly so that I can access my saved data'
>
> Write your user story:"

**Wait for their response.** Push back if they skip the 'so that' part — that's the VALUE.

---

### Phase 3: Acceptance Criteria (Free Text)

**Ask:**

> "How will you know this feature is DONE? List 2-3 specific things that must work.
>
> Be concrete and testable:
> - 'User can log in with email and password'
> - 'Error message shows for invalid credentials'
> - 'Session persists across browser refresh'
>
> What must work for this feature to be complete?"

---

### Phase 4: Edge Cases (AskUserQuestion + Socratic)

This is where mentorship shines. First, probe with questions:

> "Before we start building, let's think about what could go wrong. What happens if..."
> - The user double-clicks the submit button?
> - The network request fails?
> - The input is empty?
> - The input is very long?
> - The user is on a slow connection?

Then use AskUserQuestion to confirm they've considered these:

```
Question: "Which edge cases have you considered?"

Options (multiSelect: true):
1. Empty/invalid input
   Description: User submits without filling required fields

2. Network failures
   Description: API call fails or times out

3. Double submission
   Description: User clicks button multiple times

4. Slow connections
   Description: Loading states and timeouts
```

For each selected, ask: "What should happen in this case?"

---

### Phase 5: Technical Design (Guided)

Based on the feature, ask targeted questions:

**For UI Features:**
```
Question: "Where does this component live in your app?"

Options:
1. New page/route
2. Component on existing page
3. Modal/overlay
4. Global (header/footer/sidebar)
```

**For Data/API Features:**
```
Question: "How does data flow?"

Options:
1. Frontend only (local state)
2. API call to backend
3. Real-time (WebSocket/subscription)
4. Form submission
```

---

### Phase 6: Generate Spec Files

Create the spec directory and files:

#### spec.md

```markdown
# Feature: [Feature Name]

## User Story

As a [user type], I want to [action] so that [benefit].

## Acceptance Criteria

When these pass, the feature is DONE:

- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Edge Cases

| Scenario | Expected Behavior |
|----------|-------------------|
| [Edge case 1] | [What should happen] |
| [Edge case 2] | [What should happen] |

## Out of Scope

What this feature does NOT include:
- [Explicit exclusion 1]
- [Explicit exclusion 2]

## Dependencies

- [Required before starting]
```

#### design.md

```markdown
# Technical Design: [Feature Name]

## Overview

[One-paragraph summary of technical approach]

## Components

| Component | Purpose | New/Modified |
|-----------|---------|--------------|
| [Component 1] | [What it does] | New |
| [Component 2] | [What it does] | Modified |

## Data Flow

1. User action: [What triggers this]
2. Frontend: [What happens in UI]
3. Backend: [API call if any]
4. Response: [What comes back]
5. UI Update: [How UI reflects changes]

## State Management

| State | Location | Initial Value |
|-------|----------|---------------|
| [State name] | [Where it lives] | [Default] |

## Error Handling

| Error Type | User Message | Technical Action |
|------------|--------------|------------------|
| Validation | [User-friendly] | [What code does] |
| Network | [User-friendly] | [What code does] |
```

#### tasks.md

```markdown
# Implementation Tasks: [Feature Name]

## Setup
- [ ] Review spec with mentor
- [ ] Set up any required dependencies

## Implementation
- [ ] [Task 1 - specific and actionable]
- [ ] [Task 2]
- [ ] [Task 3]
- [ ] [Task 4]

## Edge Case Handling
- [ ] Handle empty/invalid input
- [ ] Handle network failures
- [ ] [Other edge cases from spec]

## Testing
- [ ] Manual test happy path
- [ ] Manual test each edge case
- [ ] [Unit tests if applicable]

## Completion
- [ ] Self-review against acceptance criteria
- [ ] Run /mentor-spec:done for code review + career extraction

## Progress

- Created: [date]
- Status: Not Started
- Current Task: None
```

---

### Phase 7: Summary

```
Feature spec created!

Feature: [Name]
Location: mentorspec/specs/active/[slug]/

Files:
- spec.md — What we're building and why
- design.md — How we're building it
- tasks.md — Step-by-step checklist

Your user story: "[User story]"
Done when: [Summary of acceptance criteria]

Next step: Run /mentor-spec:guide to start implementing the first task.
Remember: YOU write the code. I guide you.
```

---

## Important Notes

1. **No code in this phase** — This is pure planning
2. **User decides** — AI asks questions, user makes choices
3. **Edge cases matter** — Push them to think through failure modes
4. **Keep specs small** — One feature per spec, break large features down
5. **The user story is critical** — Push back if they skip the 'so that' benefit

---

## If They Give Weak Answers

**If user story lacks 'so that':**
> "I notice you skipped the 'so that' part. That's the most important piece — it's WHY this matters. What benefit does this give the user?"

**If acceptance criteria are vague:**
> "How would you test that? Can you make it more specific? What would you actually check?"

**If they want to skip edge cases:**
> "I know it feels like extra work, but trust me — edge cases are where bugs hide. Let's think through at least 2 things that could go wrong."
