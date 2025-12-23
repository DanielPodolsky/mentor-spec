<h5 align="center">
  <img width="717" height="114" alt="ascii-art-text (3)" src="https://github.com/user-attachments/assets/81bf37f6-d06a-4576-be3e-579e6bd30cd9" />
</h5>

<p align="center">
  <strong>AI-Mentored Development for Juniors</strong><br>
  <em>Claude becomes your senior engineer mentor, not your code monkey.</em>
</p>

<p align="center">
  <!-- TODO: Add badges after pushing to GitHub -->
  <a href="#installation"><img src="https://img.shields.io/badge/install-curl%20%7C%20bash-brightgreen?style=for-the-badge" alt="Install"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge" alt="License"></a>
  <a href="#commands"><img src="https://img.shields.io/badge/commands-6-orange?style=for-the-badge" alt="Commands"></a>
</p>

<p align="center">
  <a href="#the-problem">The Problem</a> •
  <a href="#installation">Installation</a> •
  <a href="#commands">Commands</a> •
  <a href="#philosophy">Philosophy</a> •
  <a href="#uninstall">Uninstall</a>
</p>

---

## 🧠 The Problem

Most AI coding tools create **dependency**, not **skill**.

```
┌─────────────────────────────────────────────────────────────────────┐
│                     THE AI BRAIN ROT CYCLE                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Junior asks AI ──▶ AI writes code ──▶ Junior copies it           │
│         ▲                                      │                    │
│         │                                      ▼                    │
│         └────────── Next problem ◀── "It works!" (no understanding)│
│                                                                     │
│   RESULT: Junior needs AI MORE over time, not less                  │
│   INTERVIEW: "Explain this code you wrote" → 😰                     │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

**MentorSpec breaks the cycle.**

```
┌─────────────────────────────────────────────────────────────────────┐
│                    THE MENTORSPEC WAY                               │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Junior asks AI ──▶ AI asks questions ──▶ Junior THINKS           │
│         ▲                                      │                    │
│         │                                      ▼                    │
│         └────── Real understanding ◀── Junior writes code          │
│                                                                     │
│   RESULT: Junior needs AI LESS over time                            │
│   INTERVIEW: "Explain this code" → "I built it because..." ✅       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Installation

### Step 1: Install MentorSpec

```bash
curl -sSL https://raw.githubusercontent.com/DanielPodolsky/mentor-spec/main/scripts/base-install.sh | bash
```

### Step 2: Add to Your Project

```bash
cd your-project
~/mentor-spec/scripts/project-install.sh
```

### Step 3: Initialize

Open Claude Code in your project:

```
/mentor-spec:init
```

**That's it.** Claude is now your mentor, not your coder.

---

## 🎯 Commands

| Command | What Happens |
|---------|--------------|
| `/mentor-spec:init` | Define your mission, stack, and roadmap |
| `/mentor-spec:feature` | Plan a feature with spec-driven development |
| `/mentor-spec:guide` | Get guidance (patterns, not solutions) |
| `/mentor-spec:stuck` | Debug with Protocol D (systematic debugging) |
| `/mentor-spec:done` | Code review + extract STAR interview story |
| `/mentor-spec:status` | See your progress |

---

## 🔥 What Changes

<table>
<tr>
<th width="50%">❌ Without MentorSpec</th>
<th width="50%">✅ With MentorSpec</th>
</tr>
<tr>
<td>

```
You: "Write me a login form"

AI: "Here's a complete login
form with validation..."

[200 lines of code]
```

</td>
<td>

```
You: "Write me a login form"

AI: "I'll help you build that!

First, let's think through it:
1. What fields do you need?
2. Where does it submit to?
3. What validation rules?

What's your approach?"
```

</td>
</tr>
</table>

---

## 📜 Philosophy

### The Anti-Brain-Rot Rules

```
┌──────────────────────────────────────────────────────────────┐
│  1. AI NEVER writes production code                          │
│     └─▶ MAX 8 lines of example patterns                      │
│                                                              │
│  2. Documentation is SACRED                                  │
│     └─▶ "What do the docs say?" before every answer          │
│                                                              │
│  3. Never give answers DIRECTLY                              │
│     └─▶ "What have you tried?" first                         │
│                                                              │
│  4. Force UNDERSTANDING                                      │
│     └─▶ "Explain back to me what you're implementing"        │
│                                                              │
│  5. Embrace the STRUGGLE                                     │
│     └─▶ Confusion is the sweat of learning                   │
└──────────────────────────────────────────────────────────────┘
```

### Protocol D (When Stuck)

When you're stuck, MentorSpec doesn't solve it for you. It guides you:

```
╔══════════════════════════════════════════════════════════════╗
║                      PROTOCOL D                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  1. READ      "Read the error out loud. What is it saying?"  ║
║       │                                                      ║
║       ▼                                                      ║
║  2. ISOLATE   "Where exactly is the failure?"                ║
║       │                                                      ║
║       ▼                                                      ║
║  3. DOCS      "What does the documentation say?"             ║
║       │                                                      ║
║       ▼                                                      ║
║  4. HYPOTHESIZE "What do you think the fix is?"              ║
║       │                                                      ║
║       ▼                                                      ║
║  5. VERIFY    "Try it. Did it work? Why?"                    ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

This is how seniors debug. Now it's how YOU debug.
```

### Career Value Extraction

Every completed task produces:

- **STAR Interview Story** — Situation, Task, Action, Result
- **Resume Bullet** — "Engineered X, resulting in Y"

Build your portfolio while building your project.

---

## 📁 What Gets Created

```
your-project/
├── .claude/
│   ├── CLAUDE.md                    # THE STRICTNESS (mentor rules)
│   └── commands/mentor-spec/        # Slash commands
│
└── mentorspec/
    ├── product/
    │   ├── mission.md               # What problem you're solving
    │   ├── stack.md                 # Your tech decisions
    │   └── roadmap.md               # Development phases
    ├── specs/
    │   ├── active/                  # Features in progress
    │   └── completed/               # Done features
    └── career/
        └── stories/                 # Your interview stories
```

---

## 🗑️ Uninstall

**From a project:**
```bash
~/mentor-spec/scripts/project-uninstall.sh
```

**Remove MentorSpec completely:**
```bash
rm -rf ~/mentor-spec
```

---

## 🎯 Who Is This For?

- **Juniors learning to code** — Build real skills, not AI dependency
- **Job seekers** — Create a portfolio you can defend in interviews
- **Self-taught devs** — Get the mentorship bootcamps charge $20k for
- **Anyone** who wants to need AI LESS over time

---

## 🧪 The Ultimate Test

> *"If you took away the AI tomorrow, could you still code?"*

**Without MentorSpec:** Probably not.

**With MentorSpec:** **Yes.** Because you wrote every line. You understood every decision. You built real skills.

---

<p align="center">
  <strong>Stop letting AI rot your brain.</strong><br>
  <em>Start building skills that last.</em>
</p>

<p align="center">
  <a href="#installation">Get Started →</a>
</p>

---

<p align="center">
  <sub>MIT License • Built for juniors who want to become seniors</sub>
</p>
