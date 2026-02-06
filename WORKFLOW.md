# WORKFLOW.md — Developer/Contributor Guide

How to work ON AI-RTFM using Claude Code. For the documentation toolkit itself, see [README.md](README.md).

---

## Architecture Overview

AI-RTFM has two layers. Don't conflate them.

| Layer | Purpose | Key files |
|-------|---------|-----------|
| **Project management** | Developing AI-RTFM | progress.txt, lessons.md, canonical docs (PRD, APP_FLOW, TECH_STACK, IMPLEMENTATION_PLAN) |
| **Documentation toolkit** | The deliverable for teams | templates/, kernels/, standards/, training materials |

### `.claude/` directory structure

```
.claude/
├── rules/                        # Auto-loaded by Claude Code
│   ├── workflow.md               # Plan mode, subagents, verification
│   ├── communication.md          # Assumption format, change descriptions
│   ├── documentation-conventions.md  # Frontmatter, naming, section order
│   ├── safety.md                 # Backups, path refs, kernel cascades
│   └── completion-checklist.md   # Phase-appropriate verification
├── skills/                       # Invokable via /command
│   ├── interrogation/SKILL.md    # /interrogation
│   └── doc-generation/SKILL.md   # /doc-generation
└── settings.local.json           # Local Claude Code settings
```

**CLAUDE.md** is the entry point (session startup, core rules). **Rules** are the detail. **Skills** are the tools.

---

## Session Startup Sequence

When Claude Code loads this project, the following happens automatically:

| Order | What loads | How |
|-------|-----------|-----|
| 1 | `CLAUDE.md` | Auto-loaded by Claude Code |
| 2 | `.claude/rules/*.md` (5 files) | Auto-loaded by Claude Code |
| 3 | `progress.txt` | Read per CLAUDE.md startup instructions |
| 4 | `lessons.md` | Read per CLAUDE.md startup instructions |
| 5a | `SESSION-BRIEF-INTERROGATION.md` | IF interrogation is in progress |
| 5b | `IMPLEMENTATION_PLAN.md` | OTHERWISE: check current build step |

Steps 1-2 are automatic (Claude Code feature). Steps 3-5 are instructions that Claude follows from CLAUDE.md.

---

## Rules System

Files in `.claude/rules/` are auto-loaded into every Claude Code session — no manual reading required. They act as persistent behavioral constraints.

| File | Purpose | Key behaviors |
|------|---------|---------------|
| `workflow.md` | Orchestration | Plan mode for 3+ step tasks, subagent delegation, verification-before-done, self-improvement loop |
| `communication.md` | Interaction standards | Explicit assumptions before acting, change summaries after multi-file edits, push back on flawed designs |
| `documentation-conventions.md` | Document format | YAML frontmatter required, file naming patterns, section order by template type, style rules |
| `safety.md` | Protection | Backup before delete, relative paths from root, kernel edit cascade, scope discipline |
| `completion-checklist.md` | Verification | Phase-appropriate checklist before marking work complete |

**Adding rules:** Create a new `.md` file in `.claude/rules/`. It will be auto-loaded next session. Keep rules focused — one concern per file.

**Modifying rules:** Edit directly. Changes take effect next session. Update `lessons.md` with the reason for the change.

---

## Skills System

Skills are reusable prompts invoked via `/command`. They inject project context dynamically.

### `/interrogation`

| Aspect | Detail |
|--------|--------|
| **When** | Before any new feature, scope change, or project phase |
| **What** | Exhaustive questioning across 12 categories (identity, users, trigger, workflow, data, output, success, error states, constraints, dependencies, scope boundaries, assumptions) |
| **Reads** | PRD.md, SESSION-BRIEF-INTERROGATION.md, progress.txt, lessons.md |
| **Output** | Complete summary of confirmed facts vs open questions |
| **Rules** | No building, no code, no solutions — only questions. Never assume, never infer |

### `/doc-generation`

| Aspect | Detail |
|--------|--------|
| **When** | After interrogation is complete and user confirms nothing is missing |
| **What** | Produces/updates canonical docs from interrogation answers |
| **Reads** | PRD.md, TECH_STACK.md, IMPLEMENTATION_PLAN.md, APP_FLOW.md, progress.txt |
| **Output** | Updated PRD.md, APP_FLOW.md, TECH_STACK.md, IMPLEMENTATION_PLAN.md (+ DESIGN_SYSTEM.md, FRONTEND_GUIDELINES.md, BACKEND_STRUCTURE.md when applicable) |
| **Rules** | No TBD sections (use BLOCKED), no placeholders, version-lock everything |

**Pipeline:** `/interrogation` → user confirms → `/doc-generation` → user reviews each doc → implement.

---

## Session Files

### `progress.txt`

Updated every session. Structure:

- **COMPLETED** — What's done, with dates
- **IN PROGRESS** — Current work
- **NEXT** — Ordered next steps (START HERE marker)
- **KNOWN ISSUES** — Tracked problems with severity
- **DECISIONS** — All decisions with rationale and dates
- **OPEN QUESTIONS** — Unresolved items (often tagged with what will answer them)

### `lessons.md`

Updated when something is learned. Structure:

- **Patterns That Work** — Proven approaches
- **Anti-Patterns** — Things that failed and why
- **Corrections** — Dated mistakes and fixes
- **Domain Knowledge** — PRISM, kernels, industry context
- **Vocabulary** — Project-specific terms

### Update triggers

| Event | Update |
|-------|--------|
| Session start | Read both files |
| Session end | Update progress.txt |
| Mistake or correction | Update lessons.md |
| Decision made | Add to progress.txt DECISIONS |
| New pattern discovered | Add to lessons.md |

---

## Canonical Docs

These are the single source of truth for the product. Nothing gets built without a corresponding document.

| Doc | Purpose | Updated by |
|-----|---------|------------|
| `PRD.md` | Features, scope, acceptance criteria, user stories | `/doc-generation` or manual |
| `APP_FLOW.md` | Screens, routes, user journeys, error states | `/doc-generation` or manual |
| `TECH_STACK.md` | Exact frameworks, versions, hosting, dependencies | `/doc-generation` or manual |
| `IMPLEMENTATION_PLAN.md` | Phased build sequence with file lists and feature IDs | `/doc-generation` or manual |

**Cross-reference cascade:** PRD defines features → APP_FLOW defines how users experience them → TECH_STACK defines what builds them → IMPLEMENTATION_PLAN sequences the execution. Every reference between docs uses exact names, IDs, and values.

IMPLEMENTATION_PLAN is immutable within a phase, revisable between phases.

---

## Git Workflow

### Branch protection (main)

- Pull requests required (no direct push)
- Deletions restricted
- Force pushes blocked

### Commit convention

| Prefix | Use |
|--------|-----|
| `feat:` | New functionality |
| `fix:` | Bug fix |
| `refactor:` | Restructure without behavior change |
| `docs:` | Documentation changes |
| `test:` | Test additions/changes |
| `chore:` | Maintenance, tooling |

### PR process

1. Create feature branch
2. Make changes, commit with convention above
3. Push and open PR against `main`
4. After squash-merge: `git reset --hard origin/main` locally (squash creates a different hash)

### Co-authoring

PRs created with Claude Code include:
```
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

---

## Self-Improvement Loop

When Claude makes a mistake or receives a correction:

1. **lessons.md** — Record the pattern/anti-pattern
2. **`.claude/rules/`** — Add a rule if it's a structural/recurring issue
3. **CLAUDE.md** — Update only if it affects session startup

> "Config grows from pain, not anticipation." Rules are written because something went wrong, not because something might go wrong.

The loop is continuous: correction → lesson → rule → prevention.

---

## Quick Reference

| I want to... | Do this |
|--------------|---------|
| Start a new session | Claude auto-reads CLAUDE.md + rules/. Follow startup sequence (progress.txt → lessons.md → current step) |
| Add a new feature | Run `/interrogation` first, then `/doc-generation`, then implement |
| Edit a kernel | Edit `kernels/it-ops-kernels.md`, then update ALL dependents: DEMO.md, ONBOARDING.md, WORKSHOP.md, QUICK-REFERENCE.md, README.md |
| Add a rule | Create `.claude/rules/your-rule.md`. Auto-loaded next session |
| Delete a file | Back up to `.backup/filename.YYYYMMDD` first, then delete |
| Check project status | Read `progress.txt` |
| Understand a decision | Check DECISIONS section in `progress.txt` |
| Find a lesson | Read `lessons.md` |
| Find a template/kernel | Check `llms.txt` for the full index |

---

## Related Documentation

- [CLAUDE.md](CLAUDE.md) — Claude Code entry point and session startup
- [.claude/rules/](.claude/rules/) — Behavioral rules (auto-loaded)
- [.claude/skills/](.claude/skills/) — Invokable skills
- [PRD.md](PRD.md) — Product requirements
- [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md) — Build sequence
- [README.md](README.md) — End-user documentation toolkit overview
