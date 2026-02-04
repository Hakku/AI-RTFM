# AI-RTFM Memory

> Persistent knowledge. Update when you learn something worth remembering.
> Last updated: 2026-02-04

## Findings

### PRISM Methodology
- Structure: Purpose → Rules → Identity → Structure → Meta
- Kernels activated via hashtags (#techdoc, #incident, etc.)
- Syntax: Plain English headers (# KERNEL:, PURPOSE:, RULES: with bullets)
- 12 kernels in kernels/it-ops-kernels.md

### Project Architecture
- **Two layers:** Project management (context.md, memory.md) vs documentation system (templates, kernels)
- Project-init workflow manages development; PRISM manages documentation output

### File Relationships
```
README.md (entry point)
├─→ ONBOARDING.md (learning path)
├─→ DEMO.md (15-min demo)
├─→ WORKSHOP.md (2-hour training)
├─→ QUICK-REFERENCE.md (cheat sheet)
├─→ templates/* (12 document types)
├─→ standards/* (3 guides)
└─→ kernels/it-ops-kernels.md (12 kernels)
```

### Kernel-Template Mapping
| Kernel | Template | Output Location |
|--------|----------|-----------------|
| #techdoc | techdoc-template.md | runbooks/ |
| #incident | incident-template.md | incidents/ |
| #adr | adr-template.md | adr/ |
| #kb | kb-template.md | kb/ |
| #api | api-template.md | (custom) |
| #change | change-template.md | (ticket system) |
| #onboard | onboard-template.md | (custom) |
| #security | security-template.md | (custom) |
| #compliance | compliance-template.md | (custom) |
| #iac | iac-template.md | (custom) |
| #dr | dr-template.md | (custom) |
| #concept | concept-template.md | (custom) |

### Training Flow
1. DEMO.md (15 min) — See it work
2. ONBOARDING.md (1-2 hours) — Learn step-by-step
3. WORKSHOP.md (2 hours) — Hands-on practice

### User Journey
Copy template → Activate kernel (#hashtag) → Paste AI output → Fill frontmatter → Review → Publish

### Project Vision
- **Current:** IT Operations team documentation
- **Goal:** Company-wide documentation platform
- **Phases:** Establish basics → Simplify kernels → Expand kernel types → Add tooling → Training program

## Patterns

### What Works
- Production examples (incident, ADR, runbook) prove system works
- PRISM structure produces consistent output
- Multi-entry-point training accommodates different learning styles

### What Doesn't Work (Fixed)
- ~~Unicode kernel syntax~~ → Simplified to plain English
- ~~Mixed language~~ → English for system, Finnish for outputs (including standards/)
- ~~Path references with `docs/` prefix~~ → Now use root-relative paths
- ~~Finnish content in standards/ files~~ → Translated to English (2026-02-04)
- ~~Broken markdown in review-process.md~~ → Stray ``` removed
- ~~Non-existent kernel references (#outline, #edit) in README~~ → Replaced with real kernels
- ~~5 kernels without templates~~ → Created onboard, security, compliance, iac, dr, concept templates (2026-02-04)
- ~~llms.txt wrong kernel list~~ → Corrected and updated with all 12 templates (2026-02-04)
- ~~No Explanation/Concepts doc type~~ → Added #concept kernel and concept-template.md (2026-02-04)
- ~~Inconsistent review cycles~~ → Standardized to 30 days for active docs (2026-02-04)
- ~~Example docs dated 2024~~ → Updated to 2026 dates (2026-02-04)

### Language Strategy
- **System files** (kernels, templates, training, standards) → English
- **Output examples** (runbooks, incidents, KB articles) → Finnish OK
- **Future:** Multi-language support planned. Add `language:` field to frontmatter, language-aware kernels.
- Rationale: Finnish company, global operations. System scales globally, outputs serve local teams.

### Anti-Patterns to Avoid
- Editing kernels without updating all dependent files
- Using `docs/` prefix in paths (files are at root)
- Writing system files in Finnish (use English for scalability)
- Creating tags not in standards/tag-taxonomy.md
- Referencing kernels that don't exist (e.g., #outline, #edit) — only use kernels defined in kernels/it-ops-kernels.md

### Phase 2 Deliverables (Discoverability)
- `/llms.txt` — AI-readable documentation index
- `standards/tag-taxonomy.md` — controlled vocabulary for tags
- `tools/search.ps1` — tag-based doc queries, incomplete check
- `tools/stale-finder.ps1` — find outdated docs

## Industry Alignment (2026-02-04)

### Frameworks Evaluated
- **Diátaxis** — 4 doc types: Tutorials, How-to, Reference, Explanation
- **DITA** — Modular topic-based authoring with content reuse (conrefs, keyrefs)
- **The Good Docs Project** — Open-source templates with writing guides
- **Docs-as-code** (Stripe/Twilio/GitLab) — Markdown + Git + CI/CD + rendered site

### Where AI-RTFM Aligns ✅
- Docs-as-code: Markdown, Git, templates (Stripe/Twilio pattern)
- Topic-based authoring: one doc per topic (DITA principle)
- AI-assisted writing: PRISM kernels are more structured than typical prompt libraries
- llms.txt: early adopter of AI-readability standard
- Tag taxonomy: controlled vocabulary (DITA metadata principle)
- Style guide + review process: governance basics in place
- Multi-entry training: Demo → Onboarding → Workshop (industry best practice)

### Gaps Identified
1. ~~**No "Explanation/Concepts" doc type**~~ ✅ FIXED (2026-02-04) — Added #concept kernel and concept-template.md
2. **No content reuse mechanism** — DITA's core strength. No way to share content chunks across docs. Important for multi-language future.
3. ~~**5 kernels without templates**~~ ✅ FIXED (2026-02-04) — Created onboard, security, compliance, iac, dr templates
4. ~~**llms.txt lists wrong kernels**~~ ✅ FIXED (2026-02-04) — Corrected kernel list, added all templates
5. **No prompt versioning metadata** — Industry uses version numbers, effectiveness tracking, model targeting per prompt. PRISM kernels have changelog but no per-kernel versioning.
6. **No rendered docs site** — Industry standard is to publish to a site (Stripe→Markdoc, Twilio→Next.js+MDX). Raw markdown only.
7. **Templates lack writing guides** — Good Docs Project ships a writing guide alongside each template. Kernels partially fill this role but aren't co-located with templates.

### Industry Patterns to Adopt
- **Prompt versioning:** Add version, last-tested-model, effectiveness-notes to kernel metadata
- ~~**Explanation doc type:**~~ ✅ Done — #concept kernel + concept-template.md added
- **Template writing guides:** Co-locate brief writing guidance with each template (or reference the kernel)
- **Content reuse:** Evaluate lightweight include/snippet mechanism for shared content
- **Frontmatter schema:** Define JSON schema for frontmatter validation (industry standard for automated checks)

## Preferences (2026-02-04)

### Validation & Tooling
- **Tooling:** PowerShell (consistent with existing search.ps1, stale-finder.ps1)
- **Validation level:** Full — frontmatter, markdown lint, link check, style, stale detection
- **FAIL (block merge):** Missing/invalid frontmatter, broken internal links, >400 lines
- **WARN (advisory):** Style deviations, external link issues, missing tags
- **CI/CD platform:** Deferred — not ready yet

### AI Integration
- **Prompt library:** Full coverage — review/QA, maintenance, and analysis prompts
- **Prompt location:** `kernels/` with subdirectories: `kernels/content/`, `kernels/review/`, `kernels/maintenance/`, `kernels/analysis/`
- **RAG:** Prepare all documentation (not just operational docs)
- **MCP:** Phase 4 scope, not yet

### Content Architecture
- **Document size:** Strict max ~400 lines. Split larger docs.
- **Frontmatter enrichment:** Full semantic set for RAG readiness:
  - `audience:` [end-users | admins | developers]
  - `complexity:` [basic | intermediate | advanced]
  - `dependencies:` [related systems/tools]
  - `keywords:` [beyond tags, for search/RAG]
  - `summary:` [1-line description for RAG snippets]
- **Language field:** Add `language:` to frontmatter (multi-language future)

### Governance & Ownership
- **Ownership model:** Team-based (`@team-name` format, e.g., @infra-ops, @service-desk)
- **Company-wide governance:** Too early — focus on IT Ops adoption first
- **Framework review cycle:** On change only (not scheduled)

## Repository

- **Remote:** https://github.com/Hakku/AI-RTFM
- **Branch:** main
- **First push:** 2026-02-04 (36 files, full system)

## Vocabulary

| Term | Meaning |
|------|---------|
| Kernel | AI prompt following PRISM structure |
| PRISM | Purpose, Rules, Identity, Structure, Motion |
| Frontmatter | YAML metadata at top of documents |
| Active/Draft | Document status (published vs work-in-progress) |
