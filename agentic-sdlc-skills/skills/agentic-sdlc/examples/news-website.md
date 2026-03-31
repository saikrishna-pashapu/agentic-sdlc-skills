# Example: News Website

## The request

> Build me a news website.

---

## Step 1 — Classify the request

This is a **vague request**. No details about:

- Type of news (general, niche, company internal)
- Target audience
- Features beyond "news"
- Technology preferences
- Scale or deployment expectations

The request needs clarification before any code is written.

---

## Step 2 — Clarify or infer

### Option A: Ask focused questions

If the user is available for conversation, ask 4–5 targeted questions:

1. Is this a general public news site, a niche topic site, or an internal company news portal?
2. Who publishes articles — a small editorial team, community contributors, or a single author?
3. Do you need comments, search, and category browsing for readers?
4. Should readers create accounts, or is the site publicly readable without login?
5. Any technology preferences, or should I pick a practical modern stack?

### Option B: Speed mode — make assumptions

If the user wants speed, state assumptions explicitly and move forward.

---

## Step 3 — Assumptions made (speed mode)

Since the user said "build me a news website" with no further detail, the following assumptions are recorded:

- **Product type**: General public news website
- **Publishing model**: Admin panel for editors to create, edit, and publish articles
- **Content organization**: Categories and tags for organizing articles
- **Search**: Full-text search across articles
- **Comments**: Public comments on articles with basic moderation by admins
- **Ads**: Not included in MVP
- **Newsletter**: Not included in MVP
- **Auth model**: Email/password authentication for admin users; public readers do not need accounts to read articles
- **Tech stack**: Next.js frontend, Node.js/Express backend, PostgreSQL database
- **Design**: Responsive design, mobile-friendly, clean reading experience
- **Deployment**: Containerized, deployable to any cloud provider

These assumptions are saved to `project/assumptions.md` so they can be revisited.

---

## Step 4 — Frontend decomposition

### Pages

| Page | Purpose | Key sections |
|------|---------|--------------|
| Home | Landing page, showcases content | Hero with featured article, trending articles block, category navigation, latest articles feed, search bar |
| Article detail | Read a single article | Article content with rich text, author info sidebar, related articles, comments section |
| Category page | Browse articles by category | Category header, filtered article grid, pagination |
| Search results | Find articles by query | Search input, filter controls, result list with snippets |
| Author profile | View an author's work | Author bio, avatar, published articles list |
| Admin — Dashboard | Overview for editors | Article count, recent comments, quick actions |
| Admin — Article editor | Create and edit articles | Rich text editor, category/tag selectors, publish controls, draft/preview toggle |
| Admin — Category manager | Manage categories | Category list, create/edit/delete, hierarchy controls |
| Admin — Comment moderation | Review and moderate comments | Comment queue, approve/reject actions, filters by status |

### Shared components

- `Navbar` — site navigation, search trigger, admin link
- `ArticleCard` — thumbnail, title, excerpt, author, date, category badge
- `CommentBlock` — author name, date, content, reply button, moderation actions
- `SearchBar` — input with autocomplete suggestions
- `Pagination` — page controls for article lists
- `CategoryBadge` — clickable category label
- `TagList` — horizontal list of tag links
- `Footer` — site links, copyright, social links

---

## Step 5 — Backend decomposition

### Domains and responsibilities

| Domain | Responsibilities |
|--------|-----------------|
| **Auth** | Register admin users, login, session management, password reset |
| **Users** | User profiles, roles (admin, editor), avatar management |
| **Articles** | CRUD operations, publish workflow (draft → review → published), featured flag, slug generation |
| **Categories** | CRUD operations, category hierarchy, article-category association |
| **Tags** | CRUD operations, article-tag association, tag-based queries |
| **Comments** | CRUD operations, moderation queue (pending → approved / rejected), spam filtering |
| **Search** | Full-text search across article titles, content, and tags; search indexing |

### Key API routes

```
POST   /api/auth/register
POST   /api/auth/login
POST   /api/auth/logout

GET    /api/articles
GET    /api/articles/:slug
POST   /api/articles          (admin)
PUT    /api/articles/:id      (admin)
DELETE /api/articles/:id      (admin)
PATCH  /api/articles/:id/publish  (admin)

GET    /api/categories
POST   /api/categories        (admin)
PUT    /api/categories/:id    (admin)
DELETE /api/categories/:id    (admin)

GET    /api/tags
POST   /api/tags              (admin)

GET    /api/articles/:id/comments
POST   /api/articles/:id/comments
PATCH  /api/comments/:id/moderate  (admin)
DELETE /api/comments/:id           (admin)

GET    /api/search?q=...
```

---

## Step 6 — Database entities

| Entity | Key fields |
|--------|-----------|
| `users` | id, email, password_hash, name, role, avatar_url, bio, created_at |
| `articles` | id, title, slug, content, excerpt, cover_image_url, author_id, category_id, status (draft/published), featured, published_at, created_at, updated_at |
| `categories` | id, name, slug, description, parent_id, created_at |
| `tags` | id, name, slug, created_at |
| `article_tags` | article_id, tag_id (composite key) |
| `comments` | id, article_id, author_name, author_email, content, status (pending/approved/rejected), created_at |

### Key relationships

- `articles.author_id` → `users.id`
- `articles.category_id` → `categories.id`
- `categories.parent_id` → `categories.id` (self-referential for hierarchy)
- `article_tags.article_id` → `articles.id`
- `article_tags.tag_id` → `tags.id`
- `comments.article_id` → `articles.id`

---

## Step 7 — Files created

Before any code is written, the following planning documents are created:

```
project/
  project.md              # Project name, description, goals
  assumptions.md          # All assumptions listed above

plan/
  prd.md                  # Product requirements document
  architecture/
    frontend.md           # Pages, components, routing, state management
    backend.md            # Domains, API routes, middleware, auth strategy
    database.md           # Entity definitions, relationships, indexes

tasks/
  backlog.md              # Ordered task backlog with acceptance criteria
```

---

## Step 8 — First tasks in backlog

Tasks are ordered by dependency — each task builds on the previous:

| # | Task | Acceptance criteria |
|---|------|-------------------|
| 1 | **Database schema setup** | PostgreSQL schema created with all tables, relationships, and indexes. Migration files committed. |
| 2 | **Auth module** | Admin users can register, log in, and log out. JWT or session-based auth working. Protected route middleware in place. |
| 3 | **Article CRUD API** | Admin can create, read, update, delete articles. Publish workflow (draft → published) functional. Slug auto-generation working. |
| 4 | **Category and tag APIs** | CRUD for categories and tags. Articles can be assigned to categories and tagged. |
| 5 | **Frontend shell and home page** | Next.js app scaffolded with layout, navbar, footer. Home page fetches and displays articles with hero, trending, and latest sections. |
| 6 | **Article detail page** | Article renders with full content, author info, related articles, and comment section. SEO meta tags in place. |

Only after these planning steps are complete does coding begin — starting with task 1.
