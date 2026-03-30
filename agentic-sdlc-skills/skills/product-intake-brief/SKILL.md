---
name: product-intake-brief
description: Transform a vague product or app idea into a structured brief, assumptions list, user flows, open questions, and a recommended MVP scope before architecture or coding starts.
---

# Product Intake Brief

Use this skill when the user describes a product vaguely or mixes business goals, UI ideas, and technical wishes into one message.

## Output goals

Produce:
- a concise product summary
- primary users
- primary workflows
- required pages/screens
- roles and permissions
- integrations
- explicit assumptions
- open questions
- recommended MVP scope

## Output files

Prefer writing:
- `project/project.md`
- `project/assumptions.md`
- `project/glossary.md` if terminology is domain-heavy

## Method

1. Normalize the idea.
2. Separate must-have requirements from nice-to-haves.
3. Detect ambiguity.
4. Ask focused questions only when they materially affect architecture.
5. If the user prefers speed, choose reasonable defaults and record them.
6. End with an MVP scope recommendation.

## Anti-patterns

- Do not jump into framework selection before understanding the product.
- Do not ask 20 questions when 4 would unblock the plan.
- Do not hide assumptions.
