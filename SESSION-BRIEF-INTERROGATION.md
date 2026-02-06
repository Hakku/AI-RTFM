# Session Brief: AI-RTFM Interrogation

> Start next session by reading this file. Use `/interrogation` skill to run the process.

## Context

AI-RTFM started as a documentation toolkit. The roadmap now includes building a production application (Prompt Generator UI). Phase 1 context re-alignment happened (2026-02-06): PRD rewritten with three-component framing, creator context received, new roadmap established.

**Core identity (confirmed):** AI-RTFM = documentation toolkit with three components:
1. Folder structure + templates
2. AI prompts (PRISM kernels)
3. Process layer

**What changed:** Production app is on the roadmap. The project is expanding from "toolkit you copy-paste" to "application you interact with."

## What's Already Answered

From Phase 1 context re-alignment:
- **What IS AI-RTFM?** → Three-component documentation toolkit for IT Operations
- **Who uses it?** → IT Operations teams initially, expanding company-wide
- **What's the job?** → "Write docs you're not embarrassed by, fast" (from JTBD session — needs validation)
- **Prompts are weak** → Creator assessment, highest priority to fix
- **10-minute user** → Time target tightened from 30 to 10 minutes
- **New roadmap:** 1) Redesign PRISM prompts, 2) Build prompt generator UI, 3) Model-agnostic/versioned prompts, 4) Self-improving prompt library

## Questions Still Open

### Prompt Redesign (Roadmap Phase 1)
- What specifically is wrong with the current prompts?
- What does "good output" look like for each kernel type?
- What's the gap between current output and desired output?
- Which kernels are used most? Which are never used?
- What context does the user typically provide to the AI?

### Prompt Generator UI (Roadmap Phase 2)
- What does the Prompt Generator UI do specifically?
- Who uses the UI vs who uses raw markdown templates?
- What's the interaction model? (form-based? wizard? chat?)
- What data does the app need? Where does it come from?
- How does the app relate to the existing toolkit?
- Does the UI generate prompts, documents, or both?
- What happens to the output? (copy to clipboard? export? save?)

### Tech Stack (for the application)
- What's the tech stack for the app?
- Where will it be hosted?
- Authentication needed? Who has access?
- Does it need a database? What for?

### Organizational
- Who decides what "good documentation" looks like?
- How is AI-RTFM currently deployed to teams?
- What's the adoption status? Who uses it today?
- What blocked wider adoption so far?

## Process

1. Run `/interrogation` skill
2. Work through open questions above (and any the interrogation surfaces)
3. When complete, run `/doc-generation` to produce/update canonical docs

## Deliverables

After interrogation is complete:
1. **Validated definition** of what AI-RTFM is (confirm or revise)
2. **Prompt redesign requirements** — specific enough to execute
3. **Application requirements** — specific enough to design
4. **Updated canonical docs** via `/doc-generation`

## Files to Review First

1. This file (you're reading it)
2. `progress.txt` — session state
3. `lessons.md` — what we've learned
4. `PRD.md` — current product definition
