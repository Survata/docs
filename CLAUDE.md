# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A Mintlify-powered documentation site. Pages are MDX files with YAML frontmatter. Site configuration lives in `docs.json`.

## Commands

- `mint dev` — local preview at http://localhost:3000 (auto-reloads on file changes)
- `mint dev --port 3333` — run on a custom port
- `mint broken-links` — validate all internal links
- `mint update` — update CLI to latest version
- `npm i -g mint` — install/reinstall the Mintlify CLI (requires Node.js 19+)

## Architecture

**`docs.json`** — Central config: site name, colors, logo, navigation structure, footer, navbar. Every new page must be added to the `navigation.tabs[].groups[].pages` array here or it won't appear in the sidebar (though it will still be searchable and directly linkable).

**Navigation structure**: Two tabs defined — "Guides" and "API reference". Navigation is recursive; groups can nest inside pages arrays.

**Content directories**:
- `essentials/` — Core Mintlify feature docs (markdown, code, images, navigation, settings, snippets)
- `api-reference/` — API docs using OpenAPI spec (`openapi.json`) with MDX endpoint pages
- `ai-tools/` — Setup guides for AI coding tools (Claude Code, Cursor, Windsurf)
- `snippets/` — Reusable MDX snippets included via `<Snippet />` component
- `images/`, `logo/` — Static assets

**`.mintignore`** — Controls which files Mintlify skips. `drafts/` and `*.draft.mdx` are ignored. Mintlify also auto-ignores `.git`, `.github`, `.claude`, `node_modules`, `README.md`, `LICENSE.md`, `CONTRIBUTING.md`.

**`AGENTS.md`** — Mintlify's agent instructions file (separate from this CLAUDE.md). Contains style preferences: active voice, second person, sentence case headings, bold for UI elements, code formatting for file/command references.

## Key Conventions

- Page paths in `docs.json` omit the `.mdx` extension
- Cannot use `api` as a top-level folder name (Next.js reserves it); use `api-reference` instead
- Folder-based routing: `your-folder/your-page.mdx` maps to `/your-folder/your-page`
- API docs are generated from `api-reference/openapi.json` (OpenAPI spec)
- Deployment is automatic via Mintlify GitHub app on push to default branch
