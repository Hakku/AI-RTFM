# CLAUDE.md

## Session Startup

1. Read `progress.txt` — current state, what's done, what's next
2. Read `lessons.md` — patterns, anti-patterns, domain knowledge
3. **IF interrogation in progress:** Read `SESSION-BRIEF-INTERROGATION.md` first
4. Otherwise: Check current step in `IMPLEMENTATION_PLAN.md`

## Interrogation Rule

Before starting any new feature, scope change, or project phase:
- Switch to planning mode
- Interrogate the idea: assume nothing, ask until no assumptions remain
- Questions to cover: who is this for, what's the core action, what data is involved, what happens on success/error, what dependencies exist, what's explicitly out of scope
- Generate/update canonical docs from interrogation answers
- Only then begin implementation

## What

AI-RTFM: PRISM KERNEL documentation system for IT Operations teams, with goal to expand company-wide.

## Two-Layer Architecture

| Layer | Purpose | Files |
|-------|---------|-------|
| **Project management** | Developing AI-RTFM itself | progress.txt, lessons.md, canonical docs (PRD, APP_FLOW, TECH_STACK, IMPLEMENTATION_PLAN) |
| **Documentation system** | The deliverable for teams | templates/, kernels/, standards/, training materials |

Do not conflate these. Project management tracks development work. The documentation system is the product.

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

## Self-Improvement

- After every correction → update lessons.md
- After every session → update progress.txt
- After every pattern discovery → update lessons.md

## Working Rules

1. **Never edit kernels without updating ALL dependent files** (DEMO, ONBOARDING, WORKSHOP, QUICK-REFERENCE, README)
2. **Check path references** — use relative paths from root, not `docs/`
3. **Language** — system files in English, output examples can be Finnish
4. **Tags** — use only tags from standards/tag-taxonomy.md
5. **Examples must work** — test any kernel/template changes before committing

## Workflow Patterns

### Plan Mode (Claude Code)
- Start complex tasks in plan mode — front-load planning for one-shot implementation
- When blocked or off-track, return to plan mode — don't push through
- Use plan mode for verification design, not just building

### Subagents (Claude Code)
- Add "use subagents" to prompts for parallel computation on independent subtasks
- Offload discrete tasks to subagents to preserve main context window

### Understanding
- Request ASCII diagrams for protocols/architectures when reviewing unfamiliar systems

Note: Review triggers ("Grill me", "Prove it", "Elegant") and self-improvement rules are in global CLAUDE.md.

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
| Training flow | DEMO.md → ONBOARDING.md → WORKSHOP.md |
| JTBD session brief | SESSION-BRIEF-JTBD.md |
| Interrogation brief | SESSION-BRIEF-INTERROGATION.md (ACTIVE) |

## Language

- **System:** English (all framework files)
- **Outputs:** Finnish (documentation teams create)
- Finnish company, global operations

## Safety

Before deleting any file, copy to `.backup/filename.YYYYMMDD`

## Repository

- **Remote:** https://github.com/Hakku/AI-RTFM
- **Branch:** main
- **Commit convention:** `feat|fix|refactor|docs|test|chore: description`
