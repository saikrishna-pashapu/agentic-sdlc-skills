# agentic-sdlc-skills

A structured software delivery skill that teaches coding agents how to turn vague product ideas into planned, modular, trackable, reviewable software builds with clean memory and task handoffs.

This package is designed for the open Agent Skills ecosystem. Each skill lives in `skills/<skill-name>/SKILL.md`, which is the format used by Codex/OpenAI skills and the `npx skills` CLI. See the official Codex skill docs and the skills CLI README for the current format and install commands.

## What this does

Most AI coding agents can write code, but they lose structure fast. Context drifts, plans are forgotten, decisions go unrecorded, and handoffs between tasks are messy or nonexistent. This skill package fixes that.

**agentic-sdlc-skills** installs engineering discipline into AI coding agents. It:

- Turns your repo into **structured memory** — a living system of plans, task boards, execution history, and handoff documents
- Makes the agent act as: **product analyst → software architect → delivery planner → disciplined implementer → reviewer → memory manager**
- Solves the real problem in AI-driven software builds: **loss of structure, context, and traceability**

When installed, the agent doesn't just write code. It understands the request, clarifies ambiguity, researches options, creates architecture plans, decomposes work into narrow tasks, executes one task at a time, reviews its own output, tracks progress, and writes clean handoffs so the next task (or session) picks up exactly where it left off.

## The two worlds: Plan vs Track

This system separates concerns into two worlds:

- **Plan world** — what *should* be built. Architecture plans, page plans, domain models, database entities, task backlogs. These are the source of truth for intent.
- **Track world** — what *has* happened. Status updates, decision logs, risk registers, handoff summaries. These are the source of truth for progress and context.

The agent reads from Plan to know what to build. It writes to Track to record what it did. The two worlds stay separate and clean.

## Included skills

- **`agentic-sdlc`** — Main orchestrator. Runs the 9-step workflow: understand → clarify → research → plan → decompose → execute → review → track → hand off. This is the primary skill that coordinates the full delivery lifecycle.
- **`product-intake-brief`** — Acts as a product analyst. Transforms vague ideas into structured briefs with assumptions, user workflows, MVP scope, and open questions. Ensures the agent truly understands the request before planning begins.
- **`software-architecture-planner`** — Acts as a software architect. Produces deep frontend page planning, backend domain planning, database entity planning, API surface design, infrastructure layout, and full system decomposition.
- **`implementation-tracker-reviewer`** — Acts as a reviewer and memory manager. Compares plan vs reality after each task, tracks progress across the backlog, records decisions and risks, and writes handoff summaries for task continuity.

## What the agent creates

When the agent runs through the workflow, it produces real project artifacts:

| Category | Files |
|---|---|
| **Product** | Product brief, assumptions log, glossary |
| **Architecture** | System plan, frontend architecture, backend architecture, database architecture, infrastructure plan |
| **Frontend detail** | Page plans (per page), component inventory, user flow maps |
| **Backend detail** | Domain plans (per domain), integration specs |
| **Database detail** | Entity plans (per entity), schema design, migration strategy |
| **Tasks** | Backlog with acceptance criteria, active task tracker, completed task log |
| **Tracking** | Status tracker, decision log, risk register |
| **Context** | Current context snapshot, handoff summary, relevant files list |
| **Research** | UI references, technical references, decision support notes |

## Install from GitHub

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills
```

List skills first:

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills --list
```

Install only one skill:

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills --skill agentic-sdlc
```

The `skills` CLI supports GitHub shorthand (`owner/repo`), `--list`, and `--skill`.

## Install locally

```bash
npx skills add ./ --list
npx skills add ./
```

## Very important command note

Use **one line**:

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills
```

Do not split the repo name onto the next line.

## Recommended repo structure

```text
skills/
  agentic-sdlc/
    SKILL.md
    references/
      page-plan.md
      domain-plan.md
      entity-plan.md
      decomposition-guide.md
      context-protocol.md
    templates/
    checklists/
    scripts/
      init-project.sh
  product-intake-brief/
    SKILL.md
  software-architecture-planner/
    SKILL.md
  implementation-tracker-reviewer/
    SKILL.md
```

The `init-project.sh` script creates the full project directory structure with starter headers in every file.

## How this package is meant to be used

1. **Start with `agentic-sdlc`** for end-to-end orchestration. This is the main entry point — it coordinates all other skills and drives the 9-step workflow from intake through handoff.
2. **Use `product-intake-brief`** when the request is vague or incomplete. The agent will interview the user (or make explicit assumptions), produce a structured brief, and surface open questions before any planning begins.
3. **Use `software-architecture-planner`** before coding major features. The agent will produce page-level frontend plans, domain-level backend plans, entity-level database plans, and a full system decomposition.
4. **Use `implementation-tracker-reviewer`** after each task or PR-sized change. The agent will compare what was built against the plan, update tracking files, record any new decisions or risks, and write a handoff summary for the next task.

## Philosophy

This skill package is built on a set of core beliefs about how AI agents should build software:

- **Architecture before code.** Never start coding without a plan. Even a short plan is better than none.
- **Project files as memory, not chat history.** The agent's memory lives in the repo — in plan files, tracking files, and handoffs — not in ephemeral conversation context.
- **Plan and Track are separate worlds.** What should be built (plan) and what has happened (track) are kept in distinct files and never mixed.
- **Narrow, focused tasks.** Work is decomposed into small, well-scoped tasks with clear acceptance criteria. One task, one concern.
- **Clean handoffs between tasks.** Every task ends with a written handoff so the next task (or session) has full context without re-reading everything.
- **Explicit assumptions always.** When the agent doesn't know something, it states assumptions clearly rather than guessing silently.

## License

MIT
