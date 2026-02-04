# AI-RTFM Implementation Plan

## Phase 1: Hardening -- COMPLETE

- [x] 1.1 Fix path references (`docs/` prefix → root-relative)
- [x] 1.2 Convert system files to English (README, DEMO, ONBOARDING, kernels/README)
- [x] 1.3 Simplify kernel syntax (unicode decorators → plain English)
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
- [x] 2.10 Update example doc dates (2024 → 2026)

## Phase 3: Automation -- NEXT

> **YOU ARE HERE: Phase 3, step 3.1**

- [ ] 3.1 Build frontmatter validation script (PowerShell)
  - FAIL: missing/invalid frontmatter, broken internal links, >400 lines
  - WARN: style deviations, external link issues, missing tags
- [ ] 3.2 Build markdown linting script
- [ ] 3.3 Create git pre-commit hook for validation
- [ ] 3.4 Document CI/CD integration approach (platform TBD)
- [ ] 3.5 Build prompt library structure
  - `kernels/content/` — documentation generation prompts
  - `kernels/review/` — review and QA prompts
  - `kernels/maintenance/` — maintenance and update prompts
  - `kernels/analysis/` — analysis and metrics prompts
- [ ] 3.6 Add prompt versioning metadata to kernels (version, last-tested-model)
- [ ] 3.7 Define JSON schema for frontmatter validation
- [ ] 3.8 Enrich frontmatter fields: audience, complexity, dependencies, keywords, summary, language

## Phase 4: Intelligence -- FUTURE

- [ ] 4.1 Enrich all documentation with semantic frontmatter for RAG
- [ ] 4.2 Evaluate and implement MCP integration
- [ ] 4.3 Build usage analytics (which docs reduce tickets?)
- [ ] 4.4 Explore agentic workflows (auto-detect outdated docs)
- [ ] 4.5 Evaluate content reuse mechanism (DITA-style includes/snippets)
- [ ] 4.6 Evaluate rendered docs site (Markdoc, MDX, or similar)
- [ ] 4.7 Co-locate writing guides with templates (Good Docs Project pattern)

## Open Questions

- Content reuse mechanism? (DITA pattern — includes/snippets for shared content)
- Rendered docs site? (Stripe/Twilio pattern — currently raw markdown only)

## Known Issues (LOW priority, not blocking)

- No prompt versioning metadata on kernels (version, last-tested-model)
- No rendered docs site (raw markdown only)
- Templates lack co-located writing guides (Good Docs Project pattern)
