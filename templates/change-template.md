---
type: change_request
kernel: change
change_id: CRQ-YYYY-NNNN
title: [Brief Description of Change]
owner: @username
requested_by: @username
created: YYYY-MM-DD
category: standard | normal | emergency
risk: low | medium | high | critical
priority: low | medium | high | critical
status: draft | submitted | approved | scheduled | implemented | closed
implementation_date: YYYY-MM-DD HH:MM UTC
tags: [system-tag, action-tag, env-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system affected, 1+ action (deploy, configure, upgrade)
# Recommended: env (production, staging), risk level
---

# Change Request: [Title]

**CRQ ID:** CRQ-YYYY-NNNN  
**Category:** Standard / Normal / Emergency  
**Risk Level:** Low / Medium / High / Critical  
**Status:** [Current Status]

## Change Summary

[One paragraph executive summary of the change]

**What:** [What is changing]  
**Why:** [Business justification]  
**When:** [Proposed date and time]  
**Impact:** [Expected user/system impact]

## Business Justification

**Problem Statement:**
[What problem does this change solve?]

**Benefits:**
- [Benefit 1]
- [Benefit 2]
- [Benefit 3]

**Cost of NOT Making Change:**
[What happens if we don't do this?]

## Technical Details

### Systems Affected

| System | Component | Change Type | Impact Level |
|--------|-----------|-------------|--------------|
| [System 1] | [Component] | [Update/Add/Remove] | Low/Medium/High |
| [System 2] | [Component] | [Update/Add/Remove] | Low/Medium/High |

### Change Description

[Detailed technical description of what will change]

**Current State:**
[How things work now]

**Desired State:**
[How things will work after change]

**Changes Required:**
1. [Specific change 1]
2. [Specific change 2]
3. [Specific change 3]

### Dependencies

**Upstream Dependencies:**
- [System/Change that must happen first]

**Downstream Dependencies:**
- [System/Change that depends on this]

**External Dependencies:**
- [Vendor/Third-party dependencies]

## Risk Assessment

### Risk Level: [Low/Medium/High/Critical]

**Potential Risks:**

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | Low/Med/High | Low/Med/High | [How to mitigate] |
| [Risk 2] | Low/Med/High | Low/Med/High | [How to mitigate] |

**Risk Score:** [Calculate: Likelihood × Impact]

### Impact Analysis

**User Impact:**
- Downtime: Yes / No
- If yes, duration: [X hours/minutes]
- User-facing changes: [Description]
- Number of users affected: [estimate]

**Service Impact:**
- Services affected: [List]
- Degraded performance: Yes / No
- Data migration required: Yes / No

**Business Impact:**
- Revenue impact: $[amount] or None
- SLA impact: Yes / No
- Customer communications needed: Yes / No

## Implementation Plan

### Maintenance Window

**Proposed Date:** YYYY-MM-DD  
**Proposed Time:** HH:MM - HH:MM [Timezone]  
**Duration:** [X hours Y minutes]

**Why this window:**
[Justification for chosen time]

### Pre-Implementation Checklist

- [ ] CAB approval obtained (if required)
- [ ] Stakeholders notified
- [ ] Backup completed and verified
- [ ] Test environment validated
- [ ] Rollback plan tested
- [ ] Communication drafted
- [ ] On-call engineer assigned

### Implementation Steps

**Step 1:** [Preparation] (Duration: X min)
```bash
# Commands or actions
```

**Step 2:** [Implementation] (Duration: X min)
```bash
# Commands or actions
```

**Step 3:** [Verification] (Duration: X min)
```bash
# Commands or actions
```

**Total Estimated Time:** [X hours Y minutes]

### Implementation Team

| Role | Name | Responsibility | Contact |
|------|------|----------------|---------|
| Change Owner | @username | Overall execution | [contact] |
| Technical Lead | @username | Implementation | [contact] |
| Observer | @username | Monitoring | [contact] |
| Approver | @username | Go/No-go decision | [contact] |

## Rollback Plan

**Rollback Trigger:**
[Under what conditions do we rollback?]

**Rollback Steps:**

1. **Stop Implementation**
```bash
   # Commands
```

2. **Restore Previous State**
```bash
   # Commands
```

3. **Verify Rollback**
```bash
   # Verification commands
```

**Rollback Time:** [Estimated duration]

**Point of No Return:** [After which step can we not rollback?]

## Testing & Validation

### Pre-Production Testing

- [ ] Tested in development environment on [DATE]
- [ ] Tested in staging environment on [DATE]
- [ ] Performance impact assessed
- [ ] Security review completed

**Test Results:**
[Summary of test outcomes]

### Post-Implementation Verification

**Success Criteria:**
- [ ] [Criterion 1 - measurable]
- [ ] [Criterion 2 - measurable]
- [ ] [Criterion 3 - measurable]

**Validation Steps:**
1. [Check X]
2. [Verify Y]
3. [Test Z]

## Communication Plan

### Pre-Change Communication

**To be sent:** [X days/hours] before change

**Recipients:**
- [ ] All users
- [ ] Affected teams
- [ ] Management
- [ ] External partners

**Channels:**
- [ ] Email
- [ ] Slack/Teams
- [ ] Status page
- [ ] In-app notification

**Draft Message:**
```
Subject: [Planned Maintenance on DATE]

[Message content]
```

### During Change Communication

**Update frequency:** Every [X minutes]

**Status page:** [Link]

### Post-Change Communication

**Success notification:**
[Template]

**If issues arise:**
[Escalation communication plan]

## Approval

### Change Advisory Board (if required)

**CAB Meeting Date:** YYYY-MM-DD  
**CAB Decision:** Approved / Rejected / Deferred

**Approvers:**
- [ ] Technical Lead: @username (YYYY-MM-DD)
- [ ] Security: @username (YYYY-MM-DD)
- [ ] Operations Manager: @username (YYYY-MM-DD)

### Emergency Change (if applicable)

**Emergency Justification:**
[Why this cannot wait for normal approval]

**Emergency Approver:** @username  
**Approved:** YYYY-MM-DD HH:MM

## Post-Implementation Review

**Implementation Date:** YYYY-MM-DD  
**Actual Duration:** [X hours Y minutes]  
**Status:** Success / Partial / Failed / Rolled Back

**Deviations from Plan:**
[Any differences from the planned implementation]

**Issues Encountered:**
[Problems that occurred]

**Lessons Learned:**
[What we learned]

**Follow-up Items:**
- [ ] [Action item 1] - Owner: @username
- [ ] [Action item 2] - Owner: @username

---

**Document Status:** [Current Status]  
**Last Updated:** YYYY-MM-DD  
**Next Review:** [If recurring change]