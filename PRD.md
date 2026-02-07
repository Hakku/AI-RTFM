---
type: project_document
title: AI-RTFM Product Requirements Document
owner: @hakku
created: 2026-02-06
last_updated: 2026-02-06
status: active
---

# AI-RTFM Product Requirements Document

## Problem Statement

IT documentation is scattered, outdated, and unfindable. Procedures live in random Google Docs, troubleshooting steps rot in Confluence, incident reports decay in email threads. When a busy IT professional has 10 minutes before the next ticket, they either write bad docs, copy-paste old ones (accumulating cruft), or skip documentation entirely. Generic AI prompts produce inconsistent, embarrassing output that still requires heavy editing.

## One-Sentence Summary

AI-RTFM gives corporate IT teams a standard folder structure, AI-powered writing prompts (PRISM Kernels), and a process layer so one person can produce professional documentation in minutes instead of hours.

## What AI-RTFM Is

A **documentation toolkit** for corporate IT teams, consisting of three components:

1. **Standard folder structure and templates** — 12 document types with consistent structure, frontmatter, and naming conventions
2. **AI-powered writing acceleration (PRISM Kernels)** — Structured prompts that make AI produce professional-quality docs on the first try
3. **Process layer** — Naming conventions, review workflow, maintenance cycles, deprecation rules, and tag taxonomy

**AI-RTFM** is the project/product name. **PRISM KERNEL** is the methodology (Purpose, Rules, Identity, Structure, Motion).

## Target Users

- **Primary:** Busy IT professional with 10 minutes before the next ticket — knows systems, can't write well, time-pressured
- **Secondary:** Senior engineers — reviews docs, benefits from consistent input quality
- **Expansion:** Any technical team where writing is the bottleneck, not knowledge

## Creator Context

HassiumX: IT admin at Luhta (1000+ users), side IT business, AI power user. Building AI-RTFM to solve a real problem encountered daily. Finnish company, global operations.

## Features

### Component 1: Folder Structure and Templates
- **12 templates** — techdoc, incident, adr, kb, change, onboard, api, security, compliance, iac, dr, concept
- **YAML frontmatter** — standardized metadata on every document
- **Folder conventions** — runbooks/, incidents/, adr/, kb/ with defined naming patterns

### Component 2: AI Writing Acceleration
- **12 PRISM Kernels** — one per document type, structured prompts following Purpose/Rules/Identity/Structure/Motion pattern
- **Hashtag activation** — #techdoc, #incident, #adr etc. via AI Custom Instructions
- **Copy-paste fallback** — works without setup by pasting full kernel into any AI chat

### Component 3: Process Layer
- **Style guide** — writing conventions for technical documentation
- **Review process** — quality gates and approval workflow
- **Tag taxonomy** — controlled vocabulary for document classification
- **Maintenance cycles** — 30-day review for active docs, stale detection tooling

### Tooling
- **search.ps1** — tag-based documentation search, incomplete frontmatter detection
- **stale-finder.ps1** — finds outdated documents based on review cycles
- **llms.txt** — AI-readable documentation index

### Training
- **DEMO.md** — 15-minute demonstration
- **ONBOARDING.md** — step-by-step learning path (1-2 hours)
- **WORKSHOP.md** — hands-on group training (2 hours)
- **QUICK-REFERENCE.md** — cheat sheet for daily use

## Success Criteria

1. **First-draft quality:** docs produced with kernels require minimal revision before publishing
2. **Speed:** engineer documents a system in ~10 min that would take 2+ hours freehand
3. **Reviewer burden:** senior engineers stop rewriting junior docs; reviews become approvals
4. **Repeat use:** engineers who try it once keep using it (tool is faster than alternatives)

## Known Issues

- **Prompts are weak** — PRISM Kernels need proper redesign; current versions don't reliably produce usable first drafts
- **Over-engineered meta layer** — ~25 project management files managing ~30 deliverable files; needs tightening
- **Direction must be tightening, not expanding** — resist feature creep, improve what exists before adding new capabilities
- **Core must stay simple** — if it feels over-engineered, it is

## Scope

### In Scope
- Kernels, templates, standards for IT Operations documentation
- PowerShell search and stale-detection tooling
- Training materials for team adoption
- AI discoverability (llms.txt)

### Roadmap
1. **Redesign PRISM prompts** — fix the weakest link (current priority)
2. **Build prompt generator with UI** — make prompt creation accessible
3. **Model-agnostic/versioned prompts** — multi-model support
4. **Self-improving prompt library** — eventually production app at Luhta

> Detailed step breakdown will come after interrogation phase completes.

### Out of Scope
- Rendered documentation site (raw markdown only, for now)
- Content reuse mechanism (DITA-style includes/snippets)
- Multi-language kernel variants
- Company-wide governance framework (IT Ops adoption first)

## Non-Goals

**AI-RTFM is a documentation toolkit, not:**

- **A knowledge management system** — doesn't decide what to document, track coverage, or manage knowledge lifecycle
- **A migration tool** — structures new docs, doesn't fix old ones
- **A training program** — users don't learn to write better; they use prompts that bypass the skill gap
- **An organizational change agent** — won't fix documentation culture; just makes writing faster for those who use it
- **Enterprise CCMS** — not competing with DITA, Paligo, or content reuse systems

> Note: The roadmap includes a production app with UI. "No platform" is a current constraint, not a permanent non-goal.

## Working Rules

From the context package — these override defaults:

- **Keep it simple** — if it feels over-engineered, it is
- **Templates encode real practices** — not theoretical ideals
- **Prompts must produce usable first drafts** — if they don't, the prompts are broken
- **Optimize for the 10-minute user** — every feature must justify itself against "does this help someone with 10 minutes?"

## Language Strategy

- **System files:** English (kernels, templates, training, standards)
- **Output documents:** Finnish (teams create in their working language)
- **Future:** Multi-language support via `language:` frontmatter field
- **Rationale:** Finnish company, global operations. System scales globally, outputs serve local teams.
