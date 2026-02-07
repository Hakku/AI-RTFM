---
type: project_document
title: AI-RTFM Tech Stack
owner: @hakku
created: 2026-02-06
last_updated: 2026-02-06
status: active
---

# AI-RTFM Tech Stack

> Locked dependencies. No additions without explicit approval.

## Documentation Format

| Tool | Version | Purpose |
|------|---------|---------|
| Markdown | CommonMark spec | All documentation files |
| YAML frontmatter | — | Document metadata |

## Tooling

| Tool | Version | Purpose |
|------|---------|---------|
| PowerShell | 7+ | Validation scripts (search.ps1, stale-finder.ps1) |
| Git | 2.x | Version control |
| GitHub | — | Remote repository (Hakku/AI-RTFM) |

## AI

| Tool | Version | Purpose |
|------|---------|---------|
| Claude Code | Claude Opus 4.6 | Primary development AI |
| PRISM Kernels | 12 kernels | Structured AI prompts for documentation |

## Standards

| Standard | Purpose |
|----------|---------|
| llms.txt | AI-readable documentation index |
| Tag taxonomy | Controlled vocabulary (standards/tag-taxonomy.md) |
| Style guide | Writing standards (standards/style-guide.md) |
| Review process | Quality gates (standards/review-process.md) |

## Roadmap Items (Not Yet Adopted)

| Tool | Phase | Notes |
|------|-------|-------|
| Prompt generator UI | Phase 4 | Web-based or local tool for creating PRISM prompts |
| Multi-model support | Phase 5 | Model-agnostic prompt versioning |
| Rendered docs site | Future | Currently raw markdown only |

## Constraints

- All scripts must be PowerShell 7+ compatible
- All documentation must be valid CommonMark
- No external dependencies beyond what's listed above
- Document size limit: ~400 lines per file
