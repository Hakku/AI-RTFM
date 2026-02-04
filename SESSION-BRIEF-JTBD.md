# Session Brief: AI-RTFM Re-scoping with Jobs-to-be-Done

> Start next session by reading this file.

## Objective

Re-scope AI-RTFM using Jobs-to-be-Done framework. One session. Output: updated PRD.md with clear problem statement and explicit non-goals.

## Background

AI-RTFM is a documentation system for IT Operations. Phase 1-2 complete (hardening, discoverability). Before Phase 3 (validation tooling), we're stepping back to verify the scope is correct.

## Framework: Jobs-to-be-Done

**Core concept:** Customers "hire" products to do a job. If it does the job well, they keep using it. If not, they "fire" it.

**Key insight:** Jobs have functional, social, and emotional dimensions. Circumstances matter more than customer demographics.

### The Questions

Answer these in order:

1. **Who is the customer?**
   - Primary: IT Operations team members
   - Secondary: Future expansion targets (who?)

2. **What job are they hiring AI-RTFM to do?**
   - Not "write documentation" — that's the activity, not the job
   - What outcome are they trying to achieve?
   - What does success look like for them?

3. **What circumstances trigger the hire?**
   - When do they reach for AI-RTFM?
   - What's happening in their work when they need it?

4. **What are they firing?**
   - What do they currently use instead?
   - Why is that inadequate?

5. **What are the functional, social, and emotional dimensions?**
   - Functional: What task needs completing?
   - Social: How do they want to be perceived? (competent, thorough, modern)
   - Emotional: How do they want to feel? (confident, in control, not overwhelmed)

## Optional: Impact Mapping Structure

After JTBD answers, organize as:

```
GOAL: [The job to be done - one sentence]
  │
  ├── ACTOR: [Who]
  │     │
  │     ├── IMPACT: [Behavior change needed]
  │     │     └── DELIVERABLE: [Feature that enables this]
  │     │
  │     └── IMPACT: [Another behavior change]
  │           └── DELIVERABLE: [Feature]
  │
  └── ACTOR: [Secondary user]
        └── ...
```

## Deliverables

1. **Problem statement** — One paragraph describing the job AI-RTFM is hired to do
2. **Non-goals** — Explicit list of what AI-RTFM is NOT for
3. **Updated PRD.md** — Incorporate problem statement and non-goals
4. **Decision in progress.txt** — Record the scoping decision

## Anti-patterns to Avoid

- Feature-first thinking ("we need validation tooling") — ask why first
- Demographic descriptions ("IT Ops teams") — describe circumstances instead
- Vague jobs ("help with documentation") — be specific about the outcome
- Skipping emotional/social dimensions — these often drive adoption

## Session Rules

- Use CLAUDE.md interrogation workflow
- Switch to plan mode if scope expands unexpectedly
- One session max — if not converging, stop and ask what's blocking
- Output must be concrete, not exploratory

## Files to Update

| File | Update |
|------|--------|
| PRD.md | Problem statement, non-goals, scope refinement |
| progress.txt | Decision record, session state |
| lessons.md | Any patterns discovered during scoping |

## Reference

- [Jobs to Be Done - Christensen Institute](https://www.christenseninstitute.org/theory/jobs-to-be-done/)
- [Know Your Customers' Jobs to Be Done - HBR](https://hbr.org/2016/09/know-your-customers-jobs-to-be-done)
- [Impact Mapping](https://www.impactmapping.org/)
