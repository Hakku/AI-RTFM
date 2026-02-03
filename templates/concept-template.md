---
type: concept_explanation
kernel: concept
title: [Concept or System Name]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [system-tag, concept, audience-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system or domain, concept action
# Recommended: audience (end-user, developer, oncall), complexity (basic, intermediate, advanced)
---

# [Concept or System Name]

**Audience:** [Who should read this]
**Prerequisites:** [What the reader should already know]
**Reading time:** ~[X] minutes

## Overview

[One-paragraph summary of the concept. What is it? Why does it matter?
Write for someone who has heard the term but doesn't understand it yet.]

## Background and Context

[Historical context and motivation:
- Why does this concept exist?
- What problem did it solve?
- How has it evolved?
- Where does it fit in the broader landscape?]

### Before This Existed

[What was the situation before? What pain points drove the creation of this concept/system?]

### The Shift

[What changed? What new thinking or technology enabled this approach?]

## How It Works

[Core explanation of the mechanism. Use analogies if helpful.
Build understanding step by step — don't front-load jargon.]

### The Basic Mechanism

[Explain the fundamental process in simple terms]

```
[Diagram or flow showing how it works]
┌─────────┐     ┌──────────┐     ┌──────────┐
│  Input   │────▶│ Process  │────▶│  Output  │
└─────────┘     └──────────┘     └──────────┘
```

### Under the Hood

[More detailed technical explanation for those who want depth.
Still explain clearly — avoid "it just works" hand-waving.]

### Example in Practice

[Concrete example showing the concept in action in your environment.
Use real system names and scenarios where possible.]

```bash
# Practical example command or configuration
example-command --with-context
```

## Key Concepts

### [Concept Term 1]

[Definition and explanation. 2-3 sentences.]

**Why it matters:** [Practical relevance]

### [Concept Term 2]

[Definition and explanation.]

**Why it matters:** [Practical relevance]

### [Concept Term 3]

[Definition and explanation.]

**Why it matters:** [Practical relevance]

### Glossary

| Term | Definition |
|------|-----------|
| [Term 1] | [Brief definition] |
| [Term 2] | [Brief definition] |
| [Term 3] | [Brief definition] |

## Relationships and Dependencies

### How This Relates to Other Systems

```
[Relationship diagram]
┌──────────────┐
│ [This concept]│
├──────────────┤
│ depends on:   │──▶ [System A], [System B]
│ used by:      │◀── [System C], [System D]
│ interacts:    │◀─▶ [System E]
└──────────────┘
```

### Integration Points

| System | Relationship | What to Know |
|--------|-------------|-------------|
| [System A] | Depends on | [How and why] |
| [System B] | Feeds into | [How and why] |
| [System C] | Replaces | [Migration context] |

### When to Use vs. Alternatives

| Scenario | Use This | Use Alternative |
|----------|----------|----------------|
| [Scenario 1] | [Why this fits] | — |
| [Scenario 2] | — | [What to use instead and why] |

## Common Misconceptions

### "[Misconception 1]"

**Reality:** [Correct understanding. Be specific about what people get wrong and why.]

### "[Misconception 2]"

**Reality:** [Correct understanding.]

### "[Misconception 3]"

**Reality:** [Correct understanding.]

## Further Reading

### Internal Documentation

- [Related runbook](../runbooks/related-procedure.md)
- [Architecture decision](../adr/related-decision.md)
- [Knowledge base article](../kb/related-article.md)

### External Resources

- [Official documentation](https://example.com/docs)
- [Recommended book or article]
- [Conference talk or video]

## Related Documentation

- [How-to guide for this concept](../runbooks/related-howto.md)
- [Reference documentation](../runbooks/related-reference.md)
- [Related concept](related-concept.md)

## Maintenance

**Review Schedule:** Every 30 days

**Last Reviewed By:** @username on YYYY-MM-DD

**Changelog:**
- YYYY-MM-DD: Initial creation
- YYYY-MM-DD: Updated [section] to reflect [change]
