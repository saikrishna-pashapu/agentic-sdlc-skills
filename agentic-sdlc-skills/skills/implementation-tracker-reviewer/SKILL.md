---
name: implementation-tracker-reviewer
description: Review a completed coding task against the written plan, document what changed, update track files, identify risks or gaps, and write a clean handoff summary for the next task.
---

# Implementation Tracker Reviewer

Use this skill after a meaningful coding task, PR-sized change, or milestone.

## Required checks

- What task was supposed to be completed?
- What was actually completed?
- What changed from the original plan?
- Which files were touched?
- What remains undone?
- What is risky or blocked?
- What is the next recommended task?

## Output files

Update:
- `track/track.md`
- `track/decisions.md` when decisions changed
- component-level `track/.../*.md` files when relevant
- `context/handoff.md`

## Handoff quality bar

The next agent should be able to continue with only:
- the task file
- a few relevant plan files
- the handoff summary

If the next agent would still need to read the entire chat history, the handoff is not good enough.
