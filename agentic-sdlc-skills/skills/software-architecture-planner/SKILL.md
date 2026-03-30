---
name: software-architecture-planner
description: Plan the software architecture for a new application, including frontend structure, backend modules, API contracts, database schema, integrations, deployment assumptions, and sequencing for implementation.
---

# Software Architecture Planner

Use this skill after a project brief exists but before major implementation begins.

## Output files

Write or update:
- `plan/prd.md`
- `plan/architecture/system.md`
- `plan/architecture/frontend.md`
- `plan/architecture/backend.md`
- `plan/architecture/database.md`
- `plan/architecture/infrastructure.md` when relevant

## Frontend plan must include
- route/page map
- component hierarchy
- major states
- data dependencies
- client vs server responsibilities
- responsive notes

## Backend plan must include
- domains/modules
- endpoints or RPC contracts
- validation rules
- auth/authorization
- service responsibilities
- jobs/events/integrations if needed

## Database plan must include
- entities
- relationships
- constraints
- indexes
- migration notes

## Architecture rule

Do not present architecture as vague prose only. Prefer concrete sections, tables, and explicit module boundaries.
