# Context Management Protocol

How to keep the agent focused by loading only what is needed for the current task.

## The problem

AI agents have limited context windows. Loading the entire project history into context causes:
- loss of focus on the current task
- confusion between old and new decisions
- inconsistent behavior as context overflows
- slower, less accurate responses

## The principle

**Keep only relevant context active. Store everything else in structured files.**

The project files are the memory. The agent's context window is the workspace. Only bring into the workspace what the current task requires.

## Before every task — load the context packet

A context packet is the minimum set of files needed to execute one task well.

### Required in every context packet

| File | Why |
|------|-----|
| Active task file (`tasks/task-NNN.md`) | Defines what to do |
| Acceptance criteria from the task | Defines when it is done |
| `context/handoff.md` | What the previous task left behind |

### Load conditionally

| File | When to load |
|------|-------------|
| `plan/architecture/frontend.md` | When the task touches frontend |
| `plan/architecture/backend.md` | When the task touches backend |
| `plan/architecture/database.md` | When the task touches data layer |
| `plan/architecture/system.md` | When the task crosses multiple layers |
| `track/decisions.md` | When the task involves architectural choices |
| `track/risks.md` | When the task is in a risky area |
| `project/assumptions.md` | When the task depends on assumed requirements |
| Relevant source code files | Only the files being modified or depended upon |

### Never load into context

- Completed task files (unless the current task explicitly references one)
- Research files (unless the current task requires research review)
- All track summaries (only the latest relevant one)
- The full backlog (only the current task matters)
- Entire source code trees (only the files relevant to this task)

## Writing the context packet

Before starting a task, write the active context packet to `context/current-context.md`:

```markdown
# Current Context

## Active task
tasks/task-007.md

## Relevant plan files
- plan/architecture/backend.md
- plan/architecture/database.md

## Relevant track files
- track/backend/auth.md

## Latest handoff
context/handoff.md

## Relevant code files
- src/auth/controller.ts
- src/auth/service.ts
- src/db/schema/users.ts

## Decision log excerpt
- Decision 3: Using JWT for auth tokens (see track/decisions.md)
```

## After every task — update context files

1. Write `context/handoff.md` with what was done and what comes next.
2. Update `context/relevant-files.md` if the set of important files changed.
3. Update `context/current-context.md` for the next task.

## Context size guidelines

| Project phase | Typical context packet size |
|---------------|---------------------------|
| Intake | Brief + assumptions + question bank |
| Planning | Brief + research + architecture files |
| Task execution | Task file + 1-2 plan files + handoff + relevant code |
| Review | Task file + plan files + track files + code diff |

## Signs of context pollution

- The agent re-reads files it already summarized
- The agent contradicts a decision it made two tasks ago
- The agent asks a question that was already answered in the brief
- The agent modifies files not listed in the task scope

When these happen, reset the context packet: re-read only the files listed in `context/current-context.md`.

## The goal

The agent should always know exactly:
1. What it is doing right now
2. What was decided before
3. What files are relevant
4. What the previous task left for it

Nothing more. Nothing less.
