---
name: done
description: Complete a task with code review and career value extraction
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Bash
---

# /mentor-spec:done

Complete a task with senior-level code review and extract career value.

## Overview

This command is run when the user finishes a task or feature. It performs:
1. **Code Review** — FAANG-level feedback on their code
2. **Task Completion** — Update spec and roadmap
3. **Interview Story** — Extract STAR format story
4. **Resume Bullet** — Draft action-impact bullet

---

## Execution Flow

### Phase 1: Identify Completed Work

```
Question: "What did you just finish?"

Options:
1. A task from my active spec
   Description: Completing planned work

2. A bug fix
   Description: Fixed something that was broken

3. A feature (not specced)
   Description: Built something new

4. A refactor
   Description: Improved existing code
```

If from active spec, read the spec to understand context:
- Check `mentorspec/specs/active/*/tasks.md`
- Find the relevant task
- Note what they were building and why

---

### Phase 2: Gather Changes

Review what code was written:

```bash
# Recent commits
git log --oneline -5

# Files changed
git diff --name-only HEAD~1

# Or if uncommitted
git status
```

Ask them to point to the key files:

> "Which files contain the main implementation?"

Read those files to understand what they built.

---

### Phase 3: Code Review (FAANG Level)

Perform a thorough code review. Be honest but constructive.

#### Review Categories

**Correctness**
- Does it work?
- Are edge cases handled?
- What happens with invalid input?

**Security**
- Any injection vulnerabilities?
- Secrets exposed?
- Input validation?

**Performance**
- Unnecessary re-renders?
- Expensive operations optimized?
- Memory leaks?

**Readability**
- Clear naming?
- No magic numbers?
- Reasonable function size?

**Maintainability**
- Easy to change?
- Well-structured?
- DRY but not over-abstracted?

#### Review Format

Use severity levels:

```markdown
## Code Review

### Blockers (Must Fix)

**Issue:** [Description]
`path/file.ts:42`

[Explanation of the issue]

**Why it matters:** [Impact]

**Question for you:** [What would you change? - don't give the answer]

---

### Warnings (Should Consider)

**Issue:** [Description]
`path/file.ts:88`

[Explanation]

**Consider:** [Improvement direction]

---

### Suggestions (Nice to Have)

**Idea:** [Improvement]

[Why this would be better]
```

**Important:** For blockers and warnings, ask them what they would change rather than giving the fix.

---

### Phase 4: Task Update

Update the spec files:

1. Mark task as complete in `tasks.md`
2. Update status from "In Progress" to "Complete"
3. Note completion date

If all tasks complete, move spec to `completed/`:

```bash
mv mentorspec/specs/active/[feature]/ mentorspec/specs/completed/
```

Update `roadmap.md` with progress.

---

### Phase 5: Interview Story (STAR Method)

**Explain STAR first:**

> "Let's extract an interview story from this work using the STAR method:
>
> **S - Situation:** What was the context? What problem existed?
> **T - Task:** What were YOU specifically responsible for?
> **A - Action:** What did YOU do? (Be specific about YOUR work)
> **R - Result:** What was the outcome? (Quantify if possible)
>
> When interviewers ask 'Tell me about a time you...', this is what they want."

Guide them through:

> "Walk me through your STAR story for this work:
>
> What was the **Situation**? What problem or challenge existed?"

[Wait for response]

> "What was your **Task**? What were you specifically responsible for?"

[Wait for response]

> "What **Action** did you take? Be specific about what YOU did."

[Wait for response]

> "What was the **Result**? What outcome did your work produce?"

Save the story to `mentorspec/career/stories/[date]-[feature].md`

---

### Phase 6: Resume Bullet

Draft a resume bullet point:

> "Let's create a resume bullet point. The format is:
>
> **Action Verb + What You Did + Impact**
>
> Examples:
> - Bad: 'Built a login form'
> - Good: 'Engineered JWT authentication with refresh rotation, reducing session vulnerability surface'
>
> - Bad: 'Fixed bugs in the app'
> - Good: 'Identified and resolved race condition in form submission, preventing duplicate API calls'"

Ask:

```
Question: "What's the most impressive aspect of what you just built?"

Options:
1. The technical complexity
   Description: Solved a hard problem

2. The problem I solved
   Description: Fixed something important

3. The user impact
   Description: Made things better for users

4. The performance gain
   Description: Made things faster/more efficient
```

Help them craft a compelling bullet based on their choice.

---

### Phase 7: Commit Pitch Check

If they haven't committed yet:

> "Great work! Before we wrap up, let's commit this properly.
>
> Remember: Every commit is a pitch to a recruiter.
>
> What would be a good commit message for this work?
> Format: type(scope): description"

Reject vague commits:
```
Rejected:
- "fix bug"
- "wip"
- "update"
- "changes"

Accepted:
- "feat(auth): implement JWT refresh token rotation"
- "fix(form): resolve race condition in submission"
```

---

### Phase 8: Summary

```
Task Completed!

Feature: [Name]

## Code Review Summary
- Blockers: [count]
- Warnings: [count]
- Suggestions: [count]

## Career Value Extracted
- Interview Story: mentorspec/career/stories/[file]
- Resume Bullet: "[The bullet point]"

## Commit
[Their commit message]

---

What's next?
- Run /mentor-spec:status to see your roadmap progress
- Run /mentor-spec:feature to start a new feature
```

---

## Important Notes

1. **Be honest in reviews** — Sugar-coating doesn't help them grow
2. **But be encouraging** — They finished something, that's worth celebrating
3. **Don't give fixes** — Ask what they would change instead
4. **STAR is powerful** — Help them tell their story well
5. **Resume bullets matter** — These can make or break a job search
