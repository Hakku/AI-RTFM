# Learnings

> Categories: `correction` `quality_issue` `knowledge_gap` `source_issue` `discovery`

Add entries when you learn something worth remembering. Keep it simple.

---

## 2026-01-29: discovery

Deep exploration revealed system is ~80% ready but has 3 critical blockers:
1. Language inconsistency (Finnish/English mixed)
2. Path references broken (`docs/` doesn't exist)
3. Kernel syntax unreliable for copy-paste

Key insight: Kernel simplification CANNOT be done in isolation — all training materials reference old format. Must update simultaneously or training demos break.

Project management files were generic scaffolding. Now contain actual project state and domain knowledge.

---

## 2026-01-29: decision

Language strategy resolved: English for system, Finnish for outputs.

Separating these allows the framework to scale globally while outputs serve local Finnish teams. The kernels don't care — they produce whatever language you prompt them in.

---

## 2026-01-29: discovery

**PRISM KERNEL anatomy** — 5 components that make prompts reproducible:
- PURPOSE: Single sentence goal
- RULES: Constraints as bullet list
- IDENTITY: Voice/perspective
- STRUCTURE: Section flow (A → B → C)
- META: Format requirements, quality test

Hashtag activation (#techdoc) works only if AI has Custom Instructions configured. Without that, must copy full kernel.

---

## 2026-01-29: discovery

**Two-layer architecture** emerged:
1. **Project management** (context.md, memory.md) — session state, decisions, learnings
2. **Documentation system** (templates, kernels, standards) — the actual product

These serve different purposes: layer 1 helps Claude maintain continuity across sessions; layer 2 is what users actually use.

---

## 2026-01-29: quality_issue

**Over-engineering pattern**: Original kernel syntax used unicode decorators (`///▙▖▙▖`, `P::`, `R::`) for visual appeal. Failed in practice — copy-paste broke formatting, some terminals mangled characters.

Fix: Plain English headers (`# KERNEL:`, `PURPOSE:`, `RULES:` with bullets). Less pretty, 100% reliable.

Lesson: Aesthetics must not compromise function. If it can't survive copy-paste, it's broken.

---

## 2026-01-29: correction

**Fresh-eyes review catches accumulated drift.** Issues invisible to creator:
- Mixed languages (evolved organically)
- Dead references to non-existent files (aspirational planning)
- Broken paths (copy-paste from old structure)

Process fix: Before release, have someone unfamiliar review with explicit "find obvious bugs" mandate.

---

## 2026-01-29: discovery

**Industry landscape research** — PRISM is a valid approach, positioned as a domain-specific prompt library.

Comparable systems:
- **Generic frameworks**: RASCEF (Role/Action/Steps/Context/Examples/Format), CIDI (Context/Instructions/Details/Input), Chain-of-Thought
- **Enterprise tools**: Sourcegraph Prompt Library, Wharton AI Labs prompt collection
- **Structured docs**: DITA/LwDITA (heavyweight XML), docs-as-code (Git + SSG)

PRISM differentiator: **Pre-optimized for IT documentation** with runbook, incident, ADR patterns built-in. Most prompt libraries are generic.

---

## 2026-01-29: discovery

**Key industry stats (2025-2026)**:
- 64% of developers use AI for documentation (Google DORA)
- 24.8% mostly AI, 27.3% partially AI for docs (Stack Overflow 2025)
- 75% predicted to use MCP servers by 2026

Trend: Moving from "AI as writing assistant" → "Agentic AI managing entire documentation workflows"

---

## 2026-01-29: discovery

**Emerging standards to watch**:

1. **llms.txt** (Sept 2024, Jeremy Howard/Answer.AI)
   - Markdown file at `/llms.txt` for AI-readable site documentation
   - Purpose: Help LLMs index content efficiently (like sitemap for AI)
   - Two files: `/llms.txt` (overview ~5K tokens) + `/llms-full.txt` (comprehensive ~1M tokens)

2. **Model Context Protocol (MCP)** (Anthropic)
   - Open standard for AI-to-system integration
   - Allows AI to pull real-time info from APIs, databases, configs
   - Enables auto-updating documentation when systems change

llms.txt = helps AI "read" better. MCP = helps AI "act" effectively.

---

## 2026-01-29: knowledge_gap

**PRISM gaps identified vs. industry best practices**:

| Gap | Industry Solution | Priority |
|-----|-------------------|----------|
| No validation | CI/CD hooks, frontmatter linting | HIGH |
| No AI indexing | llms.txt standard | MEDIUM |
| Manual updates only | MCP integration for real-time | FUTURE |
| No usage metrics | Analytics, ticket correlation | MEDIUM |
| Single audience | Audience-adaptive content | FUTURE |

---

## 2026-01-29: discovery

**Enhancement roadmap** (from research):

**Phase 1 - Hardening** (current)
- ✅ Language standardization
- ✅ Kernel simplification
- ⬜ Frontmatter validator script

**Phase 2 - Discoverability**
- Add `/llms.txt` for AI consumption
- Tag taxonomy standardization
- Search/index tooling

**Phase 3 - Automation**
- CI/CD integration (lint on PR)
- Git hooks for quality enforcement
- Review cycle reminders

**Phase 4 - Intelligence**
- MCP integration for real-time system docs
- Agentic workflows (auto-detect outdated docs)
- Usage analytics (which docs reduce tickets?)

---

## 2026-01-30: discovery

**Phase 2 execution pattern**: Tasks with no dependencies can run in parallel. Created 8 tasks, executed in waves:
- Wave 1: #8 (taxonomy) + #10 (llms.txt design) — parallel, no deps
- Wave 2: #9, #12, #13, #14 — parallel after #8 complete
- Wave 3: #11 — after #9 + #10
- Wave 4: #15 — validation gate

Total execution: ~30 minutes for full phase. Parallelization matters.

---

## 2026-01-30: quality_issue

**PowerShell variable naming**: Variable `$incomplete` collided with `-Incomplete` switch parameter, causing runtime error. PowerShell interprets assignment to parameter-named variables as parameter usage.

Fix: Renamed to `$incompleteDocs`. Lesson: Avoid variable names matching parameter names in PowerShell scripts.

---

## 2026-01-30: correction

**Session handoff discipline**: Context files (context.md, memory.md, CLAUDE.md) must be updated BEFORE ending session. Stale context = confused next session. Added explicit "update persistent files" step to session close.

---
