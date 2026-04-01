<div align="center">

# 🏗️ agentic-sdlc-skills

**Engineering discipline for AI coding agents — from vague ideas to production-ready software.**

[![Validate Skill](https://github.com/saikrishna-pashapu/agentic-sdlc-skills/actions/workflows/validate-skill.yml/badge.svg)](https://github.com/saikrishna-pashapu/agentic-sdlc-skills/actions/workflows/validate-skill.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills CLI Compatible](https://img.shields.io/badge/skills_CLI-compatible-brightgreen.svg)](#-quick-start)

*Turn your AI coding agent into a disciplined engineering team that plans before it codes, tracks what it builds, and writes clean handoffs between tasks.*

</div>

---

## 📖 Table of Contents

- [What is this?](#-what-is-this)
- [The Problem it Solves](#-the-problem-it-solves)
- [How it Works](#-how-it-works)
- [Included Skills](#-included-skills)
- [Quick Start](#-quick-start)
- [The Two Worlds: Plan vs Track](#-the-two-worlds-plan-vs-track)
- [The 9-Step Operating Loop](#-the-9-step-operating-loop)
- [What the Agent Produces](#-what-the-agent-produces)
- [Project Structure](#-project-structure)
- [Usage Guide](#-usage-guide)
- [Repository Layout](#-repository-layout)
- [Philosophy](#-philosophy)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🧠 What is this?

**agentic-sdlc-skills** is a skill package for AI coding agents (Codex, OpenAI-compatible agents, and the `npx skills` CLI ecosystem). It installs a structured software delivery methodology directly into your agent so it behaves like a team of disciplined engineers rather than one model improvising.

Each skill lives in `skills/<skill-name>/SKILL.md` following the open [Agent Skills](https://github.com/zaidmukaddam/skills-cli) format.

---

## 🔥 The Problem it Solves

Most AI coding agents can write code, but they **lose structure fast**:

| Problem | What happens |
|---|---|
| 🧠 **Context drift** | The agent forgets plans mid-build and makes inconsistent decisions |
| 📋 **No planning** | Code is written without architecture, leading to rewrites |
| 🔀 **Messy handoffs** | Tasks end without summaries — the next session starts from scratch |
| 📝 **Invisible decisions** | Design choices are made silently and never recorded |
| 🔍 **No traceability** | Nobody can tell what's done, what's pending, or what changed |

**agentic-sdlc-skills fixes all of this.** It turns your repository into a living system of plans, task boards, execution history, and handoff documents — making the project itself the agent's memory.

---

## ⚙️ How it Works

When installed, the agent doesn't just write code. It follows a disciplined workflow:

```
  Understand → Clarify → Research → Plan → Decompose → Execute → Review → Track → Hand off
```

The agent shifts roles as work progresses:

| Role | When | What it does |
|---|---|---|
| 🔍 **Product Analyst** | During intake | Asks the right questions, records assumptions |
| 🏛️ **Software Architect** | Before implementation | Defines modules, interfaces, data models, and boundaries |
| 📋 **Delivery Planner** | During decomposition | Breaks architecture into small, dependency-aware tasks |
| 💻 **Disciplined Implementer** | During execution | Works on one scoped task at a time |
| ✅ **Reviewer** | After code | Checks implementation against plan, surfaces risks |
| 📦 **Memory Manager** | Between tasks | Updates tracking files, writes clean handoff summaries |

---

## 🧩 Included Skills

This package contains **4 skills** that form a complete delivery pipeline:

### 1. `agentic-sdlc` — The Orchestrator

> *The main entry point that coordinates the full delivery lifecycle.*

Runs the 9-step workflow from understanding a request through planning, implementing, reviewing, and handing off. This is the skill you install when you want end-to-end engineering discipline.

**Includes:**
- 📝 **Templates** — Starter templates for projects, tasks, tracking, handoffs, page plans, domain plans, entity plans, and decision logs
- 📚 **References** — Intake question bank, research guide, decomposition guide, and context management protocol
- ✅ **Checklists** — Planning checklist and review checklist
- 🛠️ **Scripts** — `init-project.sh` to scaffold the full project directory
- 📖 **Examples** — A complete news website example

### 2. `product-intake-brief` — The Product Analyst

> *Transforms vague ideas into structured briefs before architecture begins.*

Takes a raw product idea — however vague, partial, or detailed — and produces a structured brief with user personas, workflows, MVP scope, assumptions, and open questions. Ensures the agent truly understands the request before planning starts.

**Key outputs:**
- `project/project.md` — the primary brief
- `project/assumptions.md` — every assumption, explicit and actionable
- `project/glossary.md` — domain terminology defined

### 3. `software-architecture-planner` — The Architect

> *Plans the full system architecture with deep frontend, backend, and database design.*

Produces comprehensive architecture documents covering page-level frontend plans, domain-level backend plans, entity-level database plans, API surface design, infrastructure layout, and full system decomposition. Specific enough that a different agent could implement the system without clarifying questions.

**Key outputs:**
- `plan/prd.md` — product requirements document
- `plan/architecture/system.md` — system overview and technology choices
- `plan/architecture/frontend.md` — page map and component hierarchy
- `plan/architecture/backend.md` — domain map and API contracts
- `plan/architecture/database.md` — entity-relationship model and schema
- `plan/architecture/infrastructure.md` — hosting, CI/CD, and scaling

### 4. `implementation-tracker-reviewer` — The Reviewer & Memory Manager

> *Reviews completed work, compares plan vs reality, and writes clean handoffs.*

After each coding task, it reviews what was built against the plan, documents deviations, updates tracking files, records decisions and risks, and writes a handoff summary so the next task (or session) starts with full context.

**Key outputs:**
- `track/track.md` — overall project progress
- `track/decisions.md` — architecture decisions with rationale
- `track/risks.md` — known risks and mitigations
- `context/handoff.md` — continuation note for next task

---

## 🚀 Quick Start

### Install all skills from GitHub

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills
```

### List available skills first

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills --list
```

### Install a single skill

```bash
npx skills add saikrishna-pashapu/agentic-sdlc-skills --skill agentic-sdlc
```

### Install from a local clone

```bash
npx skills add ./ --list
npx skills add ./
```

> ⚠️ **Important:** Always write the full command on **one line**. Do not split the repo name across lines.

---

## 🌍 The Two Worlds: Plan vs Track

This system separates concerns into two distinct worlds:

```
┌──────────────────────────────┐    ┌──────────────────────────────┐
│         PLAN WORLD           │    │         TRACK WORLD          │
│        (plan/ dir)           │    │        (track/ dir)          │
│                              │    │                              │
│  What SHOULD be built        │    │  What ACTUALLY happened      │
│                              │    │                              │
│  • Architecture documents    │    │  • Status updates            │
│  • Page plans                │    │  • Decision logs             │
│  • Domain models             │    │  • Risk registers            │
│  • Database entities         │    │  • Deviation records         │
│  • API contracts             │    │  • Handoff summaries         │
│  • Task backlogs             │    │  • Execution history         │
│                              │    │                              │
│  Source of truth for INTENT  │    │  Source of truth for REALITY │
└──────────────────────────────┘    └──────────────────────────────┘
```

The agent reads from **Plan** to know what to build. It writes to **Track** to record what it did. The two worlds stay separate and clean.

This split keeps the project honest. Without it, a planned API endpoint that was never built looks the same as one that was, and a schema change made during coding silently overwrites the original design.

---

## 🔄 The 9-Step Operating Loop

Not every project uses all nine steps — a well-specified request can skip research, and a simple task may compress several steps. But the sequence is fixed:

| Step | Name | What happens |
|---|---|---|
| **1** | **Understand** | Read the request. Classify as detailed, partial, or vague. |
| **2** | **Clarify** | Fill gaps — ask targeted questions or make assumptions and record them. |
| **3** | **Research** | For generic requests, research patterns before freezing architecture. |
| **4** | **Plan** | Write the architecture. Frontend, backend, database, infrastructure. |
| **5** | **Decompose** | Convert the plan into focused, narrow tasks with acceptance criteria. |
| **6** | **Execute** | Implement one scoped task at a time with minimum context loaded. |
| **7** | **Review** | Check implementation against plan. Surface deviations and risks. |
| **8** | **Track** | Update status, decisions, and risk files. Move tasks across boards. |
| **9** | **Hand off** | Write a continuation summary so the next task starts cleanly. |

> **Understand before you plan. Plan before you build. Track after you build. Hand off before you move on.**

---

## 📦 What the Agent Produces

When the agent runs through the workflow, it produces real project artifacts in your repository:

| Category | Files | Purpose |
|---|---|---|
| **Product** | `project/project.md`, `project/assumptions.md`, `project/glossary.md` | What this product is and why it exists |
| **Architecture** | `plan/architecture/system.md`, `plan/architecture/frontend.md`, `plan/architecture/backend.md`, `plan/architecture/database.md`, `plan/architecture/infrastructure.md` | How the system is structured |
| **Frontend Detail** | `plan/frontend/pages/*.md`, component inventory, user flow maps | Per-page plans with states, components, and data deps |
| **Backend Detail** | `plan/backend/domains/*.md`, integration specs | Per-domain plans with API contracts |
| **Database Detail** | `plan/database/` — entity plans, schema, migration strategy | Per-entity field definitions, constraints, indexes |
| **Tasks** | `tasks/backlog.md`, `active.md`, `completed.md`, `task-NNN.md` | Backlog with acceptance criteria and dependencies |
| **Tracking** | `track/track.md`, `decisions.md`, `risks.md`, component-level files | Execution reality — what happened and why |
| **Context** | `context/current-context.md`, `handoff.md`, `relevant-files.md` | Active context and continuation notes |
| **Research** | `research/ui-references.md`, `technical-references.md`, `decisions-support.md` | Distilled research for architectural decisions |

---

## 📁 Project Structure

When the agent scaffolds a new project (or you run `init-project.sh`), this is the recommended directory layout:

```
project/
  project.md              # What is this app?
  assumptions.md          # Every assumption, explicit and actionable
  glossary.md             # Domain terms defined

research/
  ui-references.md        # UI patterns and component conventions
  technical-references.md # Framework choices and integration patterns
  decisions-support.md    # Trade-off analysis for key decisions

plan/
  prd.md                  # Product requirements document
  architecture/
    system.md             # System overview and technology choices
    frontend.md           # Page map, component hierarchy, state mgmt
    backend.md            # Domain map, API contracts, auth flows
    database.md           # Entity-relationship model, schema, indexes
    infrastructure.md     # Hosting, CI/CD, environments, scaling
  frontend/
    pages/                # Per-page detailed plans
    components/           # Component inventory
    flows/                # User journey maps
  backend/
    domains/              # Per-domain detailed plans
    integrations/         # External system specs
  database/
    schema.md             # Full schema design
    migrations.md         # Migration strategy

tasks/
  backlog.md              # Pending tasks with acceptance criteria
  active.md               # Currently in-progress tasks
  completed.md            # Finished tasks with outcomes
  task-001.md             # Individual task files

track/
  track.md                # Overall project progress
  decisions.md            # Architecture decisions with rationale
  risks.md                # Known risks and mitigations
  summaries/              # Point-in-time execution summaries
  frontend/               # Frontend-specific tracking
  backend/                # Backend-specific tracking
  database/               # Database-specific tracking
  infra/                  # Infrastructure-specific tracking

context/
  current-context.md      # Active context packet
  handoff.md              # Continuation note for next task
  relevant-files.md       # Files relevant to current work
```

> 💡 Run `scripts/init-project.sh` inside the `agentic-sdlc` skill to scaffold this entire structure automatically.

---

## 📘 Usage Guide

### End-to-end project build

Start with the `agentic-sdlc` skill for a full structured build:

1. **Install the skills** → `npx skills add saikrishna-pashapu/agentic-sdlc-skills`
2. **Describe your idea** → Tell the agent what you want to build
3. **The agent handles the rest** → Intake → Architecture → Tasks → Implementation → Review → Handoff

### Individual skill usage

| When you need to... | Use this skill |
|---|---|
| Turn a vague idea into a structured brief | `product-intake-brief` |
| Plan system architecture before coding | `software-architecture-planner` |
| Orchestrate the full delivery lifecycle | `agentic-sdlc` |
| Review a task and write a handoff | `implementation-tracker-reviewer` |

### Recommended workflow

```
1. Start with agentic-sdlc for full orchestration
       ↓
2. product-intake-brief runs when the request is vague
       ↓
3. software-architecture-planner runs before coding major features
       ↓
4. Implementation happens one task at a time
       ↓
5. implementation-tracker-reviewer runs after each task or PR
       ↓
6. Loop back to step 4 until the backlog is empty
```

### "Just start building" mode

Even when the user says "just build it," the agent will still do a compressed version:

1. Write assumptions → `project/assumptions.md`
2. Write a system plan → `plan/architecture/system.md`
3. Create initial tasks → `tasks/backlog.md`
4. Then begin implementation

A compressed plan is acceptable. No plan is not.

---

## 🗂️ Repository Layout

```
skills/
├── agentic-sdlc/                         # Main orchestrator skill
│   ├── SKILL.md                          # Skill definition
│   ├── templates/                        # Starter templates
│   │   ├── project.md, task.md, track.md
│   │   ├── handoff.md, decision-log.md
│   │   └── page-plan.md, domain-plan.md, entity-plan.md
│   ├── references/                       # Guides and protocols
│   │   ├── intake-question-bank.md
│   │   ├── research-guide.md
│   │   ├── decomposition-guide.md
│   │   └── context-protocol.md
│   ├── checklists/                       # Quality checklists
│   │   ├── planning-checklist.md
│   │   └── review-checklist.md
│   ├── scripts/
│   │   └── init-project.sh               # Project scaffolding script
│   └── examples/
│       └── news-website.md               # Full worked example
├── product-intake-brief/
│   └── SKILL.md                          # Product analyst skill
├── software-architecture-planner/
│   └── SKILL.md                          # Architecture planner skill
└── implementation-tracker-reviewer/
    └── SKILL.md                          # Reviewer & tracker skill
```

---

## 💡 Philosophy

This skill package is built on core beliefs about how AI agents should build software:

| Principle | Description |
|---|---|
| 🏛️ **Architecture before code** | Never start coding without a plan. Even a short plan is better than none. |
| 💾 **Project files as memory** | The agent's memory lives in the repo — in plan files, tracking files, and handoffs — not in ephemeral conversation context. |
| 🔀 **Plan and Track are separate** | What should be built (plan) and what has happened (track) are kept in distinct files and never mixed. |
| 🎯 **Narrow, focused tasks** | Work is decomposed into small, well-scoped tasks with clear acceptance criteria. One task, one concern. |
| 🤝 **Clean handoffs** | Every task ends with a written handoff so the next task (or session) has full context without re-reading everything. |
| 📣 **Explicit assumptions** | When the agent doesn't know something, it states assumptions clearly rather than guessing silently. |

---

## 🤝 Contributing

Contributions are welcome! Here's how to help:

1. **Fork** this repository
2. **Create a branch** for your changes
3. **Follow the skill format** — each skill uses `SKILL.md` with YAML frontmatter (`name`, `description`)
4. **Test locally** — `npx skills add ./` to verify your changes install correctly
5. **Submit a pull request** with a clear description of what you changed and why

The CI pipeline runs [`validate-skill`](https://github.com/zaidmukaddam/validate-skill) on every push and PR to ensure correct skill structure.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">

**Built for the open Agent Skills ecosystem** · **Compatible with Codex, OpenAI agents, and the `npx skills` CLI**

⭐ Star this repo if you find it useful!

</div>
