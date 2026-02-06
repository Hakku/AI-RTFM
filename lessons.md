# AI-RTFM Lessons
> Update when you learn something. Review at session start.

## Patterns That Work
- Production examples (incident, ADR, runbook) prove the system works — show, don't tell
- PRISM structure produces consistent output across different users
- Multi-entry-point training accommodates different learning styles (DEMO → ONBOARDING → WORKSHOP)
- Phase execution with parallelized waves — tasks with no dependencies run simultaneously
- Plain English kernel syntax — 100% copy-paste reliable, unlike unicode decorators
- English for system files, Finnish for outputs — scales globally while serving local teams

## Anti-Patterns
- **Over-engineering the meta layer:** ~25 project management files managing ~30 deliverable files. "If it feels over-engineered, it is." Meta work should be proportionate to the product it serves
- **Expanding when you should be tightening:** Old roadmap (automation, RAG, MCP, agentic workflows) was building infrastructure for unclear goals. New roadmap (fix prompts first) attacks the weakest link directly. Resist feature creep; improve what exists
- **Agent assessment overriding user assessment:** Fresh-eyes audit rated kernels/prompts positively. User (the creator, daily user) assessed them as weak. User assessment of product quality always overrides automated/agent analysis — they have ground truth
- **Building infrastructure before fixing fundamentals:** Validation scripts, CI/CD, JSON schema were Phase 3 items while the actual prompts (the core product) were known to be weak. Fix the thing that matters most first
- Editing kernels without updating ALL dependent files (DEMO, ONBOARDING, WORKSHOP, QUICK-REFERENCE, README) — breaks training materials
- Using `docs/` prefix in paths — files are at root, not in docs/
- Writing system files in Finnish — blocks global scalability
- Creating tags not in standards/tag-taxonomy.md — breaks controlled vocabulary
- Referencing non-existent kernels (e.g., #outline, #edit) — only use kernels defined in kernels/it-ops-kernels.md
- Over-engineering: unicode decorators for aesthetics broke copy-paste. Aesthetics must not compromise function
- Mixed languages evolving organically — drift is invisible to creator, obvious to fresh eyes

## Anti-Patterns (Git/GitHub)
- Testing branch protection by pushing to the branch you're protecting — test AFTER setup is complete, not during
- Making throwaway commits to real files for testing — use isolated test files or API checks instead
- GitHub rulesets on free plan require public repo. Private repos need GitHub Team (paid) or rely on discipline

## Corrections
- 2026-01-29: Fresh-eyes review catches accumulated drift (mixed languages, dead references, broken paths). Process fix: before release, have unfamiliar reviewer with "find obvious bugs" mandate
- 2026-01-30: Session handoff discipline — context files must be updated BEFORE ending session. Stale context = confused next session
- 2026-01-30: PowerShell variable `$incomplete` collided with `-Incomplete` switch parameter. Fix: renamed to `$incompleteDocs`. Avoid variable names matching parameter names in PowerShell
- 2026-02-04: Plans from previous sessions are not sacred. Critique before executing: verify attributions, check for redundancy with existing rules, confirm referenced features exist. Blind plan execution causes drift and duplication

## Domain Knowledge
- PRISM = Purpose, Rules, Identity, Structure, Motion (5 components)
- Kernels activated via hashtags (#techdoc, #incident, etc.) — requires Custom Instructions configured in AI tool. Without that, must copy full kernel
- 12 kernels in kernels/it-ops-kernels.md, each with matching template in templates/
- 64% of developers use AI for documentation (Google DORA)
- 75% predicted to use MCP servers by 2026
- Trend: "AI as writing assistant" → "Agentic AI managing entire documentation workflows"
- llms.txt (Sept 2024, Jeremy Howard/Answer.AI) — AI-readable site index, like sitemap for AI
- MCP (Anthropic) — open standard for AI-to-system integration, enables auto-updating docs

## Framework Selection (Brainstorming/Scoping)
- **Jobs-to-be-Done**: Best for scoping — low friction, asks "what job is the product hired to do?" Avoids feature-first thinking
- **Impact Mapping**: Good complement — structures output as Goal → Actors → Impacts → Deliverables
- **Content Strategy (Halvorson)**: Use later for governance/workflow, too heavy for initial scoping
- **Double Diamond**: Overkill for refining existing products — designed for greenfield design problems
- **Wardley Mapping**: Wrong tool for documentation systems — designed for competitive business strategy
- Rule: Pick one framework, run it clean. Framework shopping during execution causes drift

## JTBD Insights (2026-02-05)
- **"All options apply" in JTBD = no focus.** If every trigger/job/emotion matters equally, you haven't found the real job. Force prioritization
- **Outcomes ≠ jobs.** "Prevent knowledge loss" is an outcome. "Write docs I'm not embarrassed by, fast" is the job. Jobs are what users actively do; outcomes are what happens after
- **Grill your own analysis.** First pass JTBD often lands on noble-sounding outcomes (knowledge preservation, team scaling). Real jobs are often more mundane and personal (not looking incompetent, finishing faster)

## Workflow Discipline (2026-02-05)
- **Interrogation comes FIRST.** The vibe coding workflow says: "Before writing any code, endlessly interrogate my idea. Assume nothing. Ask questions until there's no assumptions left." We skipped this step and jumped to building. Result: built solutions for unclear problems
- **Analysis ≠ interrogation.** Analyzing whether a workflow fits is not the same as interrogating the product idea. Analysis is meta-work. Interrogation is foundational work
- **"Not comprehensive enough" = wrong abstraction.** When a solution is rejected for not being comprehensive, the issue is usually that we don't understand the problem, not that the solution needs more features
- **Stop building when lost.** If the project "has lost direction" — stop. Don't keep building. Interrogate first, then rebuild on solid foundation

## Industry Alignment
- **Diátaxis** — 4 doc types (Tutorials, How-to, Reference, Explanation). AI-RTFM covers all via kernels
- **DITA** — Topic-based authoring, content reuse. AI-RTFM does topic-based but lacks content reuse
- **Good Docs Project** — Templates with writing guides. AI-RTFM has templates; writing guides are a gap
- **Docs-as-code** (Stripe/Twilio/GitLab) — Markdown + Git + CI/CD + rendered site. AI-RTFM does Markdown + Git; CI/CD and rendered site are gaps
- PRISM differentiator: pre-optimized for IT documentation with runbook, incident, ADR patterns built-in. Most prompt libraries are generic

## Vocabulary
- **Kernel** = AI prompt following PRISM structure
- **PRISM** = Purpose, Rules, Identity, Structure, Motion
- **Frontmatter** = YAML metadata at top of documents
- **Active/Draft** = Document status (published vs work-in-progress)
- **llms.txt** = AI-readable documentation index file
- **MCP** = Model Context Protocol (AI-to-system integration standard)
