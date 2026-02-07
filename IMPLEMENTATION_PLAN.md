---
type: project_document
title: AI-RTFM Implementation Plan
owner: @hakku
created: 2026-02-06
last_updated: 2026-02-06
status: active
---

# AI-RTFM Implementation Plan

## Phase 1: Hardening -- COMPLETE

- [x] 1.1 Fix path references (`docs/` prefix -> root-relative)
- [x] 1.2 Convert system files to English (README, DEMO, ONBOARDING, kernels/README)
- [x] 1.3 Simplify kernel syntax (unicode decorators -> plain English)
- [x] 1.4 Update all dependent files after kernel changes
- [x] 1.5 Translate standards/ files to English
- [x] 1.6 Fix broken markdown in review-process.md
- [x] 1.7 Remove references to non-existent kernels (#outline, #edit)

## Phase 2: Discoverability -- COMPLETE

- [x] 2.1 Create tag taxonomy (standards/tag-taxonomy.md)
- [x] 2.2 Create llms.txt for AI discoverability
- [x] 2.3 Build search.ps1 (tag-based search, incomplete frontmatter detection)
- [x] 2.4 Build stale-finder.ps1 (outdated document detection)
- [x] 2.5 Update templates with taxonomy guidance
- [x] 2.6 Create missing templates (onboard, security, compliance, iac, dr)
- [x] 2.7 Add #concept kernel and concept-template.md
- [x] 2.8 Fix llms.txt kernel list (was listing wrong kernels)
- [x] 2.9 Standardize review cycles to 30 days for active docs
- [x] 2.10 Update example doc dates (2024 -> 2026)

## Phase 3: Redesign PRISM Prompts -- NEXT

> **YOU ARE HERE: Phase 3** (pending interrogation completion)

Current PRISM Kernels are weak and don't reliably produce usable first drafts. This phase redesigns them from scratch.

- [ ] 3.1 Complete interrogation phase — define what "good output" looks like
- [ ] 3.2 Audit current kernel output quality against real use cases
- [ ] 3.3 Redesign kernel prompt structure
- [ ] 3.4 Test redesigned kernels across multiple AI models
- [ ] 3.5 Update all dependent files (DEMO, ONBOARDING, WORKSHOP, QUICK-REFERENCE, README)

> Detailed step breakdown will be finalized after interrogation completes.

## Phase 4: Prompt Generator UI -- FUTURE

- [ ] 4.1 Design prompt generator interface
- [ ] 4.2 Build UI for creating/customizing PRISM prompts
- [ ] 4.3 Ship as accessible tool (web-based or local)

## Phase 5: Multi-Model and Versioned Prompts -- FUTURE

- [ ] 5.1 Make prompts model-agnostic
- [ ] 5.2 Add prompt versioning metadata
- [ ] 5.3 Test across Claude, GPT, Gemini, etc.

## Phase 6: Self-Improving Prompt Library -- FUTURE

- [ ] 6.1 Build feedback loop for prompt quality
- [ ] 6.2 Implement prompt library with usage analytics
- [ ] 6.3 Production app at Luhta

> Phases 4-6 are directional. Scope will be defined through interrogation as each phase approaches.
