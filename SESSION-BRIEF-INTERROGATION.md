# Session Brief: AI-RTFM Interrogation

> Start next session by reading this file.

## Context

The vibe coding workflow was adopted for AI-RTFM development, but core concepts are not working. Analysis revealed we were treating "building a prompt library" like "building an app" — but that framing itself may be wrong.

The JTBD session (2026-02-05) defined the job as "write docs you're not embarrassed by, fast" — but the proposed solution (universal kernel) was rejected as not comprehensive enough and not meeting actual needs.

**Core issue:** We don't actually know what AI-RTFM IS. We've been building without interrogating the idea first.

## The Interrogation

Per the vibe coding workflow: "Before writing any code, endlessly interrogate my idea in Planning mode only. Assume nothing. Ask questions until there's no assumptions left."

### Questions to Answer

1. **What IS AI-RTFM?**
   - Not "a prompt library" — that framing was rejected
   - Not "a documentation system" — too vague
   - What is it actually?

2. **Who specifically uses it?**
   - Not "mid-level IT engineers" generically
   - What's the actual scenario? At their desk? In an incident? Onboarding someone?
   - What role? What moment? What pressure?

3. **What exists BEFORE someone reaches for AI-RTFM?**
   - Knowledge in their head?
   - A blank page?
   - An existing doc that's bad?
   - A request from someone else?

4. **What do they DO with AI-RTFM, step by step?**
   - Current APP_FLOW says "copy template, activate kernel, prompt AI"
   - Is that actually what happens?
   - What's the real workflow?

5. **What does AI-RTFM produce?**
   - A single document?
   - A set of documents?
   - Something else entirely?

6. **What happens AFTER they use AI-RTFM?**
   - Where does the output go?
   - Who reads it?
   - What changes in the organization?

7. **What does success look like for the ORGANIZATION?**
   - Not just individual success ("I wrote a doc")
   - Organizational outcome — what's different?

8. **What are we assuming that might be completely wrong?**
   - About the user?
   - About the workflow?
   - About the output?
   - About what "comprehensive" means?

## What Led Here

### Workflow Mismatch (Identified 2026-02-05)

| Element | Designed For | AI-RTFM Reality |
|---------|--------------|-----------------|
| APP_FLOW.md | User navigation paths | Usage instructions (not navigation) |
| TECH_STACK.md | Locking dependencies | Tools that don't need locking |
| IMPLEMENTATION_PLAN.md | Feature development | Scope creep for unclear product |
| Two-Layer Architecture | Code vs docs | Both layers are markdown |

### JTBD Session (2026-02-05)

- Defined job: "Write docs you're not embarrassed by, fast"
- Primary user: Mid-level engineer who knows systems but can't write
- Proposed solution: Universal kernel with auto-detection
- **Rejected:** Not comprehensive enough, doesn't meet actual needs

### Key Realization

We've been building solutions without understanding the problem. The interrogation must happen BEFORE any more building.

## Deliverables

After interrogation is complete:

1. **Clear definition** of what AI-RTFM is
2. **Updated PRD.md** reflecting the true scope
3. **Decision** on which canonical docs are actually needed
4. **Revised structure** if current files don't fit the redefined product

## Rules for Next Session

- Use planning mode
- Interrogate until no assumptions remain
- Do not propose solutions until interrogation is complete
- Generate/update canonical docs from interrogation answers
- Only then consider implementation

## Files to Review First

1. This file (SESSION-BRIEF-INTERROGATION.md)
2. progress.txt — session state
3. lessons.md — what we've learned
4. PRD.md — current (possibly wrong) definition
