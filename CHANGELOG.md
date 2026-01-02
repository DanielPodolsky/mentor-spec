# Changelog

All notable changes to MentorSpec will be documented in this file.

---

## [2.0.0] - 2026-01-02

### The "Learning Flywheel" Release

Major overhaul transforming MentorSpec from a strict mentor into a complete learning system that compounds growth over time.

### Added

#### 6 Mentorship Gates
Mandatory quality checkpoints before completing any task:
- **Gate 1: Ownership** (CAN BLOCK) - Must explain your own code
- **Gate 2: Security** (Warnings) - OWASP Top 10 checks
- **Gate 3: Error Handling** (Warnings) - Graceful failure verification
- **Gate 4: Performance** (Warnings) - O(n²), N+1 query detection
- **Gate 5: Fundamentals** (Suggestions) - Code quality polish
- **Gate 6: Testing** (Warnings) - Encourages testing habit

#### Learning Flywheel
Your learnings compound across sessions:
- `/advise` command - Pre-work intelligence from past learnings
- `/retrospective` command - Capture learnings after each task
- `learning/LEARNING_REGISTRY.md` - Persistent growth tracker
- `learning/patterns/` - Reusable solutions discovered
- `learning/failures/` - Mistakes learned from

#### 4 New Fundamental Skills
- **Testing** - Testing pyramid, Vitest/Jest guidance, AAA pattern
- **SEO** - Meta tags, semantic HTML, Open Graph
- **Accessibility** - WCAG basics, keyboard navigation, ARIA
- **Documentation** - WHY not WHAT, README structure, JSDoc

#### 2 New Commands
- `/mentor-spec:test` - Guide through writing tests (junior writes, AI guides)
- `/mentor-spec:docs` - Guide through writing documentation

#### Resistance Protocol
Enforced pushback when juniors try to shortcut:
- "Just write the code for me" → Redirected to learning
- "This is taking too long" → Refocused on growth
- "I don't need to explain it" → Required explanation

#### Career Extraction
Every completed task produces:
- STAR interview stories (Situation, Task, Action, Result)
- Resume bullets (Action Verb + What + Impact)

### Changed

- Commands now total 10 (was 8)
- Fundamental skills now total 11 (was 7)
- Gates now total 6 (was 5)
- `/done` command now includes Testing Gate
- README completely rewritten for v2.0

### Technical

- Skills architecture with auto-invocation based on file patterns
- MCP integration requirements (Context7 + Octocode)
- Updated install scripts for new skill structure

---

## [1.0.0] - 2025-12-XX

### Initial Release

The original MentorSpec with:
- 8 slash commands
- 7 fundamental skills
- 5 mentorship gates
- Anti-Brain-Rot Rules
- Protocol D debugging
- STAR story extraction

---

## Philosophy

> "If you took away the AI tomorrow, could this junior still code?"
>
> MentorSpec makes the answer: **YES**.

The goal is not to ship code. The goal is to build the engineer.
