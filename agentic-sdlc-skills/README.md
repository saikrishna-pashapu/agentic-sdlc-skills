# agentic-sdlc-skills

A public skill package for AI coding agents that turns vague product ideas into a structured software delivery workflow.

The first skill in this repo, **agentic-sdlc**, helps an agent:

- clarify product requirements
- research missing architecture and UI patterns
- create a plan before coding
- split work into frontend, backend, database, and infrastructure
- create task files with dependencies and acceptance criteria
- keep context clean with handoff summaries
- track implementation progress and decisions in repo files

## What this is

This repo is designed for the open agent skills ecosystem. The current format centers on a folder containing a `SKILL.md` file, and the `skills` CLI installs skills from a local path or GitHub repo with `npx skills add ...`. See the official docs and CLI references before publishing publicly. [OpenAI skills docs](https://developers.openai.com/codex/skills/) and [skills CLI](https://github.com/vercel-labs/skills).

## Repository structure

```text
skills/
  agentic-sdlc/
    SKILL.md
    templates/
    checklists/
    examples/
    scripts/
```

## Install locally

```bash
npx skills add ./
```

## Install from GitHub

```bash
npx skills add YOUR_USERNAME/agentic-sdlc-skills
```

## Suggested publishing flow

1. Edit the skill content so it matches your preferred workflow and style.
2. Test locally with `npx skills add ./`.
3. Push this repo to GitHub.
4. Test GitHub install with `npx skills add YOUR_USERNAME/agentic-sdlc-skills`.
5. Share the repo or submit it to skill discovery sites after you verify installation works.

## Tips

- Keep the durable project state in repo files like `plan/`, `tasks/`, `track/`, and `context/`.
- Use the skill for workflow and behavior, not as the only memory store.
- Start with one skill that works well before splitting into multiple specialist skills.

## License

MIT
