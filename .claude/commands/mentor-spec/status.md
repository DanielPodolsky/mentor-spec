---
name: status
description: Check project progress, active tasks, learning stats, and career portfolio
allowed-tools: Read, Glob, Grep, Bash
---

# /mentor-spec:status

Get a comprehensive status report on project progress and learning growth.

## Overview

This command provides:
1. **Roadmap Progress** — Where you are in the project
2. **Active Specs** — Current work in progress
3. **Learning Stats** — Skills and patterns documented (NEW)
4. **Recent Activity** — Last commits and changes
5. **Career Stats** — Interview stories and resume bullets collected

---

## Execution Flow

### Step 1: Gather Data

Read project files to compile status:

```
mentorspec/product/roadmap.md — Overall progress
mentorspec/specs/active/ — Current work
mentorspec/specs/completed/ — Finished features
mentorspec/career/stories/ — Interview stories
learning/LEARNING_REGISTRY.md — Learning flywheel data
.claude/skills/learned/ — Auto-generated skills
```

Also check git activity:
```bash
git log --oneline -10 --since="1 week ago"
```

---

### Step 2: Generate Status Report

#### Roadmap Progress

```markdown
## Roadmap Progress

Phase 1: Foundation ████████░░ 80%
- [x] Project setup
- [x] Basic structure
- [ ] Auth system (in progress)
- [ ] API routes

Phase 2: Core Features ░░░░░░░░░░ 0%
- [ ] Feature 1
- [ ] Feature 2

Overall: ████░░░░░░ 40%
```

---

#### Active Work

```markdown
## Active Specs

### [Feature Name] (in progress)
Location: mentorspec/specs/active/[slug]/

Tasks:
- [x] [Completed task]
- [ ] [Current task] <-- YOU ARE HERE
- [ ] [Pending task]

Progress: 2/4 tasks (50%)
```

If no active specs:

```markdown
## Active Specs

No active specs. Run /mentor-spec:feature to start a new feature.
```

---

#### Learning Stats (NEW)

```markdown
## Learning Growth

Patterns Documented:  ███░░░░░░░ 4
Failures Documented:  █░░░░░░░░░ 2
Total Insights:       ████░░░░░░ 6

Domains Explored:
• Auth:     ████████░░ (8 learnings)
• Forms:    ████░░░░░░ (4 learnings)
• API:      ██░░░░░░░░ (2 learnings)
• Database: ░░░░░░░░░░ (0 learnings)

Current Level: ⭐⭐⭐ (Intermediate)

Last Learning: "Always initialize array state as [] not undefined" (3 days ago)
```

Competency levels:
- ⭐ Beginner (0-5 learnings)
- ⭐⭐ Developing (6-15 learnings)
- ⭐⭐⭐ Intermediate (16-30 learnings)
- ⭐⭐⭐⭐ Advanced (31-50 learnings)
- ⭐⭐⭐⭐⭐ Expert (50+ learnings)

---

#### Recent Activity

```markdown
## Recent Activity (Last 7 Days)

Commits:
- feat(auth): implement login form (2 days ago)
- fix(api): resolve CORS issue (3 days ago)
- chore(deps): update dependencies (5 days ago)

Files Changed: 12
Lines Added: 342
Lines Removed: 89
```

---

#### Career Stats

```markdown
## Career Portfolio

Interview Stories: 3
- "Debugging race condition in form submission"
- "Implementing JWT refresh rotation"
- "Building accessible navigation"

Resume Bullets: 3
- "Engineered secure authentication..."
- "Resolved critical race condition..."
- "Developed WCAG-compliant navigation..."

Each feature you complete adds to your interview arsenal!
```

---

### Step 3: Recommendations

Based on status, provide personalized recommendations:

#### If they have active work:
```
## Next Steps

You're currently working on: [Feature Name]
Current task: [Task description]

Suggested action: Run /mentor-spec:guide to continue implementing
```

#### If no active work:
```
## Next Steps

Your roadmap shows these pending phases:
- Phase 2: Core Features

Suggested action: Run /mentor-spec:feature to start your next feature
```

#### If they've been inactive:
```
## Welcome Back!

It's been [X days] since your last commit.
You were working on: [Feature]

Want to pick up where you left off?
Run /mentor-spec:guide to continue, or /mentor-spec:feature for something new.
```

#### If low learning stats:
```
## Learning Flywheel Reminder

You have [X] learnings documented.
Run /mentor-spec:retrospective after completing tasks to capture insights.

The more you document, the smarter /mentor-spec:advise becomes!
```

---

### Step 4: Visual Status

Create a visual summary:

```
┌─────────────────────────────────────────────────────────────┐
│                      PROJECT STATUS                          │
├─────────────────────────────────────────────────────────────┤
│  Project: [Name]                                             │
│  Created: [Date]                                             │
├─────────────────────────────────────────────────────────────┤
│  ROADMAP                                                     │
│  ──────────────────────────────────────────                  │
│  Phase 1: Foundation     ████████░░ 80%                      │
│  Phase 2: Core           ░░░░░░░░░░ 0%                       │
│  Phase 3: Polish         ░░░░░░░░░░ 0%                       │
│  ──────────────────────────────────────────                  │
│  Overall Progress:       ████░░░░░░ 40%                      │
├─────────────────────────────────────────────────────────────┤
│  CURRENT WORK                                                │
│  ──────────────────────────────────────────                  │
│  Active Spec: auth-system                                    │
│  Current Task: Implement password reset                      │
│  Tasks: 3/5 complete                                         │
├─────────────────────────────────────────────────────────────┤
│  LEARNING GROWTH                                             │
│  ──────────────────────────────────────────                  │
│  Patterns: 4  │  Failures: 2  │  Total: 6                    │
│  Level: ⭐⭐⭐ Intermediate                                    │
│  Goal: ⭐⭐⭐⭐⭐ in 30 days                                     │
├─────────────────────────────────────────────────────────────┤
│  CAREER STATS                                                │
│  ──────────────────────────────────────────                  │
│  Interview Stories: 3                                        │
│  Resume Bullets: 3                                           │
│  Commits This Week: 5                                        │
└─────────────────────────────────────────────────────────────┘
```

---

### Step 5: Quick Commands Reminder

At the end of status, remind them of available commands:

```
Quick Commands:
  /mentor-spec:init          — Initialize project
  /mentor-spec:feature       — Start a new feature
  /mentor-spec:advise        — Pre-work intelligence gathering
  /mentor-spec:guide         — Get implementation help
  /mentor-spec:stuck         — Debug an issue
  /mentor-spec:done          — Complete a task (with 5 Gates)
  /mentor-spec:retrospective — Capture learnings
  /mentor-spec:status        — You're here!
```

---

## Progress Bar Reference

```
████████░░ = 80%
██████░░░░ = 60%
████░░░░░░ = 40%
██░░░░░░░░ = 20%
░░░░░░░░░░ = 0%
```

---

## Important Notes

1. **Celebrate progress** — Even small progress counts
2. **Learning stats motivate** — Seeing growth compounds confidence
3. **Career stats encourage** — Seeing interview stories grow is powerful
4. **Gentle nudges** — If inactive, welcome them back without judgment
5. **Keep it visual** — Progress bars are satisfying
6. **Flywheel reminder** — Encourage /retrospective usage
