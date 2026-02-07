# CLAUDE.md

## What

AI-RTFM: PRISM KERNEL documentation toolkit for IT Operations teams, expanding to a production application (Prompt Generator UI) and company-wide adoption. Three components: folder structure + templates, AI prompts (PRISM kernels), process layer.

## Platform

- Windows environment. Use PowerShell for path operations, not WSL bash.
- Use portable path separators and the `py` launcher instead of `python3`.
- Be careful with file extensions and Windows-specific path handling in JSON configs.

## Session Startup

1. Read `progress.txt` — current state, what's done, what's next
2. Read `lessons.md` — patterns, anti-patterns, domain knowledge
3. **IF interrogation in progress:** Read `SESSION-BRIEF-INTERROGATION.md` first
4. Otherwise: Check current step in `IMPLEMENTATION_PLAN.md`

## Session Continuity

- At session start, do NOT resume from previous session state unless explicitly asked. Start fresh and assess the current state of the repo.
- Never *spontaneously* enter interrogation mode or advance to a new workflow phase at session start. The Interrogation Rule still applies when the user requests a new feature or scope change.
- When user says "stop" or "wait", immediately halt all actions.

## Interrogation Rule

Before starting any new feature, scope change, or project phase:
- Switch to planning mode
- Interrogate the idea: **never assume, never infer, never fill gaps with reasonable defaults**
- Questions to cover: who is this for, what's the core action, what data is involved, what happens on success/error, what dependencies exist, what's explicitly out of scope
- Generate/update canonical docs from interrogation answers
- Only then begin implementation

## Two-Layer Architecture

| Layer | Purpose | Files |
|-------|---------|-------|
| **Project management** | Developing AI-RTFM itself | progress.txt, lessons.md, canonical docs |
| **Documentation toolkit** | The deliverable for teams | templates/, kernels/, standards/, training materials |

Do not conflate these. Project management tracks development work. The documentation toolkit is the product.

## Documentation Is Law

If it's in the docs, follow it. If it's not in the docs, ask. Every undocumented decision gets escalated to the user before implementation.

## File Interdependencies

- Before modifying any workflow or config file, first read ALL related/connected files to understand the system as a whole.
- Treat numbered/sequenced docs (e.g., part-1, part-2) as an interconnected system — never edit one in isolation.

## Verification & Sources

- When asked to verify against best practices or source documents, always read the ACTUAL source files first before making claims.
- Never fabricate or assume content — if you can't access a source, say so.
- Confirm you're looking at the correct source before proceeding.

## Canonical Docs

| Doc | Purpose |
|-----|---------|
| PRD.md | What we're building, for whom, scope |
| APP_FLOW.md | User workflows and interaction paths |
| TECH_STACK.md | Locked tools, versions, dependencies |
| IMPLEMENTATION_PLAN.md | Step-by-step build sequence with current position |

## Session Files

| File | Purpose |
|------|---------|
| progress.txt | Session state, decisions, what's done/next (update every session) |
| lessons.md | Patterns, anti-patterns, corrections, domain knowledge (update on learning) |

## Detailed Rules

See `.claude/rules/` for domain-specific rules:
- `workflow.md` — plan mode, subagents, verification, self-improvement
- `communication.md` — assumption format, change descriptions, push-back
- `documentation-conventions.md` — frontmatter, naming, section order, style
- `safety.md` — backups, path refs, kernel cascades, scope discipline
- `completion-checklist.md` — phase-appropriate verification checklist

## File Quick Reference

| Need | File |
|------|------|
| Product requirements | PRD.md |
| User workflows | APP_FLOW.md |
| Tech dependencies | TECH_STACK.md |
| Build sequence | IMPLEMENTATION_PLAN.md |
| Session state | progress.txt |
| Lessons learned | lessons.md |
| Kernel definitions | kernels/it-ops-kernels.md |
| Template list | templates/*.md (12 types) |
| Tag taxonomy | standards/tag-taxonomy.md |
| Style rules | standards/style-guide.md |
| Review process | standards/review-process.md |
| AI index | llms.txt |
| Search tool | tools/search.ps1 |
| Stale finder | tools/stale-finder.ps1 |
| Contributor workflow | WORKFLOW.md |
| Training flow | DEMO.md → ONBOARDING.md → WORKSHOP.md |
| Interrogation brief | SESSION-BRIEF-INTERROGATION.md (ACTIVE) |

## Repository

- **Remote:** https://github.com/Hakku/AI-RTFM
- **Branch:** main
- **Commit convention:** `feat|fix|refactor|docs|test|chore: description`

## Git Workflow

- NEVER push directly to main. Always create a feature branch, open a PR, and merge via PR.
- Always check for branch protection rules before any git push operation.
- After squash-merge PRs: `git reset --hard origin/main` (squash creates different hash).
