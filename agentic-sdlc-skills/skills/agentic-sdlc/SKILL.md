---
name: agentic-sdlc
description: Turn a vague app, website, or software idea into a structured software delivery workflow with research, architecture planning, task decomposition, tracked execution, and clean handoffs.
---

# Agentic SDLC

Use this skill when the user wants to build a new app, website, SaaS product, internal tool, API, automation system, or software platform from scratch, or when an existing repo lacks a clear plan, task graph, and execution tracker.

This skill is for **structured software delivery**, not just code generation. It helps the agent move through a disciplined workflow:

1. clarify the product
2. research missing patterns if needed
3. plan architecture before coding
4. decompose the system into modules and tasks
5. execute one task at a time
6. review against the plan
7. write a clean handoff summary
8. update progress and decisions

## Core principles

- Do **not** jump straight into coding when the request is vague.
- Prefer a clear plan over speculative implementation.
- Keep durable state in repo files, not only in chat context.
- Separate **plan** from **track**:
  - `plan/` = what should be built
  - `track/` = what was actually done, changed, deferred, or blocked
- Work in focused task-sized units.
- Keep context clean with short handoff summaries after each task.
- If assumptions are needed, write them down explicitly instead of hiding them.

## Default file system layout

When starting a fresh project, create or maintain this structure:

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
  backend/
    domains/
  database/
    schema.md
  testing/
    strategy.md
  deployment/
    env.md

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

context/
  current-context.md
  handoff.md
  relevant-files.md
```

If the repo already has a structure, adapt to it instead of force-replacing it.

## Workflow

## Phase 1: intake and clarification

First, transform the user request into a structured product brief.

Capture at minimum:

- product type
- target users
- primary workflows
- required pages or screens
- auth and roles
- core data entities
- integrations
- admin needs
- deployment assumptions
- non-functional requirements
- success criteria

If critical details are missing:
- ask focused clarifying questions, or
- if the user explicitly wants momentum, make reasonable assumptions and record them in `project/assumptions.md`.

Create or update:

- `project/project.md`
- `project/assumptions.md`

## Phase 2: research

When requirements are vague or under-specified, research patterns before locking architecture.

Research may include:
- comparable product flows
- UI conventions
- framework and library choices
- deployment patterns
- API design approaches
- database design references

Write concise findings to:
- `research/ui-references.md`
- `research/technical-references.md`
- `research/decisions-support.md`

Do not dump raw search results. Distill them into decisions and options.

## Phase 3: architecture planning

Before implementation, write a structured plan.

At minimum create:

- `plan/prd.md`
- `plan/architecture/system.md`
- `plan/architecture/frontend.md`
- `plan/architecture/backend.md`
- `plan/architecture/database.md`

For frontend planning, define:
- page map
- component hierarchy
- states
- data dependencies
- user actions
- responsive considerations

For backend planning, define:
- domains and responsibilities
- API endpoints
- request/response contracts
- services
- validation
- auth and authorization
- background jobs if relevant

For database planning, define:
- entities
- relationships
- indexes
- constraints
- migration notes

## Phase 4: decomposition into tasks

Convert the plan into executable tasks.

Every task should contain:

- goal
- scope
- dependencies
- input files
- output files
- acceptance criteria

Write tasks under `tasks/`.

Use small tasks. Avoid giant “build the whole app” tasks.

Recommended order:
1. repo and architecture foundations
2. design system or layout shell
3. auth
4. core data models
5. domain APIs
6. page flows
7. admin or settings
8. tests
9. deployment and polish

Update:
- `tasks/backlog.md`
- `tasks/active.md`
- `tasks/completed.md`

## Phase 5: execution

For each task:

1. read the current task file
2. read only the relevant plan files
3. read the latest track and handoff notes
4. implement narrowly
5. review against acceptance criteria
6. update track files
7. write a handoff summary for the next task

Never carry the entire project history into every step if focused repo files can do the job better.

## Phase 6: review

After implementation, compare the result against:
- task acceptance criteria
- the relevant plan file
- surrounding architecture consistency

Review for:
- missing files
- broken contracts
- mismatched naming
- incomplete error states
- mobile/responsive gaps
- missing tests where expected

## Phase 7: tracking and handoff

After each task, update:

- `track/track.md`
- `track/decisions.md`
- relevant component-level track file
- `context/handoff.md`

The handoff should be short and operational:
- what was done
- what changed from plan
- blockers or risks
- what next task should read first

## Required standards

### Planning standard

Do not say “frontend will include login and dashboard” and stop there.
Break it down into pages, sections, components, states, and expected behavior.

### Backend standard

Do not say “build auth API” and stop there.
Define routes, payload shapes, validation, errors, and service responsibilities.

### Tracking standard

Do not only mark things as done.
Record what changed, what was deferred, and why.

### Context standard

Prefer files plus compressed summaries over long conversational memory.

## Operating rules

- If the user requests direct coding immediately, you may start, but still create at least a minimal plan and task file first.
- If there is already an implementation, infer the current architecture before rewriting the plan.
- If the plan and code conflict, update `track/decisions.md` and note whether the plan should be revised.
- If blocked by ambiguity, ask sharp questions instead of making reckless assumptions.
- If blocked by missing technical detail but reasonable defaults exist, proceed and record assumptions.

## Output templates

Use the templates in:
- `templates/project.md`
- `templates/task.md`
- `templates/handoff.md`
- `templates/track.md`
- `templates/decision.md`

Use the checklists in:
- `checklists/planning-checklist.md`
- `checklists/review-checklist.md`

If starting a new repo and shell access is available, you may use:
- `scripts/init-project.sh`

## Example trigger requests

- “Build me a news website.”
- “Design and implement an internal CRM for a consulting company.”
- “Create a SaaS app for invoice automation.”
- “I want to build a recruiting platform from scratch.”
- “Plan this app properly before you code.”
