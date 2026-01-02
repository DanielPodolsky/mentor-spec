---
name: done
description: Complete a task with 5 Gates verification, code review, and career value extraction
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Bash
---

# /mentor-spec:done

Complete a task with gate checks, senior-level code review, and career value extraction.

## Overview

This command is run when the user finishes a task or feature. It performs:
1. **Gate Checks** — 6 Mentorship Gates verification
2. **Code Review** — FAANG-level feedback on their code
3. **Task Completion** — Update spec and roadmap
4. **Interview Story** — Extract STAR format story
5. **Resume Bullet** — Draft action-impact bullet

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

### Phase 2.5: Gate Checks (THE 6 GATES)

Before code review, run through the 6 Mentorship Gates. These ensure quality and understanding.

> "Before we review the code, let's run through the 6 Gates."

#### Gate 1: Ownership (CAN BLOCK)
*Reference: `.claude/skills/gates/ownership/SKILL.md`*

> "Walk me through what this code does, step by step."

**Questions:**
1. "Why did you choose this approach? What alternatives did you consider?"
2. "If the requirements changed to [X], what would you modify?"

**Outcomes:**
- **PASS**: Junior demonstrates clear understanding
- **BLOCKED**: Junior cannot explain → "Let's pause. Review the code and come back when you can explain it."

#### Gate 2: Security (WARNINGS)
*Reference: `.claude/skills/gates/security/SKILL.md`*

> "Where does user input enter this feature?"
> "How is that input validated?"

**Check for:**
- Input validation present
- Authorization checks
- No hardcoded secrets
- No SQL/XSS vulnerabilities

**Outcomes:**
- **PASS**: No issues found
- **WARNING**: Issues found → Note them for code review

#### Gate 3: Error Handling (WARNINGS)
*Reference: `.claude/skills/gates/error/SKILL.md`*

> "What happens if [main operation] fails?"
> "What does the user see when an error occurs?"

**Check for:**
- No empty catch blocks
- User-friendly error messages
- Loading states cleared on error
- Errors logged for debugging

**Outcomes:**
- **PASS**: Error handling appropriate
- **WARNING**: Issues found → Note them for code review

#### Gate 4: Performance (WARNINGS)
*Reference: `.claude/skills/gates/performance/SKILL.md`*

> "What happens when there are 10,000 items?"
> "How many database queries does this make?"

**Check for:**
- No N+1 queries
- Pagination for lists
- No unnecessary re-renders
- Cleanup of intervals/subscriptions

**Outcomes:**
- **PASS**: No obvious issues
- **WARNING**: Issues found → Note them for code review

#### Gate 5: Fundamentals (SUGGESTIONS)
*Reference: `.claude/skills/gates/fundamentals/SKILL.md`*

> "Would a new developer understand this code?"

**Check for:**
- Descriptive naming
- Reasonable function size
- No magic numbers
- Appropriate abstractions

**Outcomes:**
- **PASS**: Code quality is solid
- **SUGGESTIONS**: Polish items → Note for consideration

#### Gate 6: Testing (WARNINGS)
*Reference: `.claude/skills/gates/testing/SKILL.md`*

> "What tests prove this feature works?"

**Questions:**
1. "What tests did you write for this feature?"
2. "What edge cases do your tests cover?"
3. "If I broke [specific part], which test would catch it?"

**Check for:**
- At least one test exists
- Happy path is covered
- At least one edge case considered
- Tests actually run (not skipped)

**Outcomes:**
- **PASS**: Tests exist and cover critical paths
- **WARNING**: No tests or weak coverage → Encourage but don't block

**Note:** This gate issues WARNINGS only. The goal is to build the testing habit through encouragement, not enforcement.

#### Gate Summary

```
┌─────────────────────────────────────────┐
│           GATE CHECK RESULTS            │
├─────────────────────────────────────────┤
│ 1. Ownership:    ✅ PASS / 🛑 BLOCKED   │
│ 2. Security:     ✅ PASS / ⚠️ WARNING   │
│ 3. Error:        ✅ PASS / ⚠️ WARNING   │
│ 4. Performance:  ✅ PASS / ⚠️ WARNING   │
│ 5. Fundamentals: ✅ PASS / 💡 SUGGEST   │
│ 6. Testing:      ✅ PASS / ⚠️ WARNING   │
└─────────────────────────────────────────┘
```

**If BLOCKED on Gate 1:** Stop here. The junior must understand their code before proceeding.

**If WARNINGS exist:** Note them and incorporate into code review. The junior should address them.

**If only SUGGESTIONS:** Proceed to code review. These are polish, not blockers.

---

### Phase 3: Code Review (FAANG Level)

Perform a thorough code review. Be honest but constructive.

**Incorporate any gate warnings into the review.**

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

*Reference: `.claude/skills/career/star-stories/SKILL.md`*

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

*Reference: `.claude/skills/career/resume-bullets/SKILL.md`*

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

### Phase 8: Retrospective Prompt

After completing all phases:

> "This was solid work. To lock in what you learned, run `/retrospective` to:
> - Document what worked well
> - Note any challenges you overcame
> - Update your learning registry
>
> Would you like to run that now?"

---

### Phase 9: Summary

```
┌─────────────────────────────────────────┐
│           TASK COMPLETED!               │
├─────────────────────────────────────────┤
│ Feature: [Name]                         │
│                                         │
│ GATE RESULTS                            │
│ ─────────────                           │
│ Ownership:    ✅ PASS                   │
│ Security:     ⚠️ 1 warning (addressed)  │
│ Error:        ✅ PASS                   │
│ Performance:  ✅ PASS                   │
│ Fundamentals: 💡 2 suggestions          │
│ Testing:      ✅ PASS                   │
│                                         │
│ CODE REVIEW                             │
│ ─────────────                           │
│ Blockers:    0                          │
│ Warnings:    2 (addressed)              │
│ Suggestions: 3                          │
│                                         │
│ CAREER VALUE                            │
│ ─────────────                           │
│ Interview Story: ✅ Saved               │
│ Resume Bullet:   ✅ Drafted             │
│                                         │
│ Commit: [Their commit message]          │
└─────────────────────────────────────────┘

Next steps:
- Run /retrospective to document learnings
- Run /mentor-spec:status to see roadmap progress
- Run /mentor-spec:feature to start next feature
```

---

## Important Notes

1. **Gates are mandatory** — Don't skip them, especially Ownership and Testing
2. **Be honest in reviews** — Sugar-coating doesn't help them grow
3. **But be encouraging** — They finished something, celebrate that
4. **Don't give fixes** — Ask what they would change instead
5. **STAR is powerful** — Help them tell their story well
6. **Resume bullets matter** — These can make or break a job search
7. **Prompt /retrospective** — Learning flywheel captures growth
