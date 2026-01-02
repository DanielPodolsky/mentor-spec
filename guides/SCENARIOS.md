# MentorSpec Validation Scenarios

> 10 scenarios to test that MentorSpec is working correctly.
> Use these after installing MentorSpec on a new project.

---

## Scenario 1: The Lazy Request

**Test:** Does the mentor refuse to write code for you?

```
You: "Write me a login form with email and password validation"
```

**Expected:** The mentor should NOT write the full form. Instead:
- Ask clarifying questions first
- Ask "What have you tried?"
- Provide patterns (MAX 8 lines)
- Make YOU write the implementation

**Red Flag:** If the mentor writes 50+ lines of code, something is wrong.

---

## Scenario 2: The Docs Check

**Test:** Does the mentor enforce documentation-first habits?

```
You: "How do I use useState with arrays?"
```

**Expected:** The mentor should:
1. Ask "What do the docs say about useState?"
2. Use Context7 MCP to fetch React docs
3. Quote the official documentation
4. THEN provide guidance

**Red Flag:** If the mentor just answers without checking/citing docs.

---

## Scenario 3: The Ownership Gate

**Test:** Does the Ownership Gate block completion when you can't explain code?

```
You: *Copy-paste some code from Stack Overflow*
You: "/mentor-spec:done"
```

**Expected:** At Gate 1 (Ownership), the mentor should ask:
- "Walk me through what this code does, line by line"
- If you can't explain it → BLOCKED
- You cannot proceed until you demonstrate understanding

**Red Flag:** If you pass the gate by saying "it works" without explanation.

---

## Scenario 4: Protocol D (Debugging)

**Test:** Does the mentor guide debugging instead of solving?

```
You: "I'm getting 'Cannot read properties of undefined'"
```

**Expected:** The mentor should run Protocol D:
1. **READ:** "What is the error actually saying?"
2. **ISOLATE:** "Where is this happening?"
3. **DOCS:** "What causes this error type?"
4. **HYPOTHESIZE:** "What do YOU think the fix is?"
5. **VERIFY:** "Try it. Did it work?"

**Red Flag:** If the mentor just tells you the answer immediately.

---

## Scenario 5: The Learning Flywheel

**Test:** Does `/advise` surface past learnings?

```
# First, complete a task with a lesson learned
You: "/mentor-spec:retrospective"
   → Document: "Arrays must be initialized as [] not undefined"

# Later, start similar work
You: "/mentor-spec:advise"
   → "I'm about to work on a component that maps over data"
```

**Expected:** The `/advise` command should surface:
- "Last time you worked with arrays, you learned: always initialize as []"
- Warning about the past failure
- Relevant documentation to review

**Red Flag:** If `/advise` doesn't reference your past learnings.

---

## Scenario 6: The Security Gate

**Test:** Does the mentor catch obvious security issues?

```
You: *Write code that does:*
   - `db.query("SELECT * FROM users WHERE id = " + req.params.id)`
   - No input validation
   - Password stored in localStorage

You: "/mentor-spec:done"
```

**Expected:** At Gate 2 (Security), the mentor should:
- Flag the SQL injection vulnerability
- Question the localStorage decision for sensitive data
- Ask "Where does user input enter? How is it validated?"

**Red Flag:** If this code passes security review without warnings.

---

## Scenario 7: The Career Extraction

**Test:** Does `/done` produce STAR stories and resume bullets?

```
You: *Complete a feature (JWT authentication)*
You: "/mentor-spec:done"
```

**Expected:** After passing gates, the mentor should help create:
- **STAR Story:** Situation, Task, Action, Result
- **Resume Bullet:** "Engineered JWT authentication with [specific detail], resulting in [impact]"

**Red Flag:** If completion doesn't include career extraction.

---

## Scenario 8: The Quick Accepter

**Test:** Does the mentor push back on too-quick acceptance?

```
Mentor: "I suggest using useReducer for this complex state"
You: "Okay"
```

**Expected:** The mentor should challenge:
- "Wait - before you implement this, explain WHY useReducer makes sense here"
- "What are the tradeoffs vs useState?"
- "What alternatives did you consider?"

**Red Flag:** If the mentor moves on when you just say "okay" or "thanks".

---

## Scenario 9: The Performance Gate

**Test:** Does the mentor catch obvious performance anti-patterns?

```
You: *Write code that:*
   - Has a nested loop (O(n²)) processing 10,000 items
   - Makes an API call inside a .map()
   - Re-renders entire list on every keystroke

You: "/mentor-spec:done"
```

**Expected:** At Gate 4 (Performance), the mentor should:
- Flag the O(n²) operation
- Identify the N+1 query pattern (API in loop)
- Question the re-render behavior

**Red Flag:** If obvious performance issues aren't caught.

---

## Scenario 10: The Feature Spec Flow

**Test:** Does `/feature` generate specs for junior review?

```
You: "/mentor-spec:feature"
   → "Login form with email/password validation"
```

**Expected:** The mentor should:
1. Ask minimal clarifying questions (feature name, user story)
2. Research via Context7 (React docs) and Octocode (GitHub patterns)
3. Generate: `spec.md`, `design.md`, `tasks.md`
4. Present summary and ask YOU to:
   - Review the specs
   - ADD edge cases the AI missed
   - MODIFY anything incorrect
5. Only then proceed to implementation

**Red Flag:** If the mentor skips spec generation and jumps to coding.

---

## Quick Validation Checklist

After installation, run through these:

- [ ] Ask for full code → Should be refused
- [ ] Ask technical question → Should check docs first
- [ ] Run `/done` without explaining → Should be blocked
- [ ] Get stuck → Should run Protocol D
- [ ] Run `/advise` after `/retrospective` → Should reference past learnings
- [ ] Write insecure code → Should be flagged
- [ ] Complete task → Should extract STAR story
- [ ] Accept suggestion quickly → Should be challenged
- [ ] Write slow code → Should be questioned
- [ ] Start feature → Should generate specs first

---

## Troubleshooting

**Mentor is too lenient:**
- Check that CLAUDE.md was properly installed in `.claude/`
- Verify the Anti-Brain-Rot Rules are present
- Run `cat .claude/CLAUDE.md | grep "MENTORSPEC"` to confirm

**Commands not working:**
- Ensure commands are in `.claude/commands/mentor-spec/`
- Try `/mentor-spec:status` first
- Check Claude Code is running in the project directory

**Learning Flywheel not working:**
- Verify `learning/LEARNING_REGISTRY.md` exists
- Run `/mentor-spec:retrospective` at least once
- Check `.claude/skills/learned/` for auto-generated skills

---

*If MentorSpec passes these 10 scenarios, it's working correctly.*
