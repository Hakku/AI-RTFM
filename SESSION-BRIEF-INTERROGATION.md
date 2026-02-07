# Session Brief: AI-RTFM Interrogation

> Start next session by reading this file. Use `/interrogation` skill to run the process.

## Context

AI-RTFM started as a documentation toolkit. The roadmap now includes building a production application (Prompt Generator UI). Phase 1 context re-alignment happened (2026-02-06): PRD rewritten with three-component framing, creator context received, new roadmap established.

**Core identity (confirmed):** AI-RTFM = documentation toolkit with three components:
1. Folder structure + templates
2. AI prompts (PRISM kernels)
3. Process layer

**What changed:** Production app is on the roadmap. The project is expanding from "toolkit you copy-paste" to "application you interact with."

## What's Already Answered

From Phase 1 context re-alignment:
- **What IS AI-RTFM?** → Three-component documentation toolkit for IT Operations
- **Who uses it?** → IT Operations teams initially, expanding company-wide
- **What's the job?** → "Write docs you're not embarrassed by, fast" (from JTBD session — needs validation)
- **Prompts are weak** → Creator assessment, highest priority to fix
- **10-minute user** → Time target tightened from 30 to 10 minutes
- **New roadmap:** 1) Redesign PRISM prompts, 2) Build prompt generator UI, 3) Model-agnostic/versioned prompts, 4) Self-improving prompt library

## Architecture Review Findings (2026-02-07)

Full architecture review completed before interrogation. Key findings that interrogation must address:

### Kernel Architecture (CRITICAL — core product)
- **Kernels are too thin:** ~15 lines of vague rules per kernel. No few-shot examples, no negative examples, no output format spec, no self-check criteria. This is likely why they feel "weak."
- **All 12 kernels in one 482-line file:** Can't version independently, can't test individually, can't compose (e.g., techdoc + security). Kernel cascade (edit one → update 5 files) is manual and error-prone.
- **Template-kernel-example triangle is disconnected:** Kernel STRUCTURE doesn't explicitly match template sections. Only 4 of 12 types have golden examples.
- **Hashtag activation is fragile:** Custom Instructions can't hold all 12 kernel definitions. The AI is told "apply the corresponding kernel" without actually having the kernel content. Full-kernel-paste works better but is clunky.
- **Kernel composition model needed for UI:** Instead of 12 monolithic kernels, consider composable layers: base + doc-type + audience-modifier + output-language. This scales without creating N x M combinations.

### Tooling Gaps
- **search.ps1 and stale-finder.ps1 only search 4 of 12 content directories** (runbooks, incidents, adr, kb). 8 doc types are invisible to tooling.
- **No frontmatter validation tool.** review-process.md references `./scripts/validate-frontmatter.sh` which doesn't exist.
- **No bootstrapping script** for new teams adopting the toolkit.

### Content Issues
- **Example docs have 5 broken cross-references** (deploy-to-production.md links to non-existent files)
- **Standards have placeholder dates** (`YYYY-MM-DD` in style-guide.md and review-process.md)
- **llms.txt filename bug** (links to `2024-10-15-database-outage.md`, document describes 2026 event)
- **Tag taxonomy contains fictional systems** (order-service, payment-service — from examples, not real infrastructure)
- **README has placeholder references** (support@company.com, [repo-link])

### Scalability Concerns
- **30-day universal review cycle unsustainable:** 100 docs = 3+ reviews/day. Needs tiered cycles (critical: 30d, standard: 90d, stable: on-change-only).
- **2,059 lines of training material** for a system targeting "10-minute users." Learning overhead is 5-10x usage time.
- **No quality feedback loop:** No mechanism to measure kernel output quality, track usage, capture user feedback, or A/B test variations.
- **No offline resilience:** Without AI access, the system provides zero acceleration beyond raw templates.

### Platform Risk
- Works with ChatGPT/Claude Custom Instructions. Doesn't work with Copilot, Cursor, local models, or enterprise AI platforms.
- Model behavior changes can silently break kernels. No detection mechanism.

## Questions Still Open

### Prompt Redesign (Roadmap Phase 1)
- What specifically is wrong with the current prompts? (concrete examples of bad output needed)
- What does "good output" look like for each kernel type?
- What's the gap between current output and desired output?
- Which kernels are used most? Which are never used?
- What context does the user typically provide to the AI?
- Should kernels include few-shot examples of good/bad output?
- Should kernels be split into per-type directories?
- Should kernels be composable (base + type + audience + language)?

### Prompt Generator UI (Roadmap Phase 2)
- What does the Prompt Generator UI do specifically?
- Who uses the UI vs who uses raw markdown templates?
- What's the interaction model? (form-based? wizard? chat?)
- What data does the app need? Where does it come from?
- How does the app relate to the existing toolkit?
- Does the UI generate prompts, documents, or both?
- What happens to the output? (copy to clipboard? export? save?)
- Does the UI assemble kernels from composable pieces?

### Tech Stack (for the application)
- What's the tech stack for the app?
- Where will it be hosted?
- Authentication needed? Who has access?
- Does it need a database? What for?

### Organizational
- Who decides what "good documentation" looks like?
- How is AI-RTFM currently deployed to teams?
- What's the adoption status? Who uses it today?
- What blocked wider adoption so far?

### Architecture Decisions (from review — need user input)
- Should tools be expanded to search all content directories?
- Should golden examples be created for all 12 types?
- Should review cycles be tiered by document criticality?
- Should training materials be consolidated?
- Should the tag taxonomy be stripped of fictional/example-specific systems?
- What platforms must kernels work with? (ChatGPT, Claude, Gemini, Copilot, local models?)

## Process

1. Run `/interrogation` skill
2. Work through open questions above (and any the interrogation surfaces)
3. When complete, run `/doc-generation` to produce/update canonical docs

## Deliverables

After interrogation is complete:
1. **Validated definition** of what AI-RTFM is (confirm or revise)
2. **Prompt redesign requirements** — specific enough to execute
3. **Application requirements** — specific enough to design
4. **Updated canonical docs** via `/doc-generation`

## Files to Review First

1. This file (you're reading it)
2. `progress.txt` — session state
3. `lessons.md` — what we've learned
4. `PRD.md` — current product definition
