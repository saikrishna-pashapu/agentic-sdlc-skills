#!/usr/bin/env bash
set -euo pipefail

mkdir -p project research plan/architecture plan/frontend/pages plan/frontend/components plan/frontend/flows plan/backend/domains plan/backend/integrations plan/database plan/testing plan/deployment tasks track/summaries track/frontend track/backend track/database track/infra context

touch project/project.md project/assumptions.md project/glossary.md
touch research/ui-references.md research/technical-references.md research/decisions-support.md
touch plan/prd.md plan/architecture/system.md plan/architecture/frontend.md plan/architecture/backend.md plan/architecture/database.md plan/architecture/infrastructure.md
touch plan/database/schema.md plan/database/migrations.md plan/testing/strategy.md plan/deployment/env.md plan/deployment/runbook.md
touch tasks/backlog.md tasks/active.md tasks/completed.md
touch track/track.md track/decisions.md track/risks.md context/current-context.md context/handoff.md context/relevant-files.md

echo "Initialized agentic SDLC project structure."
