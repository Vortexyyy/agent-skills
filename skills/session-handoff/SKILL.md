---
name: session-handoff
description: Write a compact handoff note so a fresh session or another agent can continue without re-deriving anything. Use when context is getting long, before stopping for the day, when switching between Claude Code and Codex, or when the user says "write a handoff" or "summarize where we are".
---

# Session handoff

A good handoff lets a cold reader act in two minutes. Write it to a file in the project (for example `HANDOFF.md`) unless the user says otherwise, and keep it under about 60 lines.

## Contents

1. **Goal**: what the user wants, in their words where possible, and what "done" looks like.
2. **State**: what is finished and verified, what is in progress, what is not started.
3. **Decisions made**: choices the user confirmed (design direction, versions, targets) and why, so they are not re-litigated.
4. **How to run and check**: exact commands to build, test and run, and where outputs go.
5. **Key files**: the handful that matter, with one line each.
6. **Gotchas**: environment quirks, flaky steps, things that look wrong but are fine, hooks or gates that block certain commands.
7. **Open questions and next steps**: ordered, concrete, each small enough to start.
8. **Do not**: things the user ruled out (never touch X, do not publish Y, do not commit Z).

## Rules

- No secrets, tokens, passwords or personal data in the note.
- Facts over narrative. Paths over descriptions. Commands over prose.
- Mark anything unverified as unverified.
- Re-read it as a stranger before finishing: could they continue from it alone?
