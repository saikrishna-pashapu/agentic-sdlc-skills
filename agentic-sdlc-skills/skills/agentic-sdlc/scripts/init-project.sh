#!/usr/bin/env bash
# init-project.sh — Initializes the agentic SDLC project directory structure.
#
# Creates the full folder tree for plan world (architecture, frontend, backend,
# database, tasks) and track world (status, decisions, risks, handoffs). Each
# file is seeded with a markdown header so nothing starts empty.
#
# Usage:
#   cd your-project-root
#   bash path/to/init-project.sh

set -euo pipefail

# ---------------------------------------------------------------------------
# Create directories
# ---------------------------------------------------------------------------
mkdir -p \
  project \
  research \
  plan/architecture \
  plan/frontend/pages \
  plan/frontend/components \
  plan/frontend/flows \
  plan/backend/domains \
  plan/backend/integrations \
  plan/database/entities \
  plan/testing \
  plan/deployment \
  tasks \
  track/summaries \
  track/frontend \
  track/backend \
  track/database \
  track/infra \
  context

# ---------------------------------------------------------------------------
# Helper — write a header only if the file does not already exist
# ---------------------------------------------------------------------------
init_file() {
  local filepath="$1"
  local header="$2"
  if [ ! -f "$filepath" ]; then
    echo "$header" > "$filepath"
  fi
}

# ---------------------------------------------------------------------------
# Project
# ---------------------------------------------------------------------------
init_file "project/project.md"      "# Project Brief"
init_file "project/assumptions.md"  "# Assumptions"
init_file "project/glossary.md"     "# Glossary"

# ---------------------------------------------------------------------------
# Research
# ---------------------------------------------------------------------------
init_file "research/ui-references.md"        "# UI References"
init_file "research/technical-references.md"  "# Technical References"
init_file "research/decisions-support.md"     "# Decision Support Research"

# ---------------------------------------------------------------------------
# Plan — architecture
# ---------------------------------------------------------------------------
init_file "plan/prd.md"                          "# Product Requirements Document"
init_file "plan/architecture/system.md"          "# System Architecture"
init_file "plan/architecture/frontend.md"        "# Frontend Architecture"
init_file "plan/architecture/backend.md"         "# Backend Architecture"
init_file "plan/architecture/database.md"        "# Database Architecture"
init_file "plan/architecture/infrastructure.md"  "# Infrastructure Architecture"

# ---------------------------------------------------------------------------
# Plan — frontend detail
# ---------------------------------------------------------------------------
init_file "plan/frontend/pages/.gitkeep"       ""
init_file "plan/frontend/components/.gitkeep"  ""
init_file "plan/frontend/flows/.gitkeep"       ""

# ---------------------------------------------------------------------------
# Plan — backend detail
# ---------------------------------------------------------------------------
init_file "plan/backend/domains/.gitkeep"       ""
init_file "plan/backend/integrations/.gitkeep"  ""

# ---------------------------------------------------------------------------
# Plan — database, testing, deployment
# ---------------------------------------------------------------------------
init_file "plan/database/schema.md"      "# Database Schema"
init_file "plan/database/migrations.md"  "# Migration Strategy"
init_file "plan/database/entities/.gitkeep" ""
init_file "plan/testing/strategy.md"     "# Testing Strategy"
init_file "plan/deployment/env.md"       "# Environment Configuration"
init_file "plan/deployment/runbook.md"   "# Deployment Runbook"

# ---------------------------------------------------------------------------
# Tasks
# ---------------------------------------------------------------------------
init_file "tasks/backlog.md" "# Task Backlog

| # | Task | Status | Acceptance Criteria |
|---|------|--------|---------------------|"

init_file "tasks/active.md"    "# Active Tasks"
init_file "tasks/completed.md" "# Completed Tasks"

# ---------------------------------------------------------------------------
# Track
# ---------------------------------------------------------------------------
init_file "track/track.md" "# Project Status Tracker

> Updated after every completed task.

## Current Status

| Area | Status | Last Updated |
|------|--------|--------------|"

init_file "track/decisions.md" "# Decision Log

| # | Decision | Rationale | Date |
|---|----------|-----------|------|"

init_file "track/risks.md" "# Risk Register

| # | Risk | Impact | Mitigation | Status |
|---|------|--------|------------|--------|"

# ---------------------------------------------------------------------------
# Context
# ---------------------------------------------------------------------------
init_file "context/current-context.md" "# Current Context

> Snapshot of what the agent is working on right now."

init_file "context/handoff.md" "# Handoff Summary

> Written at the end of each task so the next task (or session) picks up cleanly.

## Last Completed Task

## Key Decisions Made

## Open Items

## Next Steps"

init_file "context/relevant-files.md" "# Relevant Files

> Files the agent should read before starting the next task."

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
echo "=== Agentic SDLC project structure initialized ==="
echo ""
echo "  Plan world:"
echo "    project/        — product brief, assumptions, glossary"
echo "    research/       — UI refs, technical refs, decision support"
echo "    plan/           — architecture, frontend, backend, database, testing, deployment"
echo "    tasks/          — backlog, active, completed"
echo ""
echo "  Track world:"
echo "    track/          — status tracker, decision log, risk register"
echo "    context/        — current context, handoff summary, relevant files"
echo ""
echo "Run your agent with the agentic-sdlc skill to start the workflow."
