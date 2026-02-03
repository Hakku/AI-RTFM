---
type: architecture_decision_record
kernel: adr
adr_number: NNNN
title: [Decision Title]
owner: @username
date: YYYY-MM-DD
status: proposed | accepted | deprecated | superseded
supersedes: [ADR-NNNN if applicable]
superseded_by: [ADR-NNNN if applicable]
tags: [system-tag, decision, architecture]  # See standards/tag-taxonomy.md
# Required: 1+ system (postgresql, kubernetes, etc.), action=decision
# Add related systems being compared (e.g., postgresql, mongodb if comparing DBs)
---

# ADR-NNNN: [Decision Title]

**Status:** Proposed / Accepted / Deprecated / Superseded by ADR-XXXX  
**Date:** YYYY-MM-DD  
**Owner:** @username  
**Reviewers:** @reviewer1, @reviewer2

## Context

[Describe the context and problem statement. Include:
- What situation led to this decision?
- What are the constraints?
- What are the forces at play?
- What business or technical requirements drive this?]

**Background:**
- [Relevant background information]
- [Current state of the system]
- [Why is this decision needed now?]

## Decision Drivers

[List the key factors influencing this decision]

* [Driver 1 - e.g., Performance requirements]
* [Driver 2 - e.g., Team expertise]
* [Driver 3 - e.g., Cost constraints]
* [Driver 4 - e.g., Time to market]
* [Driver 5 - e.g., Scalability needs]

## Options Considered

### Option 1: [Name of Option]

**Description:**
[Detailed description of this option]

**Pros:**
- ✅ [Advantage 1]
- ✅ [Advantage 2]
- ✅ [Advantage 3]

**Cons:**
- ❌ [Disadvantage 1]
- ❌ [Disadvantage 2]
- ❌ [Disadvantage 3]

**Estimated Cost:** $[amount] / [timeframe]

**Implementation Effort:** [Low/Medium/High] - [X weeks/months]

### Option 2: [Name of Option]

**Description:**
[Detailed description]

**Pros:**
- ✅ [Advantage 1]
- ✅ [Advantage 2]

**Cons:**
- ❌ [Disadvantage 1]
- ❌ [Disadvantage 2]

**Estimated Cost:** $[amount]

**Implementation Effort:** [Low/Medium/High]

### Option 3: [Name of Option]

**Description:**
[Detailed description]

**Pros:**
- ✅ [Advantage 1]
- ✅ [Advantage 2]

**Cons:**
- ❌ [Disadvantage 1]
- ❌ [Disadvantage 2]

**Estimated Cost:** $[amount]

**Implementation Effort:** [Low/Medium/High]

## Decision

**We have decided to: [Choose Option X]**

**Rationale:**
[Explain why this option was chosen over the others. Be explicit about:
- Which decision drivers were most important
- What tradeoffs were made
- Why rejected options were not suitable
- What assumptions are being made]

## Consequences

### Positive

[What positive outcomes do we expect?]

- [Positive consequence 1]
- [Positive consequence 2]
- [Positive consequence 3]

### Negative

[What negative consequences or tradeoffs are we accepting?]

- [Negative consequence 1]
- [Negative consequence 2]
- [Negative consequence 3]

### Neutral

[Changes that are neither clearly positive nor negative]

- [Neutral change 1]
- [Neutral change 2]

## Implementation

### Migration Plan

[If replacing existing system, describe migration approach]

**Phase 1:** [Description and timeline]
**Phase 2:** [Description and timeline]
**Phase 3:** [Description and timeline]

### Rollback Strategy

[How can we reverse this decision if needed?]

- [Rollback step 1]
- [Rollback step 2]

**Risk Level:** Low / Medium / High

### Success Criteria

[How will we know this decision was successful?]

- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]
- [ ] [Measurable criterion 3]

**Review Date:** YYYY-MM-DD (6 months after implementation)

## Compliance & Security

**Security Considerations:**
- [Security implication 1]
- [Security implication 2]

**Compliance Requirements:**
- [ ] GDPR compliant
- [ ] SOC2 requirements met
- [ ] [Other compliance framework]

## Documentation & Training

**Documentation Needed:**
- [ ] [Update system architecture diagram]
- [ ] [Update runbook X]
- [ ] [Create new how-to guide]

**Training Required:**
- [ ] [Team training session scheduled]
- [ ] [Documentation shared with team]
- [ ] [Migration guide created]

## Related Decisions

- [ADR-XXXX: Related decision 1](XXXX-title.md)
- [ADR-YYYY: Related decision 2](YYYY-title.md)

## References

- [Link to relevant documentation]
- [Link to technical specifications]
- [Link to benchmark results]
- [Link to vendor documentation]

## Discussion

**Key Discussion Points:**
- [Point raised by @reviewer1]
- [Point raised by @reviewer2]
- [Resolution or decision made]

**Open Questions:**
- [ ] [Question 1 that needs answering]
- [ ] [Question 2 that needs answering]

## Approval

**Architecture Review Board:**
- [ ] @architect1 - Approved on YYYY-MM-DD
- [ ] @architect2 - Approved on YYYY-MM-DD
- [ ] @tech-lead - Approved on YYYY-MM-DD

**Stakeholder Sign-off:**
- [ ] @engineering-manager - Approved on YYYY-MM-DD
- [ ] @product-manager - Approved on YYYY-MM-DD

---

**Notes:**
- Once accepted, this ADR is immutable
- Updates require a new superseding ADR
- Status changes are tracked in this section

**Changelog:**
- YYYY-MM-DD: Created (status: proposed)
- YYYY-MM-DD: Updated after review feedback
- YYYY-MM-DD: Accepted by ARB