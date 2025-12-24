---
name: init
description: Initialize MentorSpec project with mission, stack, and roadmap
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Bash, mcp__context7__resolve-library-id, mcp__context7__get-library-docs
---

# /mentor-spec:init

Initialize a MentorSpec project by defining the mission, detecting the stack, and creating a roadmap.

## Overview

This command works for both **new projects** (empty directory) and **existing projects** (mid-development).

**Output:**
- `mentorspec/product/mission.md` — Project purpose and vision
- `mentorspec/product/stack.md` — Technology decisions and rationale
- `mentorspec/product/roadmap.md` — Phased development plan

---

## The Philosophy

These questions force THINKING, not feature-listing. Most juniors skip straight to "I want a login form." We force them to think about VALUE first.

---

## Execution Flow

### Phase 0: Context7 Check

Before anything else, check if Context7 MCP is available:

1. **Check for Context7:** Try to use `mcp__context7__resolve-library-id` silently
2. **If NOT available:** Show this message:

```
⚠️ Context7 MCP not detected.

MentorSpec uses Context7 to fetch official documentation for any library.
This ensures you always learn from up-to-date, official sources.

To install (takes 30 seconds):
  claude mcp add --transport http context7 https://mcp.context7.com/mcp

After installing, restart Claude Code and run /mentor-spec:init again.

📖 Full setup guide: mentorspec/guides/context7-setup.md
```

3. **If available:** Continue silently to Phase 1.

---

### Phase 1: Detection (Silent)

Before asking questions, analyze the project silently:

1. **Check for existing code:**
   - Look for package.json, requirements.txt, go.mod, Cargo.toml, etc.
   - Scan for src/, app/, components/, pages/, api/ directories
   - Check for config files

2. **Detect technologies:**
   - Frontend: React, Vue, Svelte, Next.js, Vite, etc.
   - Backend: Express, FastAPI, Go, Rust, etc.
   - Database: PostgreSQL, MongoDB, Prisma, etc.

3. **Store detection results** — do NOT ask about stack unless it's a new/empty project.

---

### Phase 2: The Problem (Free Text — Forces Thinking)

**Ask this exact question:**

> "In plain English, what PROBLEM are you solving?
>
> Don't describe features. Describe the PROBLEM.
>
> Example:
> - Bad: 'A medication reminder app'
> - Good: 'People forget to take their medications on time, which leads to health issues'
>
> What problem are you solving?"

**Wait for their response.** This forces them to think about VALUE, not features.

---

### Phase 3: Who Is This For? (AskUserQuestion)

Use AskUserQuestion to present clickable options:

```
Question: "Who will use this project?"

Options:
1. Yourself (learning/portfolio)
   Description: Building skills and showcasing work to employers

2. Employers (job hunting)
   Description: Creating a portfolio piece to demonstrate abilities

3. A client (freelance)
   Description: Building something for someone else

4. Real users (product)
   Description: Building something people will actually use
```

**Why this matters:** Changes the mentorship approach:
- Portfolio → Focus on interview stories, defensible decisions
- Client → Focus on handoff, documentation
- Product → Focus on user needs, scalability

---

### Phase 4: Definition of Done (Free Text)

**Ask this exact question:**

> "When is this project DONE? What specific things must work?
>
> Be concrete. Not 'it works well' but 'user can sign up, log in, and save at least 3 items.'
>
> What must work for this project to be complete?"

**Wait for their response.** This prevents scope creep and teaches juniors to define completion upfront.

---

### Phase 5: Stack Confirmation (Only if needed)

**If technologies were detected:**
Show what was detected and confirm silently. No questions needed.

**If NO technologies detected (empty/new project):**
Use AskUserQuestion:

```
Question: "What's your primary technology stack?"

Options:
1. React/Next.js with TypeScript
2. Vue/Nuxt
3. Python/FastAPI or Django
4. Node.js/Express
```

---

### Phase 6: Generate Outputs

Based on collected information, generate:

#### mission.md

```markdown
# Project Mission

## The Problem

[User's problem statement - in their words]

## Who Is This For?

[Based on selection: Myself/Employers/Client/Real Users]

## Definition of Done

When these things work, the project is COMPLETE:

- [ ] [From user's definition of done]
- [ ] [Break down into specific checkboxes]
- [ ] [Be concrete and measurable]

## Why This Matters

[Brief statement connecting problem to solution - written by mentor based on their answers]
```

#### stack.md

```markdown
# Technology Stack

## Detected/Chosen Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| Frontend | [Detected] | [Auto-filled purpose] |
| Backend | [Detected] | [Auto-filled purpose] |
| Database | [Detected] | [Auto-filled purpose] |
| Styling | [Detected] | [Auto-filled purpose] |

## Why These Choices?

[If detected: "These were already in your project."]
[If chosen: Brief rationale for the stack choice]

## Key Files

| File | Purpose |
|------|---------|
| [Auto-detected entry point] | [Purpose] |
| [Config files] | [Purpose] |
```

#### roadmap.md

```markdown
# Project Roadmap

## Current Status

[New project / Existing project description]

## Phase 1: Foundation

Priority: HIGH

- [ ] Project setup complete
- [ ] Core structure in place
- [ ] [Based on their Definition of Done]

## Phase 2: Core Features

Priority: MEDIUM

- [ ] [Derived from their problem statement]
- [ ] [Break down logically]

## Phase 3: Polish & Deploy

Priority: LOW

- [ ] Testing and bug fixes
- [ ] Documentation
- [ ] Deployment
```

---

### Phase 7: Summary & Next Step

After generating files, provide:

```
MentorSpec initialized!

Problem: [One-line from their answer]
For: [Who they selected]
Done when: [Summary of their definition]
Stack: [Technologies]

Created:
- mentorspec/product/mission.md
- mentorspec/product/stack.md
- mentorspec/product/roadmap.md

Next step: Run /mentor-spec:feature to plan your first feature.
```

---

## Important Notes

1. **Free text for deep questions** — Forces thinking. Don't replace with clickable options.
2. **Auto-detect first** — Don't ask about stack if you can see it in the code.
3. **The Problem question is critical** — Push back if they describe features instead of problems.
4. **Definition of Done prevents scope creep** — Hold them to what they defined.
5. **Keep it conversational** — This is mentorship, not a form.

---

## If They Give Weak Answers

**If problem sounds like features:**
> "That sounds like a feature description. Let's dig deeper — what's the underlying PROBLEM that makes this feature necessary? Why would someone need this?"

**If definition of done is vague:**
> "That's a bit broad. Can you be more specific? What's ONE thing that absolutely must work? Let's start there."

**If they say 'I don't know':**
> "That's okay — let's think through it together. What frustrated you enough to start this project? Or what would make you proud to show this to an employer?"
