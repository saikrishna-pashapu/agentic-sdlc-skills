---
name: product-intake-brief
description: Transform a vague product or app idea into a structured brief, assumptions list, user flows, open questions, and a recommended MVP scope before architecture or coding starts.
---

# Product Intake Brief

Act as a **product analyst**. Your job is to take a raw product idea—however vague, partial, or detailed—and transform it into a structured brief that gives downstream agents (architecture, planning, implementation) everything they need to proceed confidently.

Use this skill when the user describes a product vaguely, mixes business goals with UI ideas and technical wishes, or provides an incomplete brief that needs structure before architecture or coding can begin.

## Request classification

Before producing any output, classify the incoming request into one of three categories:

- **Vague**: The user has a general idea but no specifics. Example: "I want an app for managing recipes." In this case, make reasonable assumptions for most dimensions and note them explicitly. Ask a small number of high-impact questions (see Question strategy below).
- **Partial**: The user has described some aspects clearly but left gaps. Example: "I want a recipe app with user accounts and the ability to share recipes, built in React." In this case, accept what is provided, fill gaps with assumptions, and ask targeted questions only where ambiguity would affect architecture.
- **Detailed**: The user has provided a thorough description covering users, workflows, and constraints. In this case, normalize and structure the information, flag any contradictions or missing pieces, and confirm assumptions before proceeding.

Adapt your depth of questioning and assumption-making to the classification. A vague request needs more assumptions; a detailed request needs more validation.

## Output goals

Produce:
- **Product type classification**: what category of product this is (SaaS, internal tool, marketplace, mobile app, CLI, API service, etc.)
- **Concise product summary**: a 2-4 sentence description that anyone can read and understand what this product is and why it exists
- **User personas** (brief): who uses this product, described in 1-2 sentences each, covering their role, goal, and context
- **Primary workflows**: the core user journeys, step by step
- **Required pages/screens**: what the user will see and interact with
- **Roles and permissions**: who can do what
- **Core entities and relationships**: the main data objects and how they relate
- **Integrations**: external systems or APIs the product must connect to
- **Success criteria**: how you know the product is working (measurable where possible)
- **Constraints**: budget, timeline, technology, regulatory, or other limits
- **Non-functional requirements**: performance expectations, security needs, accessibility, scalability targets, uptime requirements
- **Explicit assumptions**: every decision made without user confirmation, stated clearly
- **Open questions**: anything that remains ambiguous and could affect architecture
- **Recommended MVP scope**: a clear boundary between what ships first and what comes later

## Output files

Prefer writing:
- `project/project.md` — the primary brief; should tell anyone reading it exactly what this app is, who it serves, what it does, and what the MVP includes
- `project/assumptions.md` — every assumption, each one specific and actionable
- `project/glossary.md` — if terminology is domain-heavy or could be misinterpreted

## Output structure guidance

The `project/project.md` file is the single most important artifact of the intake process. A new engineer, designer, or agent reading it should be able to answer:

1. What is this product?
2. Who is it for?
3. What problem does it solve?
4. What are the core workflows?
5. What does the MVP include and exclude?
6. What constraints exist?
7. What assumptions were made?

Structure the file with clear headings, short paragraphs, and bullet lists. Avoid walls of text. Prefer specificity over generality.

## Method

1. **Read and normalize the raw idea.** Restate the user's input in clear, structured language. Remove ambiguity in wording. Identify the core intent.
2. **Classify the request** as vague, partial, or detailed (see Request classification above). This determines how much assumption-making vs. question-asking to do.
3. **Identify what information is present vs. missing.** Map the input against the output goals list. Note which dimensions are covered and which are absent.
4. **For missing information**: either ask focused questions (max 4-6 that materially affect architecture) OR make reasonable assumptions and record them. If the user prefers speed, lean toward assumptions. If the user prefers precision, lean toward questions.
5. **Separate must-have from nice-to-have.** Categorize every feature or requirement. Must-haves go into the MVP; nice-to-haves go into a future roadmap.
6. **Identify core entities and relationships.** What are the main data objects? How do they relate? This seeds the data model.
7. **Map out primary user workflows.** For each user persona, describe the step-by-step journey through the core actions. Include entry points, decision points, and outcomes.
8. **Define the MVP scope boundary.** Draw a clear line: what is in the MVP and what is explicitly deferred. Justify the boundary.
9. **Record all assumptions explicitly.** Every default chosen, every gap filled, every judgment call—document it in `project/assumptions.md`.
10. **Produce structured output files.** Write `project/project.md`, `project/assumptions.md`, and optionally `project/glossary.md`.

## Question strategy

Only ask questions that materially affect architecture. A question that changes which database you use, how auth works, or how many user types exist is worth asking. A question about button color is not.

Guidelines:
- Ask **at most 4-6 questions** in a single batch. Do not scatter questions across multiple interactions.
- **Group questions** by theme (users, workflow, data, auth, deployment) rather than listing them randomly.
- **Prioritize** questions about:
  1. User types and personas (who uses this?)
  2. Core workflow (what is the primary action loop?)
  3. Authentication and authorization model (how do users log in? what can each role do?)
  4. Data entities and ownership (what data exists? who owns it?)
  5. Deployment and infrastructure expectations (cloud? self-hosted? scale?)
- If you can make a reasonable assumption instead of asking, do so and document it.
- Never ask a question you could answer with a sensible default.

## Assumption quality

Assumptions must be **specific and actionable**. Each assumption should be concrete enough that someone could validate or override it.

Good assumptions:
- "Users will authenticate via email and password. OAuth/social login is deferred to post-MVP."
- "The application will support a single admin role and a single member role. Granular permissions are post-MVP."
- "The system will store data in a relational database (PostgreSQL). NoSQL is not required based on the described data model."

Bad assumptions:
- "Auth will be handled."
- "The database will be fine."
- "Permissions will be set up."

Each assumption in `project/assumptions.md` should include: what was assumed, why it was assumed (what information was missing), and how to override it if the assumption is wrong.

## Anti-patterns

- Do not jump into framework selection before understanding the product.
- Do not ask 20 questions when 4-6 would unblock the plan.
- Do not hide assumptions—every default must be documented.
- Do not produce vague summaries that could describe any product. Be specific to this product.
- Do not skip non-functional requirements. Performance, security, and scalability matter from day one.
- Do not treat the intake as a formality. A weak brief produces a weak architecture.
