---
type: incident_report
kernel: incident
title: [Brief Incident Description]
incident_id: INC-YYYY-NNNN
severity: P1 | P2 | P3 | P4
owner: @username
date: YYYY-MM-DD
duration: [X hours Y minutes]
status: draft | under_review | published
tags: [system-tag, postmortem, severity-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system (postgresql, aws-rds, etc.), action=postmortem
# Recommended: severity (critical), env (production)
---

# Incident Report: [Brief Description]

**Incident ID:** INC-YYYY-NNNN  
**Severity:** P1 / P2 / P3 / P4  
**Date:** YYYY-MM-DD  
**Duration:** X hours Y minutes  
**Status:** Resolved / Mitigated / Monitoring

## Executive Summary

[2-3 sentence summary for leadership. Include:
- What happened
- Impact (users/revenue/systems)
- Current status
- Key action items]

**Impact:**
- Users affected: [number]
- Revenue impact: [amount]
- Services down: [list]
- Data loss: Yes / No / Partial

## Timeline

All times in **UTC** (or specify timezone).

| Time | Event | Action Taken | Owner |
|------|-------|--------------|-------|
| HH:MM | [First symptom detected] | [What was done] | @user |
| HH:MM | [Alert triggered] | [Response] | @user |
| HH:MM | [Issue escalated] | [Who was contacted] | @user |
| HH:MM | [Root cause identified] | [Analysis] | @user |
| HH:MM | [Fix implemented] | [What was changed] | @user |
| HH:MM | [Service restored] | [Verification] | @user |
| HH:MM | [Incident closed] | [Final checks] | @user |

## Impact Analysis

### User Impact

**Affected Users:** [number or percentage]
- [Describe user experience impact]
- [Specific functionalities unavailable]
- [Geographic regions affected]

**Customer Communications:**
- Status page updated: [timestamp]
- Email notification sent: [timestamp]
- Support tickets created: [number]

### Business Impact

**Financial:**
- Revenue loss estimate: $[amount]
- SLA credits issued: $[amount]
- Calculation basis: [explain]

**Operational:**
- [Team hours spent responding]
- [Resources consumed]
- [Other operational costs]

### Technical Impact

**Systems Affected:**
- [System 1]: [impact description]
- [System 2]: [impact description]
- [System 3]: [impact description]

**Data Impact:**
- Data loss: Yes / No
- If yes: [amount and type]
- Recovery: Complete / Partial / In Progress

## Root Cause Analysis

### What Happened

[Detailed technical explanation of what went wrong. Be specific about:
- Which component failed
- Why it failed
- How the failure propagated
- Why existing safeguards didn't prevent it]

### Why It Happened

**Immediate Cause:**
[Direct technical cause]

**Contributing Factors:**
1. [Factor 1 - e.g., insufficient monitoring]
2. [Factor 2 - e.g., outdated documentation]
3. [Factor 3 - e.g., manual process prone to error]

**Root Cause:**
[Underlying systemic issue that allowed this to happen]

### Why Wasn't It Detected Earlier?

[Analysis of detection gaps:
- Which monitors/alerts should have fired but didn't
- Why existing safeguards failed
- What would have enabled earlier detection]

## Resolution

### Immediate Actions Taken

1. **[Action 1]**
   - Time: HH:MM UTC
   - Owner: @username
   - Result: [outcome]

2. **[Action 2]**
   - Time: HH:MM UTC
   - Owner: @username
   - Result: [outcome]

3. **[Action 3]**
   - Time: HH:MM UTC
   - Owner: @username
   - Result: [outcome]

### Long-term Fix

[Description of permanent solution implemented or planned]

## Action Items

### Immediate (Within 24 hours)

- [ ] [Action item 1] - Owner: @username - Due: YYYY-MM-DD
- [ ] [Action item 2] - Owner: @username - Due: YYYY-MM-DD

### Short-term (Within 1 week)

- [ ] [Action item 3] - Owner: @username - Due: YYYY-MM-DD
- [ ] [Action item 4] - Owner: @username - Due: YYYY-MM-DD

### Long-term (Within 1 month)

- [ ] [Action item 5] - Owner: @username - Due: YYYY-MM-DD
- [ ] [Action item 6] - Owner: @username - Due: YYYY-MM-DD

### Process Improvements

- [ ] [Process change 1] - Owner: @username - Due: YYYY-MM-DD
- [ ] [Process change 2] - Owner: @username - Due: YYYY-MM-DD

## Lessons Learned

### What Went Well

- [Positive aspect 1]
- [Positive aspect 2]
- [Positive aspect 3]

### What Didn't Go Well

- [Issue 1]
- [Issue 2]
- [Issue 3]

### What We'll Do Differently

- [Change 1]
- [Change 2]
- [Change 3]

## Supporting Information

### Relevant Logs
```
[Include relevant log snippets or link to log files]
```

### Monitoring Data

[Links to dashboards, graphs, or screenshots showing the incident]

### Communication Threads

- Slack thread: [link]
- Email chain: [link]
- Status page: [link]

## Related Incidents

- [INC-YYYY-NNNN: Similar incident from DATE](link)
- [INC-YYYY-NNNN: Related component failure](link)

## Sign-off

**Technical Review:**
- [ ] Reviewed by: @tech-lead on YYYY-MM-DD
- [ ] Approved by: @engineering-manager on YYYY-MM-DD

**Management Review:**
- [ ] Reviewed by: @director on YYYY-MM-DD

**Action Items Tracking:**
- [ ] All action items created in [Jira/GitHub/etc]
- [ ] Owners assigned and due dates set
- [ ] Follow-up meeting scheduled: YYYY-MM-DD

---

**Document Status:** Draft / Under Review / Published  
**Last Updated:** YYYY-MM-DD  
**Next Review:** YYYY-MM-DD (30 days after all action items completed)