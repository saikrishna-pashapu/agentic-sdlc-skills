#!/usr/bin/env bash
set -euo pipefail

mkdir -p project research plan/architecture plan/frontend/pages plan/frontend/components plan/backend/domains plan/database plan/testing plan/deployment tasks track/summaries context

touch project/project.md project/assumptions.md project/glossary.md
touch research/ui-references.md research/technical-references.md research/decisions-support.md
touch plan/prd.md plan/architecture/system.md plan/architecture/frontend.md plan/architecture/backend.md plan/architecture/database.md
touch tasks/backlog.md tasks/active.md tasks/completed.md
touch track/track.md track/decisions.md track/risks.md context/current-context.md context/handoff.md context/relevant-files.md

echo "Initialized Agentic SDLC project structure."
