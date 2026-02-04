# AI-RTFM Product Requirements Document

## Overview

AI-RTFM is a PRISM KERNEL documentation system for IT Operations. It provides structured AI prompts (kernels) and templates that produce consistent, high-quality technical documentation.

**Why:** Documentation is the #1 bottleneck in IT operations scaling. Teams write inconsistently, knowledge lives in heads, and AI-generated docs are unreliable without structure. AI-RTFM solves this with pre-optimized prompts that enforce quality standards.

## Target Users

- **Primary:** IT Operations teams (infrastructure, service desk, security)
- **Expansion:** Company-wide (all teams producing technical documentation)
- **Personas:** Engineers writing runbooks, incident responders documenting post-mortems, architects recording decisions, onboarding leads creating guides

## Features

### Core System
- **12 PRISM Kernels** — Structured AI prompts for IT documentation types (techdoc, incident, adr, kb, change, onboard, api, security, compliance, iac, dr, concept)
- **12 Matching Templates** — Markdown templates with frontmatter, one per kernel
- **Standards** — Style guide, review process, tag taxonomy

### Tooling
- **search.ps1** — Tag-based documentation search, incomplete frontmatter detection
- **stale-finder.ps1** — Finds outdated documents based on review cycles
- **llms.txt** — AI-readable documentation index

### Training
- **DEMO.md** — 15-minute demonstration
- **ONBOARDING.md** — Step-by-step learning path (1-2 hours)
- **WORKSHOP.md** — Hands-on group training (2 hours)
- **QUICK-REFERENCE.md** — Cheat sheet for daily use

## Success Criteria

1. IT Ops team adopts AI-RTFM for all new documentation
2. Documentation consistency measurably improves (fewer format variations)
3. Time-to-document decreases (junior engineers can produce docs without asking for help)
4. System scales to at least one additional team beyond IT Ops

## Scope

### In Scope
- Kernels, templates, standards for IT Operations documentation
- PowerShell validation and search tooling
- Training materials for team adoption
- AI discoverability (llms.txt)
- Phase 3 automation (validation, git hooks)
- Phase 4 intelligence (RAG prep, MCP integration)

### Out of Scope
- Rendered documentation site (raw markdown only, for now)
- Content reuse mechanism (DITA-style includes/snippets)
- Multi-language kernel variants
- Company-wide governance framework (IT Ops adoption first)
- Application UI/frontend

## Non-Goals

- Replacing existing documentation — AI-RTFM structures new documentation, doesn't migrate old docs
- Enforcing a single writing style — kernels guide, they don't restrict creativity
- Building a documentation platform/app — this is a methodology + file system, not software
- Competing with enterprise CCMS tools (DITA, Paligo) — different weight class

## Language Strategy

- **System files:** English (kernels, templates, training, standards)
- **Output documents:** Finnish (teams create in their working language)
- **Future:** Multi-language support via `language:` frontmatter field
- **Rationale:** Finnish company, global operations. System scales globally, outputs serve local teams.
