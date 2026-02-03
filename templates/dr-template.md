---
type: disaster_recovery_plan
kernel: dr
title: [System/Service] Disaster Recovery Plan
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [system-tag, disaster-recovery, severity-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system (postgresql, kubernetes, etc.), disaster-recovery action
# Recommended: severity (critical, standard), environment (production)
---

# [System/Service] Disaster Recovery Plan

**RTO (Recovery Time Objective):** [X hours]
**RPO (Recovery Point Objective):** [X hours]
**Last Tested:** YYYY-MM-DD
**Next Test:** YYYY-MM-DD

## Scenario Definition

### Covered Scenarios

| Scenario | Likelihood | Impact | RTO | RPO |
|----------|------------|--------|-----|-----|
| [Complete system failure] | Low | Critical | [X hours] | [X hours] |
| [Data corruption] | Medium | High | [X hours] | [X hours] |
| [Region outage] | Low | Critical | [X hours] | [X hours] |
| [Network partition] | Medium | Medium | [X hours] | [X hours] |

### Out of Scope

- [Scenario not covered and why]
- [Scenario handled by different plan]

### Dependencies

| System | Purpose | DR Contact | SLA |
|--------|---------|------------|-----|
| [System 1] | [Role in recovery] | @team | [X hours] |
| [System 2] | [Role in recovery] | @team | [X hours] |

## Initial Response

### Activation Criteria

This plan is activated when:
- [ ] [Condition 1: e.g., Primary system unresponsive for > 15 minutes]
- [ ] [Condition 2: e.g., Data integrity check fails]
- [ ] [Condition 3: e.g., Region-level outage confirmed]

### Roles and Responsibilities

| Role | Primary | Backup | Responsibilities |
|------|---------|--------|-----------------|
| Incident Commander | @person1 | @person2 | Decision-making, coordination |
| Technical Lead | @person3 | @person4 | Recovery execution |
| Communications Lead | @person5 | @person6 | Stakeholder updates |
| Operations | @team | — | System monitoring, validation |

### Contact Tree

```
Incident Commander (@person1)
├── Technical Lead (@person3)
│   ├── DBA (@person7)
│   └── SRE (@person8)
├── Communications Lead (@person5)
│   ├── Customer Support (@team)
│   └── Management (@person9)
└── Vendor Support
    └── [Vendor]: [24/7 number]
```

### First 15 Minutes

1. **Confirm the disaster** — verify it's not a false alarm
```bash
# Health check commands
health-check-command
status-check-command
```

2. **Activate incident response** — page the team
```bash
# Page the DR team
page-command --team dr-team --severity critical
```

3. **Assess scope** — determine which scenarios apply
4. **Begin communication** — notify stakeholders per communication plan

## Assessment Procedure

### Damage Assessment Checklist

- [ ] What systems are affected?
- [ ] What data is at risk or lost?
- [ ] What is the blast radius?
- [ ] Is the root cause identified?
- [ ] Is the situation stable or still evolving?

### Assessment Commands

```bash
# Check system status
system-status-command

# Check data integrity
data-integrity-check --verbose

# Check backup availability
backup-list-command --latest
```

### Decision Matrix

| Situation | Action |
|-----------|--------|
| Primary down, standby available | Failover to standby |
| Data corrupted, backup valid | Restore from backup |
| Region outage | Activate secondary region |
| All backups compromised | Escalate to vendor support |

## Recovery Steps

### Scenario 1: [Primary System Failure]

#### Step 1: Initiate Failover

```bash
# Failover command
failover-command --target standby --confirm
```

**Expected output:**
```
Failover initiated. Target: standby
Status: IN PROGRESS
```

**Verification:**
```bash
# Verify failover status
failover-status-command
```

#### Step 2: Verify Data Integrity

```bash
# Run integrity checks
data-check-command --full
```

**Expected:** All checks pass

#### Step 3: Redirect Traffic

```bash
# Update DNS/load balancer
dns-update-command --target standby-endpoint
```

**Time to propagation:** ~[X minutes]

#### Step 4: Verify Service Recovery

```bash
# End-to-end test
smoke-test-command --environment production
```

### Scenario 2: [Data Corruption / Restore from Backup]

#### Step 1: Stop Writes to Affected System

```bash
# Enable read-only mode
set-readonly-command --enable
```

#### Step 2: Identify Recovery Point

```bash
# List available backups
backup-list-command --last 48h
```

#### Step 3: Restore from Backup

```bash
# Restore to specific point in time
restore-command --backup-id [BACKUP_ID] --target-time "YYYY-MM-DD HH:MM:SS UTC"
```

#### Step 4: Verify and Resume

```bash
# Verify data integrity after restore
data-check-command --full

# Re-enable writes
set-readonly-command --disable
```

## Validation Checklist

After recovery, verify each item before declaring resolution:

### System Validation

- [ ] All services responding to health checks
- [ ] Database connections established
- [ ] No error rate increase in monitoring
- [ ] Latency within acceptable thresholds

### Data Validation

- [ ] Data integrity checks pass
- [ ] No data loss beyond RPO
- [ ] Replication caught up (if applicable)
- [ ] Backup schedule resumed

### Functional Validation

- [ ] End-to-end smoke tests pass
- [ ] Critical business processes verified
- [ ] Authentication/authorization working
- [ ] External integrations functional

## Communication Plan

### Internal Communication

| When | Audience | Channel | Template |
|------|----------|---------|----------|
| Disaster confirmed | Engineering | #incident-channel | "DR activated for [system]. IC: @person1. Updates every [X min]." |
| Recovery started | Engineering + Mgmt | #incident-channel + email | "Recovery in progress. ETA: [time]. Impact: [scope]." |
| Recovery complete | All stakeholders | Email + Slack | "Service restored at [time]. [Brief summary]. Post-mortem to follow." |

### External Communication

| When | Audience | Channel | Owner |
|------|----------|---------|-------|
| Outage confirmed | Customers | Status page | @comms-lead |
| Updates | Customers | Status page | @comms-lead |
| Resolution | Customers | Status page + email | @comms-lead |

### Status Page Templates

**Investigating:**
> We are investigating reports of [issue]. We will provide updates as we learn more.

**Identified:**
> The issue has been identified. [Brief description]. We are working on recovery. ETA: [time].

**Resolved:**
> The issue has been resolved. Service was restored at [time]. Total downtime: [duration].

## Post-Recovery Actions

### Immediate (Within 24 Hours)

- [ ] Confirm all monitoring alerts are green
- [ ] Review logs for any lingering issues
- [ ] Document what happened (timeline + decisions)
- [ ] Restore primary system if failed over
- [ ] Resume normal backup schedule

### Follow-Up (Within 1 Week)

- [ ] Conduct post-mortem
- [ ] Update DR plan with lessons learned
- [ ] File action items for improvements
- [ ] Test repaired primary system
- [ ] Communicate learnings to team

### Long-Term

- [ ] Address root cause permanently
- [ ] Update runbooks based on findings
- [ ] Schedule additional DR tests if gaps found

## Testing Schedule

### Test Types

| Test | Frequency | Duration | Participants |
|------|-----------|----------|-------------|
| Tabletop exercise | Quarterly | 1 hour | DR team |
| Failover drill | Semi-annually | 2-4 hours | DR team + SRE |
| Full DR test | Annually | 4-8 hours | All stakeholders |
| Backup restore test | Monthly | 1 hour | DBA team |

### Test Procedure

1. **Preparation:**
   - Schedule maintenance window (for full tests)
   - Notify stakeholders
   - Prepare test environment

2. **Execution:**
   - Follow recovery steps exactly as documented
   - Record time for each step
   - Note any deviations or issues

3. **Evaluation:**
   - Compare actual RTO/RPO to targets
   - Document gaps and failures
   - Update plan based on findings

### Last Test Results

| Test | Date | RTO Achieved | RPO Achieved | Issues Found |
|------|------|-------------|-------------|-------------|
| [Test type] | YYYY-MM-DD | [X hours] | [X hours] | [Brief summary] |

## Related Documentation

- [System architecture](../adr/related-adr.md)
- [Backup procedures](../runbooks/backup-procedure.md)
- [Incident response process](../standards/review-process.md)
- [On-call rotation](../runbooks/oncall-schedule.md)

## Maintenance

**Review Schedule:** Every 30 days

**Last Reviewed By:** @username on YYYY-MM-DD

**Changelog:**
- YYYY-MM-DD: Initial creation
- YYYY-MM-DD: Updated recovery steps after DR test
