---
name: agentic-sdlc
description: Orchestrate end-to-end software delivery for a new app, website, SaaS, internal tool, API, or automation system. Clarify requirements, research patterns, plan architecture, decompose tasks, guide implementation, review progress, and maintain track files with clean handoffs.
---

# Agentic SDLC

Use this skill when the user wants to build software from scratch, rescue a chaotic repo, or create a structured delivery process before large-scale implementation.

This skill is intentionally **process-heavy**. The goal is not to jump straight into code. The goal is to build software through a disciplined flow that creates durable repo memory and clean task handoffs.

## Philosophy

This skill installs engineering discipline into the agent.

The core problem it solves is **loss of structure**. Without it, an agent forgets plans mid-build, makes inconsistent decisions across files, breaks naming conventions, loses track of what is done versus what remains, and produces code that no one — including a future agent — can confidently continue.

The fix is to make **the project itself the memory**. The repository becomes the single source of truth: plan, memory, task board, execution history, architectural record, and handoff system. Nothing important lives only in conversation history. Everything durable is written to a file with a known location.

To do this well, the agent must shift roles as the work progresses:

- **Product analyst** during intake — when the request is vague, ask the right questions or make reasoned assumptions and record them.
- **Software architect** before implementation — define modules, interfaces, data models, and boundaries before writing code.
- **Delivery planner** during decomposition — break architecture into small, dependency-aware tasks with clear acceptance criteria.
- **Disciplined implementer** during execution — work on one scoped task at a time, reading only the minimum context needed.
- **Reviewer** after code — check that implementation matches plan, note deviations, surface risks.
- **Memory manager** between tasks — update tracking files, write handoff summaries, and prepare a clean context packet for whatever comes next.

The result is a build process that feels like a chain of disciplined engineers rather than one model improvising.

## Outcomes

By the end of using this skill, the project should have:

- a clear product brief
- explicit assumptions
- a research summary when requirements are vague
- a written architecture plan for frontend, backend, database, and infrastructure
- a task backlog with acceptance criteria and dependencies
- tracking files that show done / active / blocked work
- a handoff summary for the next focused task

## Architecture-first principle

Never jump from a user request to writing files. The sequence is always:

1. **Understand** — what is being asked and what is ambiguous.
2. **Structure** — define the system, its modules, and their boundaries.
3. **Define interfaces** — specify how modules communicate (APIs, data contracts, event flows).
4. **Then implement** — write code for one module at a time, against the defined interfaces.

This applies even when the user says "just build it." A compressed version of the sequence is acceptable; skipping it entirely is not.

## Two worlds — plan vs. track

The project maintains two parallel records:

**Plan world** (`plan/`) — what SHOULD exist. The intended system. This includes the product brief, architecture documents, page designs, backend domain definitions, API contracts, database schemas, and infrastructure decisions. Plan files describe the target. They are written before implementation and updated only through deliberate architectural decisions, not as a side effect of coding.

**Track world** (`track/`) — what ACTUALLY happened. The execution reality. This includes what was implemented, what changed from the plan and why, what was delayed, what decisions were made during coding, what failed, what remains, and what the next step is.

This split keeps the project honest. Without it, agents blur intention and execution — a planned API endpoint that was never built looks the same as one that was, and a schema change made during coding silently overwrites the original design. Separating plan from track means you can always answer two questions: "what did we intend?" and "what do we actually have?"

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
3. Separate plan from track. Plan describes intent. Track describes reality.
4. Work in narrow tasks. One task, one focus, minimum context.
5. After every significant task, update track files and write a handoff summary.
6. If you must assume, write the assumption down in `project/assumptions.md`.
7. When a user is vague but does not want long Q&A, choose sensible defaults and record them.
8. Never modify plan files as a side effect of implementation. If the design must change, make a deliberate decision, record it in `track/decisions.md`, then update the plan file.

## Operating loop

The loop has nine steps. Not every project uses all nine — a well-specified request can skip research, and a simple task may compress several steps. But the sequence is fixed: understand before you plan, plan before you build, track after you build, hand off before you move on.

### Step 1 — understand the request

Read the user's request and classify it:

- **Detailed** — clear product, defined scope, specific requirements. Proceed to planning.
- **Partial** — product type is clear but scope or details are missing. Fill gaps with targeted questions or reasoned assumptions.
- **Vague** — "build me something like X" with no specifics. Move to clarification and possibly research before planning.

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

### Step 2 — clarify or infer

If the request has gaps, choose one path:

- **Ask** — when ambiguity is high and wrong assumptions would waste significant effort. Use targeted questions, not open-ended interviews. Consult `references/intake-question-bank.md` for structured question sets.
- **Infer** — when the domain is well-understood and sensible defaults exist. Choose reasonable answers and write every assumption to `project/assumptions.md` so the user can correct them.

The bias should be toward action. Three recorded assumptions beat ten unanswered questions.

Write:
- `project/project.md`
- `project/assumptions.md`

### Step 3 — research

If the user asks for something generic — "build me a news website," "make me a CRM," "I need a dashboard" — research patterns before freezing architecture.

Research should be distilled, not dumped. The goal is to arrive at concrete structural decisions, not to produce a reading list.

Write concise outputs into:
- `research/ui-references.md` — UI patterns, page structures, component conventions for this product type.
- `research/technical-references.md` — technical patterns, framework choices, integration approaches.
- `research/decisions-support.md` — trade-off analysis for key architectural choices.

Use `references/research-guide.md` and `checklists/planning-checklist.md`.

Skip this step when the user provides specific architectural direction or the product type is straightforward.

### Step 4 — plan

Before implementation, write the architecture. This is the most important step. A clear plan prevents inconsistent code, repeated rewrites, and the slow drift that happens when an agent makes local decisions without a global view.

Write:
- `plan/prd.md`
- `plan/architecture/system.md`
- `plan/architecture/frontend.md`
- `plan/architecture/backend.md`
- `plan/architecture/database.md`
- `plan/architecture/infrastructure.md` if relevant

Frontend planning must cover:
- page map
- sections and components per page
- states and edge states (loading, empty, error, overflow)
- data dependencies for each component
- user actions and their effects
- responsive behavior

Backend planning must cover:
- domains and their responsibilities
- API endpoints with request/response shapes
- auth and authorization boundaries
- validation rules
- background jobs and async flows
- external integrations and their failure modes

Database planning must cover:
- entities and fields with types
- relationships and cardinality
- constraints and uniqueness rules
- indexes for known query patterns
- migration strategy and notes

The plan should be specific enough that a different agent could implement it without asking clarifying questions.

### Step 5 — decompose into tasks

Convert the plan into focused implementation units using `templates/task.md`.

Every task must include:
- goal — one sentence describing the outcome
- scope — what this task covers and explicitly does not cover
- dependencies — which tasks must be completed first
- input files — plan and context files the implementer should read
- output files — code and track files the implementer should produce
- acceptance criteria — concrete checks for completeness
- notes for reviewer — known risks, edge cases, or design trade-offs

Tasks should be small enough to complete in a single focused session. If a task requires reading the entire codebase to execute, it is too large.

Update:
- `tasks/backlog.md`
- `tasks/active.md`
- `tasks/completed.md`

### Step 6 — execute one scoped task

When executing a task, load only:
- the active task file
- the minimum relevant plan files listed in the task's input files
- the latest `track/` notes for the area being changed
- the latest handoff summary from `context/handoff.md`
- the specific code files being modified

Do not drag the entire project into context. The task file already specifies what is relevant. Trust the decomposition.

Write code that matches the plan's naming conventions, module boundaries, and interface definitions. If the plan is wrong or incomplete, do not silently deviate — proceed to the review step and record the deviation.

### Step 7 — review

After completing a task, review the implementation against the plan:

- Was the task completed as specified in its acceptance criteria?
- Does the implementation match the architecture defined in `plan/`?
- What changed from the original design, and was the change justified?
- Are there new risks, technical debt, or unresolved edge cases?
- What is blocked or deferred?

Use `checklists/review-checklist.md`.

If the review reveals plan changes, record them in step 8.

### Step 8 — track

Update the execution record:

- Update `track/track.md` with what was completed, in progress, or blocked.
- Update component-specific `track/.../*.md` files for the area that changed.
- Append to `track/decisions.md` if any design choices were made or changed during implementation.
- Append to `track/risks.md` if new risks were identified.
- Move the task from `tasks/active.md` to `tasks/completed.md`.

If the implementation deviated from the plan, update the relevant `plan/` file to reflect the new architectural truth and note the change in `track/decisions.md` with the reason.

### Step 9 — hand off

Write a continuation summary so the next task — whether executed by the same agent, a different agent, or a human — can start cleanly without reading the entire conversation or codebase.

The handoff must include:
- **What was done** — summary of the completed task and its outcome.
- **What changed from plan** — any deviations from the architecture or design.
- **Files touched** — list of files created, modified, or deleted.
- **Issues encountered** — bugs, ambiguities, or problems that arose.
- **What the next step depends on** — prerequisites, state, or context the next task needs.
- **What the next agent should read** — specific file paths for context loading.

Write to `context/handoff.md`. For complex tasks, also write a summary to `track/summaries/summary-NNN.md`.

The handoff is not optional. It is the mechanism that turns a series of isolated tasks into a coherent delivery chain.

## Context management protocol

Context management is not a suggestion — it is a core operating discipline of this skill. The agent's biggest failure mode is loading too much context, losing focus, and producing inconsistent output.

Before every task, construct a **context packet** containing only:
- current task goal and acceptance criteria
- relevant plan files (as listed in the task's input files)
- relevant track files for the area being changed
- the latest handoff summary
- the specific code files being modified

Write the active context packet to `context/current-context.md` so it can be inspected and reused.

Do not load:
- the entire plan directory when working on one module
- all track files when only one area changed
- previous task files that are not dependencies of the current task
- conversation history as a substitute for written project state

The skill is a methodology for keeping the model focused. The project files are the memory. The context packet is the lens.

## Self-documenting build process

The repository produced by this skill is not just code — it is project intelligence. Anyone opening the repo should be able to find:

- **What the app is** — `project/project.md` and `plan/prd.md`.
- **How it was planned** — `plan/architecture/*.md` with module definitions, interfaces, and data models.
- **Why architectural decisions were made** — `track/decisions.md` with rationale for every significant choice.
- **What is finished, in progress, and pending** — `tasks/completed.md`, `tasks/active.md`, `tasks/backlog.md`.
- **What changed from the original plan** — comparison of `plan/` files against `track/` records.
- **How to continue the work** — `context/handoff.md` with the next step and required context.

This traceability is a first-class output of the skill, not a side effect. The plan and track files have value beyond the current build — they serve future contributors, auditors, and agents.

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

## If the user asks for "just start building"

Still do a compressed version of:
- assumptions (write `project/assumptions.md`)
- plan (write at minimum `plan/architecture/system.md`)
- first tasks (write `tasks/backlog.md` with the first batch)

Then begin implementation.

Never skip planning entirely for a non-trivial project. A compressed plan is acceptable. No plan is not.
