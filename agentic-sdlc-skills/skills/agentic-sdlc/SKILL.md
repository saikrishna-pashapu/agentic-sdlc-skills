---
name: agentic-sdlc
description: Orchestrate end-to-end software delivery for a new app, website, SaaS, internal tool, API, or automation system. Clarify requirements, research patterns, plan architecture, decompose tasks, guide implementation, review progress, and maintain track files with clean handoffs.
---

# Agentic SDLC

Use this skill when the user wants to build software from scratch, rescue a chaotic repo, or create a structured delivery process before large-scale implementation.

This skill is intentionally **process-heavy**. The goal is not to jump straight into code. The goal is to build software through a disciplined flow that creates durable repo memory and clean task handoffs.

## Outcomes

By the end of using this skill, the project should have:

- a clear product brief
- explicit assumptions
- a research summary when requirements are vague
- a written architecture plan for frontend, backend, database, and infrastructure
- a task backlog with acceptance criteria and dependencies
- tracking files that show done / active / blocked work
- a handoff summary for the next focused task

## Directory contract

Prefer this structure for new projects. Adapt if the repo already has a strong existing structure.

```text
project/
  project.md
  assumptions.md
  glossary.md

research/
  ui-references.md
  technical-references.md
  decisions-support.md

plan/
  prd.md
  architecture/
    system.md
    frontend.md
    backend.md
    database.md
    infrastructure.md
  frontend/
    pages/
    components/
    flows/
  backend/
    domains/
    integrations/
  database/
    schema.md
    migrations.md
  testing/
    strategy.md
  deployment/
    env.md
    runbook.md

tasks/
  backlog.md
  active.md
  completed.md
  task-001.md

track/
  track.md
  decisions.md
  risks.md
  summaries/
    summary-001.md
  frontend/
  backend/
  database/
  infra/

context/
  current-context.md
  handoff.md
  relevant-files.md
```

## Rules

1. Do not code first when the request is vague.
2. Keep durable project state in files, not only in chat history.
3. Separate plan from track.
   - `plan/` = intended design
   - `track/` = what actually happened
4. Work in narrow tasks.
5. After every significant task, update track files and write a handoff summary.
6. If you must assume, write the assumption down.
7. When a user is vague but does not want long Q&A, choose sensible defaults and record them.

## Operating loop

### Phase 1 — intake

Read the request and normalize it into a project brief.

Capture:
- product type
- target users
- core workflows
- auth and roles
- required pages/screens
- key entities
- integrations
- analytics/admin needs
- constraints
- success criteria

Write:
- `project/project.md`
- `project/assumptions.md`

If the idea is vague, consult `references/intake-question-bank.md`.

### Phase 2 — research

If the user asks for something vague like “build me a news website” or “make me a CRM”, research patterns before freezing architecture.

Research should be distilled, not dumped.

Write concise outputs into:
- `research/ui-references.md`
- `research/technical-references.md`
- `research/decisions-support.md`

Use `references/research-guide.md` and `checklists/planning-checklist.md`.

### Phase 3 — architecture planning

Before implementation, write:
- `plan/prd.md`
- `plan/architecture/system.md`
- `plan/architecture/frontend.md`
- `plan/architecture/backend.md`
- `plan/architecture/database.md`
- `plan/architecture/infrastructure.md` if relevant

Frontend planning must cover:
- page map
- sections and components
- states and edge states
- data dependencies
- user actions
- responsive behavior

Backend planning must cover:
- domains and responsibilities
- APIs
- auth/authorization
- validation
- background jobs
- external integrations

Database planning must cover:
- entities and fields
- relationships
- constraints
- indexes
- migration notes

### Phase 4 — task decomposition

Convert the plan into focused tasks using `templates/task.md`.

Every task must include:
- goal
- scope
- dependencies
- input files
- output files
- acceptance criteria
- notes for reviewer

Update:
- `tasks/backlog.md`
- `tasks/active.md`
- `tasks/completed.md`

### Phase 5 — execution

When executing a task, read only:
- the active task file
- the minimum relevant plan files
- the latest `track/` notes
- the latest handoff summary

Do not drag the entire project into context if it is not needed.

At the end of the task:
- update `track/track.md`
- update component-specific `track/.../*.md`
- write or append `track/decisions.md` if design choices changed
- write `context/handoff.md`

### Phase 6 — review

Check:
- was the task completed as planned?
- what changed from the original design?
- what remains?
- what is risky or blocked?
- what should the next task read?

Use `checklists/review-checklist.md`.

## Context hygiene

Create context packets, not giant histories.

A context packet should contain only:
- current task goal
- acceptance criteria
- relevant files
- latest handoff summary
- a tiny decision log excerpt if needed

Write the active packet to `context/current-context.md`.

## Typical first files for a brand new app

1. `project/project.md`
2. `project/assumptions.md`
3. `plan/prd.md`
4. `plan/architecture/system.md`
5. `plan/architecture/frontend.md`
6. `plan/architecture/backend.md`
7. `plan/architecture/database.md`
8. `tasks/backlog.md`
9. `track/track.md`
10. `context/handoff.md`

## Fast-start command style

If the environment can run scripts, initialize the file tree with `scripts/init-project.sh` and then fill the markdown files.

## If the user asks for “just start building”

Still do a compressed version of:
- assumptions
- plan
- first tasks

Then begin implementation.

Never skip planning entirely for a non-trivial project.
