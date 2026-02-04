# AI-RTFM Product Requirements Document

## Problem Statement

Mid-level IT engineers know their systems but struggle to write documentation. Generic AI prompts produce inconsistent, embarrassing output. Under time pressure, engineers either write bad docs, copy-paste old ones (accumulating cruft), or skip documentation entirely. AI-RTFM provides structured prompts that make AI produce professional-quality docs on the first try—so engineers can document quickly without the result looking like amateur hour.

## Job to Be Done

**When** a mid-level IT engineer needs to document something and doesn't have time to struggle with writing,
**they want** structured prompts that make AI produce professional output immediately,
**so they can** ship docs they're not embarrassed by, fast.

### What AI-RTFM Is NOT Hired For

- **Knowledge management strategy** — AI-RTFM doesn't decide what to document
- **Writing skill development** — Users don't learn to write better; they bypass the skill gap
- **Documentation culture change** — AI-RTFM is a tool, not an organizational intervention

### Impact Map

```
GOAL: Write docs you're not embarrassed by, fast
  │
  ├── ACTOR: Mid-level engineer (primary)
  │     ├── IMPACT: Produces professional output without writing skill
  │     │     └── DELIVERABLE: PRISM kernels (structured prompts)
  │     ├── IMPACT: Knows what sections to include without guessing
  │     │     └── DELIVERABLE: Templates with standard structure
  │     └── IMPACT: Gets consistent results every time
  │           └── DELIVERABLE: Pre-tested prompts that work reliably
  │
  └── ACTOR: Senior engineer (reviewer)
        └── IMPACT: Spends less time rewriting junior docs
              └── DELIVERABLE: Kernels that front-load quality requirements
```

## Target Users

- **Primary:** Mid-level IT engineers — knows systems, can't write well, time-pressured
- **Secondary:** Senior engineers — reviews docs, benefits from consistent input quality
- **Expansion:** Any technical team where writing is the bottleneck, not knowledge

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

1. **First-draft quality:** Docs produced with kernels require minimal revision before publishing
2. **Speed:** Engineer documents a system in <30 min that would take 2+ hours freehand
3. **Reviewer burden:** Senior engineers stop rewriting junior docs; reviews become approvals
4. **Repeat use:** Engineers who try it once keep using it (tool is faster than alternatives)

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

**AI-RTFM is a writing tool, not:**

- **A knowledge management system** — Doesn't decide what to document, track coverage, or manage knowledge lifecycle
- **A documentation platform** — No UI, no rendering, no hosting. Methodology + files only
- **A migration tool** — Structures new docs, doesn't fix old ones
- **A training program** — Users don't learn to write better; they use prompts that bypass the skill gap
- **An organizational change agent** — Won't fix documentation culture; just makes writing faster for those who use it
- **Enterprise CCMS** — Not competing with DITA, Paligo, or content reuse systems

## Language Strategy

- **System files:** English (kernels, templates, training, standards)
- **Output documents:** Finnish (teams create in their working language)
- **Future:** Multi-language support via `language:` frontmatter field
- **Rationale:** Finnish company, global operations. System scales globally, outputs serve local teams.
