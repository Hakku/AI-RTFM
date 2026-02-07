---
type: project_document
title: AI-RTFM User Workflow Flows
owner: @hakku
created: 2026-02-06
last_updated: 2026-02-06
status: active
---

# AI-RTFM User Workflow Flows

> **Status:** Toolkit flows below are current. Application flows (Prompt Generator UI) are **pending interrogation** — they will be defined during the interrogation phase via `/interrogation` and `/doc-generation` skills. Do NOT write app flows until interrogation is complete.

## Documentation Creation Flow

```
1. Copy template     → templates/<type>-template.md
2. Activate kernel   → Paste #hashtag (or full kernel) into AI
3. Prompt AI         → Describe what you need documented
4. Paste output      → Into the template structure
5. Fill frontmatter  → Title, tags, owner, dates, status
6. Review            → Self-check against kernel META criteria
7. Publish           → Commit to repo in correct directory
```

### Output Directories

| Kernel | Output Location |
|--------|-----------------|
| #techdoc | runbooks/ |
| #incident | incidents/ |
| #adr | adr/ |
| #kb | kb/ |
| #api | (custom) |
| #change | (ticket system) |
| #onboard | (custom) |
| #security | (custom) |
| #compliance | (custom) |
| #iac | (custom) |
| #dr | (custom) |
| #concept | (custom) |

## Training Flow

```
DEMO.md (15 min)        → See it work (live demonstration)
    ↓
ONBOARDING.md (1-2 hrs) → Learn step-by-step (individual)
    ↓
WORKSHOP.md (2 hrs)     → Hands-on practice (group session)
    ↓
QUICK-REFERENCE.md      → Daily use cheat sheet
```

Each entry point is independent. Users can start at any level matching their experience.

## Maintenance Flow

```
1. stale-finder.ps1 flags docs past review date
2. Owner reviews flagged document
3. Update content OR confirm still accurate (bump review date)
4. Commit changes
```

- **Active ops docs:** 30-day review cycle
- **Incident reports:** One-time (no recurring review)
- **ADRs:** On-change only (review when referenced decision is revisited)
- **Change requests:** Follow lifecycle (draft → approved → implemented → closed)

## Discovery Flow

### For Humans
```
search.ps1 -Tag "networking"     → Find docs by tag
search.ps1 -Incomplete           → Find docs missing frontmatter
QUICK-REFERENCE.md               → Kernel/template lookup
```

### For AI
```
llms.txt                         → AI-readable index of all system files
standards/tag-taxonomy.md        → Controlled vocabulary for classification
```

## File Relationships

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
