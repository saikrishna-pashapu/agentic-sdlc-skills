# Decomposition Guide

How to turn a big product idea into a structured hierarchy of implementable units.

## Why decompose

A large system built as one piece leads to:
- inconsistent decisions across parts
- forgotten features
- tangled dependencies
- unclear progress

Decomposition creates clear boundaries, smaller risks, and measurable progress.

## Decomposition hierarchy

Break every product into this hierarchy:

```text
Product
├── Frontend
│   ├── Pages
│   │   ├── Page 1
│   │   │   ├── Section A
│   │   │   ├── Section B
│   │   │   └── Section C
│   │   └── Page 2
│   ├── Components (reusable)
│   │   ├── Component 1
│   │   └── Component 2
│   └── Flows (multi-step)
│       └── Flow 1
├── Backend
│   ├── Domain 1
│   │   ├── Endpoints
│   │   ├── Business rules
│   │   └── Validations
│   ├── Domain 2
│   └── Shared services
│       ├── Auth
│       ├── File storage
│       └── Notifications
├── Database
│   ├── Entity 1
│   ├── Entity 2
│   └── Relationships / join tables
└── Infrastructure
    ├── Deployment
    ├── Environment config
    └── CI/CD
```

## Rules for good decomposition

1. **Each unit should have one clear owner.** A component belongs to one page context. An entity belongs to one domain.
2. **Each unit should be plannable independently.** If you cannot describe the unit without describing three other units, it is too coupled.
3. **Each unit should be implementable in one task.** If it takes more than one focused session, split further.
4. **Dependencies flow downward.** Pages depend on components. Endpoints depend on entities. Never the reverse.
5. **Shared units are explicit.** If a component is reused across pages, document it as a shared component with all consumers listed.

## How to decompose a new product

### Step 1 — list the major areas

Identify the top-level areas: frontend, backend, database, infrastructure.

### Step 2 — list the pages

For frontend, list every page/screen the user will see. Include admin pages.

### Step 3 — list the domains

For backend, list every domain/module. A domain is a group of related business logic. Typical domains: auth, users, articles, comments, search, notifications, admin.

### Step 4 — list the entities

For database, list every entity. An entity is a persistent data object. Map each entity to its owning domain.

### Step 5 — identify shared components

Look across pages for repeated UI patterns. Extract them as shared components.

### Step 6 — identify shared services

Look across domains for repeated backend logic. Extract them as shared services (auth, file upload, email, etc.).

### Step 7 — map dependencies

Draw the dependency graph. Pages → components, endpoints → entities, domains → shared services.

### Step 8 — create the task list

For each unit, create a task. Order tasks by dependency: implement foundations first, then build upward.

## Decomposition depth example — news website

```text
News Website
├── Frontend
│   ├── Pages
│   │   ├── Home (hero, trending, categories, latest feed)
│   │   ├── Article Detail (content, author, related, comments)
│   │   ├── Category Page (filtered article list)
│   │   ├── Search Results (query, filters, results grid)
│   │   ├── Author Profile (bio, articles by author)
│   │   ├── Login / Register
│   │   └── Admin
│   │       ├── Article Editor
│   │       ├── Category Manager
│   │       └── Comment Moderation
│   ├── Components
│   │   ├── Navbar (logo, nav links, search, auth state)
│   │   ├── ArticleCard (thumbnail, title, excerpt, metadata)
│   │   ├── CommentBlock (comment list, reply form)
│   │   ├── SearchBar (autocomplete, recent searches)
│   │   ├── Pagination
│   │   └── Footer
│   └── Flows
│       ├── Read article flow
│       ├── Publish article flow (admin)
│       └── Comment flow
├── Backend
│   ├── Auth (register, login, sessions, password reset)
│   ├── Users (profiles, preferences)
│   ├── Articles (CRUD, publish workflow, drafts)
│   ├── Categories (CRUD, hierarchy)
│   ├── Tags (CRUD, article tagging)
│   ├── Comments (CRUD, moderation queue)
│   ├── Search (full-text, filters, ranking)
│   └── Analytics (page views, popular articles)
├── Database
│   ├── users
│   ├── articles
│   ├── categories
│   ├── tags
│   ├── article_tags (join)
│   ├── comments
│   └── page_views
└── Infrastructure
    ├── Deployment config
    ├── Environment variables
    └── Search index setup
```

## Anti-patterns

- **Too shallow**: listing only "frontend" and "backend" without drilling into pages and domains
- **Too granular too early**: defining individual CSS classes before the page structure is clear
- **Missing shared layer**: building the same component five times because shared components were not identified
- **No dependency order**: starting with features that depend on foundations that do not exist yet

## When to re-decompose

- When a new major feature is added
- When a domain turns out to be two separate domains
- When a page becomes complex enough to split into sub-pages
- When dependencies reveal circular coupling
