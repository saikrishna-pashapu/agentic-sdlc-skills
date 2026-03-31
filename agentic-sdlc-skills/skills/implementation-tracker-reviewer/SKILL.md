---
name: implementation-tracker-reviewer
description: Review a completed coding task against the written plan, document what changed, update track files, identify risks or gaps, and write a clean handoff summary for the next task.
---

# Implementation Tracker Reviewer

Act as a **disciplined reviewer and memory manager**. Your job is to review what was just built, compare it against the plan, document deviations, update tracking artifacts, and produce a handoff that lets the next agent continue without guessing.

Use this skill after a meaningful coding task, PR-sized change, or milestone. Every completed task must leave the project's tracking files in a state where anyone—human or agent—can open the repo and understand: what this app is, how it was planned, why decisions were made, what's done, what's in progress, what's pending, and what changed.

## Structured review process

Perform these checks in order after each task:

### 1. Task completion check
- What was the stated goal of this task?
- Were the acceptance criteria met? List each criterion and its status (passed / partially met / not met).
- If the goal was not fully met, document what was completed and what remains.

### 2. Plan alignment check
- Does the implementation match the architecture and plan documents?
- Were there any deviations from the planned approach? If so, document each deviation: what was planned, what was done instead, and why.
- Were any planned components skipped or deferred?

### 3. File audit
- Which files were **created**? List each with a brief description of its purpose.
- Which files were **modified**? Summarize what changed in each.
- Which files were **deleted**? Note why.
- Are there any temporary, debug, or orphaned files that should be cleaned up?

### 4. Consistency check
- Is naming consistent across the codebase (variables, functions, files, routes, components)?
- Do API contracts match between frontend and backend?
- Does the database schema align with the data model in the plan?
- Are there any mismatches between documentation and implementation?

### 5. Risk assessment
- Were any new risks introduced by this task?
- Are there blockers for subsequent tasks?
- Was any technical debt introduced? If so, document it with a brief justification and a plan for resolution.
- Are there any security, performance, or reliability concerns?

### 6. Decision documentation
- Were any architecture or design decisions made during this task? Document each in `track/decisions.md` with: the decision, the alternatives considered, the rationale, and the date.
- Were any previously documented decisions changed or overridden? Update the record.

### 7. Next task preparation
- What should the next task be?
- What context does the next agent need to begin?
- Are there any prerequisites or dependencies for the next task?
- What files should the next agent read first?

## Plan vs reality comparison

After every task, explicitly compare what was planned against what was implemented. Use a structured format:

| Aspect | Planned | Actual | Deviation? |
|--------|---------|--------|------------|
| Feature/component | What was in the plan | What was built | Yes/No + explanation |

Document deviations in `track/track.md` and update the plan documents if the deviation is intentional and permanent. If a deviation is temporary or accidental, flag it as a risk or follow-up item.

## Tracking granularity

Track progress at the **component level**, not just overall. Maintain separate tracking for each major area of the project:

- `track/frontend.md` — UI components, pages, client-side state, routing
- `track/backend.md` — API endpoints, business logic, middleware, services
- `track/database.md` — schema, migrations, seed data, queries
- `track/infra.md` — deployment, CI/CD, environment configuration, hosting

Each component-level file should contain: what's done, what's in progress, what's pending, and any component-specific risks or decisions.

Only create component-level files that are relevant to the project. A frontend-only app does not need `track/backend.md`.

## Output files

Update after every review:
- `track/track.md` — overall project progress, task status, deviations from plan
- `track/decisions.md` — architecture and design decisions with rationale
- Component-level `track/*.md` files as described above
- `context/handoff.md` — the continuation note for the next agent (see Handoff as a chain system below)

## Execution summaries

At key milestones (MVP complete, major feature done, sprint boundary, or every 5-10 tasks), create a point-in-time summary:

- `track/summaries/summary-NNN.md` (numbered sequentially: `summary-001.md`, `summary-002.md`, etc.)

Each summary should capture:
- **Date and milestone name**
- **What was accomplished** since the last summary
- **Current state** of each component (frontend, backend, database, infra)
- **Key decisions made** during this period
- **Risks and technical debt** accumulated
- **What's next** — the immediate roadmap
- **Metrics** if available (tasks completed, files changed, test coverage)

These summaries serve as checkpoints. If an agent needs to understand the project at a high level, it should read the latest summary rather than parsing every tracking file.

## Handoff as a chain system

Every completed task must produce a **continuation note** in `context/handoff.md`. The handoff is the critical link in a chain of disciplined engineers. It should feel like a structured shift change, not a casual note.

The handoff must include:

1. **What was done**: a concise summary of the completed task and its outcomes
2. **What changed from the plan**: any deviations, with explanations
3. **Files touched**: a list of created, modified, and deleted files
4. **Issues found**: bugs, inconsistencies, or concerns discovered during the task
5. **What the next step depends on**: prerequisites, blockers, or conditions
6. **What the next agent should read**: an ordered list of files to read before starting (keep this short—ideally 3-5 files)
7. **Recommended next task**: what to do next and why

The system should feel like a chain of disciplined engineers passing work to each other with full context—not one model improvising from scratch each time.

## Handoff quality bar

The next agent should be able to continue with only:
- the task file
- a few relevant plan files
- the handoff summary in `context/handoff.md`

If the next agent would still need to read the entire chat history, the handoff is not good enough. If the next agent would need to re-discover decisions that were already made, the tracking is not good enough.

## Self-documenting build process

After each review, the repository's tracking and project files should collectively answer these questions for anyone who opens the repo:

1. **What is this app?** → `project/project.md`
2. **How was it planned?** → `project/` directory and plan files
3. **Why were decisions made?** → `track/decisions.md`
4. **What's done?** → `track/track.md` and component-level tracking files
5. **What's in progress?** → `track/track.md` and `context/handoff.md`
6. **What's pending?** → `track/track.md` and task backlog
7. **What changed from the plan?** → deviation logs in `track/track.md`
8. **Where is the project right now?** → latest `track/summaries/summary-NNN.md`

If any of these questions cannot be answered from the repo's files alone, the review is incomplete.

## Anti-patterns

- Do not skip the review because the task "was simple." Every task gets reviewed.
- Do not write vague handoffs like "continue building the app." Be specific about what to do next.
- Do not let tracking files go stale. If reality has diverged from the tracking files, update them now.
- Do not track only at the project level. Component-level tracking catches issues that high-level tracking misses.
- Do not defer decision documentation. If a decision was made during the task, document it immediately—not "later."
