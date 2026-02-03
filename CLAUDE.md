# CLAUDE.md

## Session Startup

**Always read first:**
1. `context.md` - Current state, blockers, decisions
2. `memory.md` - Domain knowledge, patterns, relationships

## What

AI-RTFM: PRISM KERNEL documentation system for IT Operations teams, with goal to expand company-wide.

## Two-Layer Architecture

| Layer | Purpose | Files |
|-------|---------|-------|
| **Project management** | Developing AI-RTFM itself | context.md, memory.md, .learnings/ |
| **Documentation system** | The deliverable for teams | templates/, kernels/, standards/, training materials |

Do not conflate these. Project management tracks development work. The documentation system is the product.

## Critical Context

### Phase Status
- **Phase 1 (Hardening):** ✅ Complete
- **Phase 2 (Discoverability):** ✅ Complete
- **Phase 3 (Automation):** Next (CI/CD, hooks)
- **Phase 4 (Intelligence):** Future (MCP, agentic)

### Completed Work
- Language: English (system files converted)
- Kernels: Simplified to plain English format (12 kernels)
- Path references: Fixed (no more `docs/` prefix)
- Discoverability: llms.txt, tag taxonomy, search/stale tools

## File Quick Reference

| Need | File |
|------|------|
| Kernel definitions | kernels/it-ops-kernels.md |
| Template list | templates/*.md (12 types) |
| Tag taxonomy | standards/tag-taxonomy.md |
| Style rules | standards/style-guide.md |
| Review process | standards/review-process.md |
| AI index | llms.txt |
| Search tool | tools/search.ps1 |
| Stale finder | tools/stale-finder.ps1 |
| Training flow | DEMO.md → ONBOARDING.md → WORKSHOP.md |

## Working Rules

1. **Never edit kernels without updating ALL dependent files** (DEMO, ONBOARDING, WORKSHOP, QUICK-REFERENCE, README)
2. **Check path references** — use relative paths from root, not `docs/`
3. **Language** — system files in English, output examples can be Finnish
4. **Tags** — use only tags from standards/tag-taxonomy.md
5. **Examples must work** — test any kernel/template changes before committing

## Language

- **System:** English (all framework files)
- **Outputs:** Finnish (documentation teams create)
- Finnish company, global operations

## Safety

Before deleting any file, copy to `.backup/filename.YYYYMMDD`

## Skills

| Skill | Purpose |
|-------|---------|
| `/quick-handoff` | Update context.md and memory.md before ending |
