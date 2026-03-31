---
name: software-architecture-planner
description: Plan the software architecture for a new application, including frontend structure, backend modules, API contracts, database schema, integrations, deployment assumptions, and sequencing for implementation.
---

# Software Architecture Planner

Use this skill after a project brief exists but before major implementation begins. The output is a set of architecture documents specific enough that a different agent — or a human engineer — could implement the system without asking clarifying questions.

This skill produces **architects**, not code generators. The goal is to think deeply about structure, boundaries, data ownership, user experience, and failure modes before any code is written.

## Architecture-first principle

Never jump from a user request to writing files. The sequence is always:

1. **Understand** — what is being asked and what is ambiguous.
2. **Structure** — define the system as a whole, its major subsystems, and their boundaries.
3. **Define modules** — break each subsystem into cohesive domains with clear responsibilities.
4. **Define interfaces** — specify how modules communicate: APIs, data contracts, event flows, shared types.
5. **Then implement** — write code for one module at a time, against the defined interfaces.

This applies even when the user says "just build it." A compressed version of the sequence is acceptable; skipping it entirely is not. The architecture plan is the contract that keeps implementation consistent across files, sessions, and agents.

## Output files

Write or update:
- `plan/prd.md` — product requirements distilled from the brief
- `plan/architecture/system.md` — system overview, subsystem map, technology choices, cross-cutting concerns
- `plan/architecture/frontend.md` — page map, component hierarchy, per-page plans, state management, responsive strategy
- `plan/architecture/backend.md` — domain map, per-domain plans, API contracts, auth flows, error strategy, jobs and integrations
- `plan/architecture/database.md` — entity-relationship model, field definitions, constraints, indexes, migration strategy, data ownership map
- `plan/architecture/infrastructure.md` — when relevant: hosting, CI/CD, environments, secrets, scaling assumptions

For large projects, also produce per-page and per-domain detail files:
- `plan/frontend/pages/<page-name>.md` — detailed plan for one page, following the structure in `templates/page-plan.md`
- `plan/backend/domains/<domain-name>.md` — detailed plan for one domain, following the structure in `templates/domain-plan.md`

---

## System decomposition methodology

Architecture planning is a decomposition exercise. The skill turns one big request into a deep hierarchy of concrete, plannable, implementable units.

```
Product request
├── Frontend
│   ├── Page A
│   │   ├── Sections (hero, sidebar, feed, footer)
│   │   ├── Components (card, nav, search bar, modal)
│   │   ├── States (loading, empty, error, success, no results)
│   │   └── Data dependencies (which APIs, what shape)
│   ├── Page B
│   │   └── ...
│   └── Shared components and layouts
├── Backend
│   ├── Domain X
│   │   ├── Endpoints (request shape, response shape, status codes)
│   │   ├── Business rules and validation
│   │   ├── Data ownership (which entities this domain controls)
│   │   └── Failure modes and error responses
│   ├── Domain Y
│   │   └── ...
│   └── Cross-domain concerns (auth, logging, rate limiting)
├── Database
│   ├── Entity A (fields, types, constraints, indexes)
│   ├── Entity B
│   │   └── ...
│   ├── Relationships and join tables
│   └── Migration strategy
└── Infrastructure
    ├── Hosting and deployment
    ├── Environment configuration
    └── CI/CD pipeline
```

Each leaf in this tree should have its own plan section and, during implementation, its own execution history. This decomposition is what makes the system scalable — new pages, new domains, and new entities can be added without rethinking the entire architecture.

The architecture plan is complete when every leaf node has enough detail that an implementer can start work without reading the full tree.

---

## Frontend plan — think like a UI architect

The frontend plan is not a list of page names. It is a structural blueprint for every screen in the application. The planner must think like a **UI architect**: defining layout, identifying reusable components, mapping user interactions to data needs, and planning for every state a user might encounter.

### What the frontend plan must cover

#### 1. Route and page map

A table of every route in the application:

| Route | Page | Auth required | Purpose |
|-------|------|---------------|---------|
| `/` | Homepage | No | Landing and content discovery |
| `/articles/:slug` | Article detail | No | Read a single article |
| `/admin/articles` | Article manager | Yes (editor+) | Create, edit, publish articles |

#### 2. Per-page plan

For **every page**, define:

- **Page purpose** — one sentence describing why this page exists.
- **User goal** — what the user is trying to accomplish on this page.
- **Layout structure** — the spatial arrangement of the page (hero area, sidebar, content grid, sticky nav, footer). Name the layout pattern (e.g., "two-column with left sidebar," "full-width feed with sticky header").
- **Sections on the page** — each distinct content block, listed in visual order from top to bottom.
- **Reusable UI components** — components on this page that also appear elsewhere. Name them and note where they are shared.
- **States** — every state the page or its sections can be in:
  - Loading (skeleton, spinner, progressive)
  - Empty (no data yet, first-time user)
  - Error (API failure, network issue, permission denied)
  - Success (data loaded, action completed)
  - No results (search or filter returned nothing)
  - Overflow (too many items — pagination, infinite scroll, or truncation)
- **User interactions** — every action a user can take on this page: clicks, form submissions, searches, filters, sorts, drag-and-drop, toggles, modals, inline edits.
- **API and data needs** — which backend endpoints this page calls, what data shape it expects, and when data is fetched (on mount, on interaction, on interval).
- **Responsive behavior** — how the layout adapts across breakpoints: what collapses, what stacks, what hides, what changes to a drawer or bottom sheet.

#### 3. Component hierarchy

Identify shared components across pages and define their interface:

| Component | Used on | Props / inputs | States |
|-----------|---------|-----------------|--------|
| `ArticleCard` | Homepage, Category, Search results | title, excerpt, image, author, date, category | default, loading skeleton, image-missing |
| `SearchBar` | Header (all pages) | placeholder, onSubmit, value | idle, focused, loading, no-results |
| `CommentThread` | Article detail | comments[], onReply, onReport | loaded, empty, loading, error |

#### 4. Client vs. server responsibilities

Define what runs on the client and what runs on the server:
- Server-rendered pages vs. client-rendered SPAs
- Data fetching strategy (SSR, SSG, CSR, ISR)
- Client-side state management approach
- Caching strategy for API responses

#### 5. Navigation and flow

- Primary navigation structure (top nav, sidebar, breadcrumbs)
- User flows for key workflows (e.g., "publish an article" flow across multiple pages)
- Deep linking and shareable URL strategy
- Error page and 404 handling

### Frontend example — news website

For a news website, the frontend plan should describe structures like:

**Homepage:**
- Hero section: featured/breaking article with large image, headline, excerpt
- Trending block: horizontal scroll or grid of 4-6 trending articles
- Category navigation: horizontal tabs or dropdown for News, Tech, Sports, etc.
- Latest feed: reverse-chronological article cards with pagination or infinite scroll
- Sidebar: newsletter signup, popular tags, ad placements
- Search bar: persistent in header, with autocomplete suggestions
- States: loading skeletons for hero and feed, empty state for no articles, error banner for API failure

**Article detail page:**
- Article content area: title, author with avatar, publish date, reading time, hero image, rich text body
- Related stories: 3-4 article cards from the same category
- Comment section: threaded comments with reply, report, and upvote
- Author info: bio card with link to author page
- Share toolbar: social sharing buttons, copy link
- States: loading skeleton, article-not-found (404), comments loading independently, empty comments

**Author page:**
- Author bio header with avatar, name, role, article count
- Grid of articles by this author with pagination
- States: loading, no articles yet, author not found

**Admin editor interface:**
- Rich text editor with toolbar (bold, italic, headings, images, embeds)
- Metadata sidebar: category selector, tag input, slug editor, publish date, featured toggle
- Preview panel: live preview of article as it will appear
- Action bar: save draft, schedule, publish, delete
- States: editing, saving, published, validation errors, unsaved changes warning

---

## Backend plan — think like a backend planner

The backend plan is not a list of endpoint names. It is a domain model with clear boundaries, ownership rules, business logic definitions, and explicit API contracts. The planner must think like a **backend architect**: defining who owns what data, how modules interact, what can fail, and how the system handles those failures.

### What the backend plan must cover

#### 1. Domain and module map

Identify every domain in the system. A domain is a cohesive area of business logic with its own data, rules, and API surface. Define clear boundaries between domains.

| Domain | Responsibility | Owns entities | Depends on |
|--------|---------------|---------------|------------|
| Auth | Authentication, session management, password reset | sessions, tokens | Users |
| Users | User profiles, preferences, account settings | users, preferences | — |
| Articles | Article CRUD, publishing workflow, versioning | articles, revisions | Users, Categories, Tags |
| Categories | Category taxonomy, hierarchy | categories | — |
| Comments | User comments, threading, voting | comments, votes | Users, Articles |
| Moderation | Content review, flagging, ban management | flags, bans | Users, Articles, Comments |
| Search | Full-text search, indexing, autocomplete | search_index | Articles, Categories, Tags |
| Analytics | Page views, read time, popular content | page_views, events | Articles |

#### 2. Per-domain detail

For **every domain**, define:

- **Responsibilities** — what this domain does and does not do. Be explicit about boundaries.
- **Business rules** — domain-specific logic. Examples: "An article cannot be published without a category," "A user cannot comment more than 5 times per minute," "Soft-deleted articles are retained for 30 days."
- **Validation rules** — input validation for each operation: required fields, format constraints, length limits, allowed values.
- **Data ownership** — which entities this domain owns (is the source of truth for) and which entities it references from other domains.

#### 3. API contracts — request and response shapes

Do not just list endpoint names. Define the full contract:

```
POST /api/articles
Auth: required (role: editor, admin)
Request body:
  {
    title: string (required, 1-200 chars),
    body: string (required, markdown),
    category_id: uuid (required),
    tags: string[] (optional, max 10),
    status: "draft" | "published" (default: "draft"),
    featured_image_url: string (optional, valid URL)
  }
Response 201:
  {
    id: uuid,
    title: string,
    slug: string (auto-generated),
    body: string,
    category: { id, name },
    tags: [{ id, name }],
    status: string,
    author: { id, name, avatar_url },
    created_at: datetime,
    updated_at: datetime
  }
Response 400: { error: "validation_error", details: [...] }
Response 401: { error: "unauthorized" }
Response 403: { error: "forbidden", message: "Editor role required" }
```

Define this level of detail for every endpoint — not just the happy path, but the error responses too.

#### 4. Auth and authorization flow

Auth is not a checkbox. Define the full flow:

- Authentication method (session-based, JWT, OAuth, API keys)
- Token lifecycle (issuance, refresh, expiration, revocation)
- Role and permission model: which roles exist, what each role can do, how permissions are checked
- Authorization boundaries: which endpoints require auth, which require specific roles, how ownership-based access works (e.g., "users can edit their own comments but not others'")
- Session management: how sessions are stored, how concurrent sessions are handled

#### 5. Error handling strategy

Define a consistent error handling approach across the backend:

- Error response format (consistent JSON structure for all errors)
- HTTP status code conventions (when to use 400 vs 422, 401 vs 403)
- Error categories: validation errors, auth errors, not-found errors, conflict errors, internal errors
- Logging and monitoring: what gets logged, what triggers alerts
- Client-facing vs. internal error messages (never leak stack traces or internal details)

#### 6. Background jobs and async processing

If the system needs work done outside the request-response cycle, define:

| Job | Trigger | Frequency | Failure behavior |
|-----|---------|-----------|------------------|
| Search index rebuild | Article published/updated | Event-driven | Retry 3x, then alert |
| Email notifications | New comment on subscribed article | Event-driven | Retry with backoff |
| Analytics aggregation | Cron | Hourly | Skip and retry next cycle |
| Stale session cleanup | Cron | Daily | Log and continue |

#### 7. Integration points with external services

For each external service the system depends on:

| Service | Purpose | Failure mode | Fallback |
|---------|---------|--------------|----------|
| Email provider | Transactional email | Timeout/5xx | Queue and retry |
| Image CDN | Image hosting and transformation | Timeout | Serve original image |
| OAuth provider | Social login | Unavailable | Show error, offer email login |
| Search engine | Full-text search | Unavailable | Degrade to database LIKE query |

### Backend example — news website

For a news website, the backend should identify and plan these domains with full detail:

- **Auth** — registration, login, password reset, session tokens, role assignment
- **Users** — profile management, avatar upload, author bios, account deletion
- **Roles** — reader, author, editor, admin; permission matrix for each role
- **Articles** — create, edit, publish, unpublish, schedule, version history, slug generation
- **Categories** — CRUD for categories, hierarchy (parent/child), article assignment
- **Tags** — CRUD for tags, article tagging (many-to-many), tag merging
- **Comments** — create, edit, delete, threading (parent/child), voting, spam detection
- **Moderation** — flag content, review queue, ban users, auto-moderation rules
- **Search** — full-text indexing, autocomplete, search ranking, filters by category/date/author
- **Analytics** — page view tracking, popular articles, reading time estimates, dashboard data
- **Admin/editor workflows** — publishing pipeline (draft → review → published), editorial calendar, bulk operations

---

## Database plan — treat data design as a first-class planning stage

The database plan is not an afterthought. It is the foundation the entire system is built on. A poorly designed schema leads to slow queries, data integrity issues, painful migrations, and backend code that fights the data model instead of leveraging it.

### What the database plan must cover

#### 1. Entities with actual fields

Do not just list entity names. Define every field:

| Field | Type | Constraints | Notes |
|-------|------|-------------|-------|
| `id` | UUID | PK | Generated on insert |
| `title` | VARCHAR(200) | NOT NULL | |
| `slug` | VARCHAR(220) | NOT NULL, UNIQUE | Auto-generated from title |
| `body` | TEXT | NOT NULL | Markdown content |
| `status` | ENUM('draft','published','archived') | NOT NULL, DEFAULT 'draft' | |
| `category_id` | UUID | FK → categories.id, NOT NULL | |
| `author_id` | UUID | FK → users.id, NOT NULL | |
| `featured_image_url` | VARCHAR(2048) | NULL | |
| `published_at` | TIMESTAMP | NULL | Set when status → published |
| `created_at` | TIMESTAMP | NOT NULL, DEFAULT NOW() | |
| `updated_at` | TIMESTAMP | NOT NULL, DEFAULT NOW() | Auto-updated |

Provide this level of detail for **every entity** in the system.

#### 2. Relationships with cardinality and join tables

Define every relationship explicitly:

| Relationship | Type | Implementation | Cascade behavior |
|-------------|------|----------------|------------------|
| User → Articles | one-to-many | `articles.author_id` FK | SET NULL on user delete |
| Article → Category | many-to-one | `articles.category_id` FK | RESTRICT on category delete |
| Article ↔ Tags | many-to-many | `article_tags` join table (article_id, tag_id) | CASCADE on article delete |
| Article → Comments | one-to-many | `comments.article_id` FK | CASCADE on article delete |
| Comment → Comment | self-referential (threading) | `comments.parent_id` FK (nullable) | CASCADE on parent delete |

For many-to-many relationships, define the join table with its own constraints:

```
article_tags
  article_id  UUID  FK → articles.id  NOT NULL
  tag_id      UUID  FK → tags.id      NOT NULL
  PRIMARY KEY (article_id, tag_id)
```

#### 3. Constraints

Define all constraints beyond basic NOT NULL and FK:

- **UNIQUE constraints** — which fields or field combinations must be unique (e.g., `users.email`, `articles.slug`, `categories.name`)
- **CHECK constraints** — value restrictions (e.g., `rating BETWEEN 1 AND 5`, `status IN ('draft','published','archived')`)
- **NOT NULL policy** — which fields allow NULL and why (e.g., `published_at` is NULL for draft articles)
- **DEFAULT values** — what defaults are applied on insert

#### 4. Indexes — what queries need to be fast

Design indexes based on known query patterns:

| Index | Table | Columns | Purpose |
|-------|-------|---------|---------|
| `idx_articles_slug` | articles | slug | Lookup article by URL slug |
| `idx_articles_status_published` | articles | status, published_at DESC | Homepage feed: published articles by date |
| `idx_articles_author` | articles | author_id | Author page: articles by author |
| `idx_articles_category` | articles | category_id | Category page: articles by category |
| `idx_comments_article` | comments | article_id, created_at | Load comments for an article |
| `idx_users_email` | users | email | Login lookup |

Explain why each index exists and what query pattern it serves.

#### 5. Data ownership map

Connect the database to the backend domain model — which domain owns which tables:

| Domain | Owns tables | References tables from |
|--------|------------|----------------------|
| Auth | sessions, tokens | users |
| Users | users, preferences | — |
| Articles | articles, revisions | users, categories |
| Tags | tags, article_tags | articles |
| Comments | comments, votes | users, articles |
| Analytics | page_views, events | articles, users |

This map prevents ownership conflicts where two backend modules both think they own the same table.

#### 6. Migration strategy

- **Initial migration** — how the schema is created for a new environment
- **Schema evolution** — how changes are applied (migration files, version numbering)
- **Data seeding** — what seed data is needed for development and testing (admin user, default categories, sample articles)
- **Rollback approach** — how to reverse a migration if it fails
- **Zero-downtime considerations** — additive changes first, then backfill, then remove old columns

---

## Infrastructure plan (when relevant)

If the project has deployment or infrastructure concerns, cover:

- Hosting environment (cloud provider, serverless, containers, VPS)
- CI/CD pipeline stages (lint, test, build, deploy)
- Environment strategy (development, staging, production)
- Secrets management
- Scaling assumptions and bottlenecks
- Monitoring and alerting
- Backup and disaster recovery

---

## Output format rules

Architecture plans lose value when they are vague prose. Follow these rules to keep output concrete and actionable.

1. **Tables over prose.** When describing entities, routes, endpoints, components, or any structured list, use markdown tables. Tables are scannable, comparable, and hard to make vague.

2. **Explicit module boundaries.** Every domain, every page, and every entity must be named and bounded. "The backend handles articles" is not a boundary. "The Articles domain owns the `articles` and `revisions` tables, exposes 6 REST endpoints, and depends on the Users and Categories domains" is a boundary.

3. **Clear interface definitions.** Every API endpoint must show request shape, response shape, auth requirements, and error responses. Every shared component must show its props and states. Every database relationship must show its cardinality and cascade behavior.

4. **Use per-page and per-domain templates.** For large projects, use `templates/page-plan.md` for detailed per-page frontend plans and `templates/domain-plan.md` for detailed per-domain backend plans. These templates ensure consistent depth across all pages and domains.

5. **Name everything.** Components, domains, entities, routes, endpoints, jobs, indexes — all must have explicit names. Unnamed concepts drift during implementation.

6. **Show the hierarchy.** Use the decomposition tree to show how the system breaks down from product → subsystems → modules → units. This tree is the table of contents for the architecture.

## Quality bar

The architecture plan is complete when:

- A different agent could implement any module without asking clarifying questions.
- Every page has a per-page plan with layout, sections, components, states, interactions, and data needs.
- Every backend domain has defined responsibilities, business rules, API contracts with request/response shapes, and error handling.
- Every database entity has fields with types, constraints, indexes, and a clear owner.
- Module boundaries are explicit — it is clear what each module owns and what it depends on.
- The decomposition tree covers every leaf node in the system.

If the plan does not meet this bar, it is not finished. Depth is not optional.
