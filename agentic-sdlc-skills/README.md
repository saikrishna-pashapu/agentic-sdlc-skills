# agentic-sdlc-skills

A real multi-skill package for AI coding agents that helps turn vague product ideas into a structured software delivery workflow.

This package is designed for the open Agent Skills ecosystem. Each skill lives in `skills/<skill-name>/SKILL.md`, which is the format used by Codex/OpenAI skills and the `npx skills` CLI. See the official Codex skill docs and the skills CLI README for the current format and install commands.

## Included skills

- `agentic-sdlc` — end-to-end orchestrator for intake, planning, tasking, tracking, review, and handoffs
- `product-intake-brief` — turns vague app ideas into a structured brief and assumptions file
- `software-architecture-planner` — writes frontend, backend, database, API, and infra plans
- `implementation-tracker-reviewer` — reviews implementation against the plan and updates tracking files

## Install from GitHub

```bash
npx skills add YOUR_USERNAME/agentic-sdlc-skills
```

List skills first:

```bash
npx skills add YOUR_USERNAME/agentic-sdlc-skills --list
```

Install only one skill:

```bash
npx skills add YOUR_USERNAME/agentic-sdlc-skills --skill agentic-sdlc
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
    templates/
    checklists/
    scripts/
  product-intake-brief/
    SKILL.md
  software-architecture-planner/
    SKILL.md
  implementation-tracker-reviewer/
    SKILL.md
```

## How this package is meant to be used

1. Start with `agentic-sdlc` for end-to-end orchestration.
2. Use `product-intake-brief` when the request is vague or incomplete.
3. Use `software-architecture-planner` before coding major features.
4. Use `implementation-tracker-reviewer` after each task or PR-sized change.

## License

MIT
