# AI-RTFM Context

> Last updated: 2026-02-04 (session 2)

## What

PRISM KERNEL documentation system for IT Operations. Goal: team adoption → company-wide platform.

## Current State

**Phase:** Phase 2 complete — all MEDIUM issues resolved, pushed to GitHub

**Readiness:**
- ✅ Templates (12 types) — production-ready
- ✅ Standards (3 guides) — complete
- ✅ Examples (4 docs) — production-quality, dates current
- ✅ Kernels (12 IT-ops) — simplified to plain English format
- ✅ Path references — FIXED
- ✅ Language — English (all system files converted, including standards/)
- ✅ Training materials — converted to English (DEMO, ONBOARDING, kernels/README)
- ✅ Discoverability — llms.txt, tag taxonomy, search tools
- 🟡 Automation — partial (search/stale-finder scripts, no CI/CD hooks yet)

## Blockers

| Blocker | Blocks | Owner | Status |
|---------|--------|-------|--------|
| ~~Path reference fixes~~ | ~~Team rollout~~ | — | ✅ DONE |
| ~~Kernel simplification~~ | ~~Training reliability~~ | — | ✅ DONE |
| ~~System language conversion~~ | ~~Consistent training materials~~ | — | ✅ DONE |

## Decisions

| What | Decision | Date |
|------|----------|------|
| Language | English (system), Finnish (outputs), multi-language future | 2026-01-29 |
| Scope | Team resource → company-wide | 2026-01-29 |
| Audience | IT Operations (expanding later) | 2026-01-29 |
| Kernels | Version-controlled, shared | 2026-01-29 |
| Two-layer architecture | Project mgmt separate from doc system | 2026-01-29 |
| Kernel simplification | Plan parked, execute later | 2026-01-29 |
| Validation tooling | PowerShell, full checks (frontmatter, lint, links, style, stale) | 2026-02-04 |
| Validation severity | FAIL: frontmatter/internal links/>400 lines. WARN: style/external links/tags | 2026-02-04 |
| CI/CD platform | Deferred — not ready yet | 2026-02-04 |
| Prompt library | Full (review, maintenance, analysis) in kernels/ subdirectories | 2026-02-04 |
| RAG preparation | All documentation, full semantic frontmatter enrichment | 2026-02-04 |
| MCP | Phase 4 scope | 2026-02-04 |
| Doc size limit | Strict max ~400 lines | 2026-02-04 |
| Ownership model | Team-based (@team-name format) | 2026-02-04 |
| Frontmatter enrichment | audience, complexity, dependencies, keywords, summary, language | 2026-02-04 |
| Framework review cycle | On change only (not scheduled) | 2026-02-04 |
| Company-wide governance | Too early — IT Ops adoption first | 2026-02-04 |
| Review cycles | 30 days for active ops docs; incident=once, ADR=on-change, change=lifecycle | 2026-02-04 |
| Concept doc type | #concept kernel + concept-template.md (Diátaxis Explanation quadrant) | 2026-02-04 |

## Open Questions

- ~~Kernels location: keep in `kernels/` or rename?~~ → Keep `kernels/`, expand with subdirectories (content/, review/, maintenance/, analysis/)
- ~~CI/CD integration: Which pipeline? GitLab CI? GitHub Actions?~~ → Deferred
- ~~MCP integration: Scope and timeline?~~ → Phase 4, scope TBD
- ~~Add "Explanation/Concepts" doc type?~~ → Done (#concept kernel + concept-template.md)
- Content reuse mechanism? (DITA pattern — includes/snippets for shared content)
- Rendered docs site? (Stripe/Twilio pattern — currently raw markdown only)

## Vision (from research)

**Phase 1 - Hardening** ✅ DONE
**Phase 2 - Discoverability** ✅ DONE
**Phase 3 - Automation** (CI/CD, hooks, reminders)
**Phase 4 - Intelligence** (MCP, agentic workflows, analytics)

## Known Issues (Prioritized)

### HIGH
1. ~~Path references use `docs/` prefix but files are at root~~ ✅ FIXED
2. ~~System files need English conversion (README, ONBOARDING, DEMO)~~ ✅ FIXED
3. ~~Kernel syntax unreliable for copy-paste~~ ✅ FIXED (simplified to plain English)

### MEDIUM
4. ~~Training materials incomplete (~80%)~~ ✅ VERIFIED COMPLETE (2026-02-04)
5. ~~No frontmatter validator script~~ ✅ search.ps1 -Incomplete
6. ~~Missing kernels: content-kernels.md, dev-kernels.md~~ Removed stale references; these are future scope if needed
7. ~~No Git hooks for quality enforcement~~ Deferred with CI/CD platform decision
8. ~~Example docs have dated metadata (2024 dates)~~ ✅ FIXED (2026-02-04) — Updated to 2026 dates
10. ~~Review cycle timing inconsistent between files~~ ✅ FIXED (2026-02-04) — Standardized to 30 days for active docs
11. ~~**llms.txt lists wrong kernels**~~ ✅ FIXED (2026-02-04) — Corrected kernel list, added all 12 templates
12. ~~**5 kernels have no matching template**~~ ✅ FIXED (2026-02-04) — Created onboard, security, compliance, iac, dr templates
13. ~~**No "Explanation/Concepts" doc type**~~ ✅ FIXED (2026-02-04) — Added #concept kernel and concept-template.md

### LOW
9. ~~README folder diagram shows `docs/` structure that doesn't exist~~ ✅ FIXED
14. No prompt versioning metadata on kernels (version, last-tested-model)
15. No rendered docs site (raw markdown only)
16. Templates lack co-located writing guides (Good Docs Project pattern)

## Session Log

| Date | What happened | Next |
|------|---------------|------|
| 2026-01-29 | Project init. Established basics. Deep exploration revealed 10 issues (3 HIGH). Decided: English for system, Finnish for outputs. Fixed all path references across 9 files. | Convert README.md to English |
| 2026-01-29 | Completed all 7 hardening tasks: path fixes, English conversion (README, DEMO, ONBOARDING, kernels/README), kernel simplification (11 kernels → plain English format), updated all dependent files. All HIGH issues resolved. | Team pilot ready |
| 2026-01-30 | Phase 2 complete: tag taxonomy (standards/tag-taxonomy.md), llms.txt for AI discoverability, search.ps1 and stale-finder.ps1 tools, templates updated with taxonomy guidance. All docs normalized. | Phase 3 (CI/CD) |
| 2026-02-04 | Audit fix: translated standards/ files (documentation-guide.md, review-process.md, style-guide.md) to English. Fixed review-process.md broken markdown. Fixed README.md date and removed references to non-existent #outline/#edit kernels. Cleaned up context.md and memory.md. | Preferences interview |
| 2026-02-04 | Preferences interview: researched best practices, decided on validation (PS, full checks), prompt library (full, in kernels/ subdirs), RAG prep (all docs, semantic frontmatter), team-based ownership, ~400 line limit, multi-language future, on-change framework reviews. CI/CD platform deferred. | Industry alignment research |
| 2026-02-04 | Industry research: evaluated Diátaxis, DITA, Good Docs Project, Stripe/Twilio/GitLab docs-as-code. AI-RTFM well-aligned on core practices. Found 7 gaps: wrong kernel list in llms.txt, 5 kernels without templates, no Explanation doc type, no content reuse, no prompt versioning, no rendered site, no writing guides. Logged to memory.md and context.md known issues. | Fix llms.txt, add missing templates |
| 2026-02-04 | Fixed all MEDIUM known issues: created 6 missing templates (onboard, security, compliance, iac, dr, concept), added #concept kernel (#12), standardized review cycles to 30 days, updated example doc dates 2024→2026, fixed llms.txt, updated all cross-references (README, ONBOARDING, QUICK-REFERENCE, WORKSHOP, CLAUDE.md, memory.md, tag-taxonomy). Closed issues #4,#7,#8,#10,#11,#12,#13. Pushed to GitHub (Hakku/AI-RTFM). | **Next: user introducing new workflow and system** |

---

*Update: decisions, session log, phase changes. Delete stale info.*
