---
type: incident_report
kernel: incident
title: Database Primary Failure and Failover Delay
incident_id: INC-2026-042
severity: P1
owner: @jsmith
created: 2026-04-15
last_updated: 2026-04-20
date: 2026-04-15
duration: 2 hours 22 minutes
status: published
tags: [postgresql, aws-rds, postmortem, failover, critical, production]
---

# Incident Report: Database Primary Failure and Failover Delay

**Incident ID:** INC-2026-042
**Severity:** P1 (Critical)
**Date:** 2026-04-15
**Duration:** 2 hours 22 minutes  
**Status:** Resolved

## Executive Summary

On April 15, 2026, our production PostgreSQL database primary instance failed due to disk space exhaustion. The automatic failover to standby did not trigger as expected due to a misconfigured health check. Manual intervention was required, resulting in 142 minutes of total downtime affecting 3,400 users and approximately $15,000 in lost revenue.

**Impact:**
- Users affected: 3,400 (23% of active users)
- Revenue impact: ~$15,000
- Services down: order-service, user-service, payment-service
- Data loss: None (WAL replay successful)

## Timeline

All times in **UTC**.

| Time | Event | Action Taken | Owner |
|------|-------|--------------|-------|
| 14:23 | Monitoring alerts: Database primary unresponsive | PagerDuty alert sent to on-call | System |
| 14:25 | On-call engineer paged | Acknowledged alert, began investigation | @jsmith |
| 14:28 | CloudWatch shows disk space at 100% | Identified root cause: disk full | @jsmith |
| 14:30 | Confirmed primary down, checked standby status | Standby healthy but not promoted | @jsmith |
| 14:35 | Attempted automatic failover via AWS console | Failover button disabled (health check failing) | @jsmith |
| 14:40 | Escalated to database team lead | @mwilson joined incident response | @jsmith |
| 14:45 | Investigated why automatic failover didn't trigger | Found health check misconfiguration | @mwilson |
| 14:50 | Decided on manual failover | Obtained approval from engineering manager | @mwilson |
| 15:00 | Initiated manual failover | Executed AWS RDS modify-db-instance command | @mwilson |
| 15:15 | Standby promotion in progress | Monitoring promotion status | @jsmith |
| 15:30 | New primary accepting connections | Verified write operations working | @jsmith |
| 15:35 | Restarted application services | order-service, user-service, payment-service | @jsmith |
| 15:45 | Services healthy, processing backlog | Monitoring error rates and latency | @jsmith |
| 16:00 | Customer support notified of resolution | Status page updated | @tchen |
| 16:30 | Cleaned up disk space on old primary | Deleted old WAL logs, vacuum analyzed | @mwilson |
| 16:45 | Incident declared resolved | All systems operational | @jsmith |

## Impact Analysis

### User Impact

**Affected Users:** 3,400 users (23% of our active user base at the time)

**User Experience:**
- Unable to place orders (order-service down)
- Unable to login/logout (user-service down)
- Payment processing failed (payment-service down)
- API returned 503 Service Unavailable

**Geographic Distribution:**
- North America: 2,100 users
- Europe: 900 users
- Asia-Pacific: 400 users

**Customer Communications:**
- Status page updated at 14:35 UTC: "Investigating database connectivity issues"
- Status page updated at 16:00 UTC: "Systems restored, monitoring closely"
- Email notification sent at 16:15 UTC to all affected customers
- Support tickets created: 47 (unusually high volume)

### Business Impact

**Financial:**
- Direct revenue loss: $15,000 (estimated based on average order value × lost orders)
- SLA credits to be issued: $8,500 (Enterprise customers with 99.9% uptime SLA)
- Calculation basis: 142 minutes downtime = 0.098% monthly uptime miss

**Operational:**
- Engineering hours spent responding: 8 person-hours (2 engineers × 4 hours)
- Support hours handling tickets: 12 person-hours
- Scheduled maintenance deferred: 1 day (team exhausted post-incident)

**Reputational:**
- Social media mentions: 12 tweets (mostly negative but respectful)
- Customer complaints: Moderate (most understanding after explanation)
- Churn risk: Low (no immediate cancellations)

### Technical Impact

**Systems Affected:**
- **order-service:** Complete outage (depends on database writes)
- **user-service:** Complete outage (authentication requires database)
- **payment-service:** Complete outage (transaction logging to database)
- **notification-service:** Degraded (queue backup, 2-hour delay)
- **analytics-service:** Unaffected (uses read replica)

**Data Impact:**
- Data loss: **None** - PostgreSQL WAL replay recovered all committed transactions
- Data inconsistency: **None** - All transactions either fully committed or rolled back
- Backup integrity: **Verified** - Latest backup from 14:00 UTC tested successfully

## Root Cause Analysis

### What Happened

The PostgreSQL primary database instance ran out of disk space due to excessive Write-Ahead Log (WAL) file accumulation. This caused the database to become unresponsive as it could not write new WAL files.

**Technical Details:**
- Database: PostgreSQL 14.2 on AWS RDS (db.r5.2xlarge)
- Disk: 500 GB gp3 EBS volume
- Disk usage at failure: 100% (500 GB / 500 GB)
- WAL files accumulated: 147 GB (should have been ~20 GB)
- WAL archiving: Delayed by 6 hours (normally near real-time)

**Sequence of failure:**
1. WAL archiving to S3 slowed down (unknown cause - investigating separately)
2. WAL files accumulated on local disk over 6-hour period
3. Disk reached 100% capacity
4. PostgreSQL unable to write new WAL files
5. Database became unresponsive, refusing new connections
6. Application services started failing health checks
7. PagerDuty alerts triggered

### Why It Happened

**Immediate Cause:**
Disk space exhaustion due to WAL file accumulation

**Contributing Factors:**

1. **WAL Archiving Slowdown**
   - S3 upload speeds degraded (AWS had intermittent S3 issues in us-east-1)
   - No monitoring on WAL archiving lag
   - Archiving fell behind by 6 hours before we noticed

2. **Insufficient Disk Monitoring**
   - Alert threshold set at 90% disk usage
   - Alert was in "warning" state, not "critical"
   - No automated remediation (e.g., cleanup old WAL files)
   - On-call engineer had alert fatigue - dismissed 90% warning

3. **Automatic Failover Misconfiguration**
   - RDS health check relied on disk space metric
   - Standby couldn't be auto-promoted because primary wasn't marked "failed"
   - Configuration error from recent maintenance window (October 1)
   - Change wasn't properly tested in staging

4. **Manual Process Inefficiency**
   - Manual failover procedure not well-documented
   - Database team lead needed to be consulted (knowledge not distributed)
   - AWS console UI confusing under pressure

**Root Cause:**
A combination of insufficient monitoring (WAL archiving lag), inadequate alert thresholds (disk space), and misconfigured automatic failover prevented rapid recovery from a preventable disk space issue.

### Why Wasn't It Detected Earlier?

**Detection Gaps:**

1. **WAL Archiving Lag Not Monitored**
   - We had no alerting on `archive_command` failures
   - PostgreSQL logs showed warnings but weren't parsed by monitoring
   - Should have alerted when lag exceeded 1 hour

2. **Disk Space Alert Threshold Too High**
   - 90% threshold gave only 50 GB buffer
   - With WAL accumulation rate of ~8 GB/hour during peak, this left only 6 hours
   - Should have been 80% with critical at 85%

3. **Failover Configuration Not Validated**
   - Post-maintenance testing didn't include failover simulation
   - Assumed AWS RDS automatic failover "just works"
   - Should have quarterly DR drills

## Resolution

### Immediate Actions Taken

1. **Identified Root Cause (14:28 UTC)**
   - Time: 14:28 UTC
   - Owner: @jsmith
   - Action: Checked CloudWatch metrics, identified disk at 100%
   - Result: Confirmed disk space exhaustion as cause

2. **Attempted Automatic Failover (14:35 UTC)**
   - Time: 14:35 UTC
   - Owner: @jsmith
   - Action: Tried to trigger AWS RDS failover via console
   - Result: Failed - button disabled due to health check config

3. **Escalated to Database Expert (14:40 UTC)**
   - Time: 14:40 UTC
   - Owner: @jsmith
   - Action: Paged @mwilson (database team lead)
   - Result: Additional expertise brought to incident

4. **Executed Manual Failover (15:00 UTC)**
   - Time: 15:00 UTC
   - Owner: @mwilson
   - Action: Ran AWS CLI command to force failover
```bash
     aws rds reboot-db-instance \
       --db-instance-identifier prod-postgres-primary \
       --force-failover
```
   - Result: Standby began promotion to primary

5. **Verified New Primary (15:30 UTC)**
   - Time: 15:30 UTC
   - Owner: @jsmith
   - Action: Tested write operations, verified WAL replay complete
   - Result: Database accepting connections, all data intact

6. **Restarted Application Services (15:35 UTC)**
   - Time: 15:35 UTC
   - Owner: @jsmith
   - Action: Rolled restart of order-service, user-service, payment-service pods
   - Result: Services reconnected to new primary successfully

7. **Cleared Backlog (15:45 UTC)**
   - Time: 15:45 UTC
   - Owner: @jsmith
   - Action: Monitored queue depths, allowed system to process delayed jobs
   - Result: All queues cleared within 30 minutes

### Long-term Fix

**Implemented within 24 hours:**
- Increased disk size from 500 GB → 1 TB (more buffer)
- Lowered disk alert threshold to 80% (warning) and 85% (critical)
- Fixed RDS health check configuration for proper automatic failover
- Added WAL archiving lag monitoring (alert at >1 hour lag)

**Planned for next week:**
- Automate WAL cleanup script (if archiving lags, clean old files)
- Document manual failover procedure clearly
- Train additional team members on database failover

## Action Items

### Immediate (Completed within 48 hours)

- [x] Increase RDS disk from 500 GB to 1 TB - Owner: @mwilson - Due: 2026-04-16 - ✅ **Completed**
- [x] Fix automatic failover health check config - Owner: @mwilson - Due: 2026-04-16 - ✅ **Completed**
- [x] Add WAL archiving lag monitoring - Owner: @pgupta - Due: 2026-04-17 - ✅ **Completed**
- [x] Lower disk space alert thresholds (80%/85%) - Owner: @pgupta - Due: 2026-04-17 - ✅ **Completed**

### Short-term (Within 1 week)

- [x] Create automated WAL cleanup script - Owner: @mwilson - Due: 2026-04-22 - ✅ **Completed**
- [x] Document manual failover procedure - Owner: @jsmith - Due: 2026-04-22 - ✅ **Completed** (See: runbooks/rds-manual-failover.md)
- [ ] Train 2 additional engineers on database operations - Owner: @mwilson - Due: 2026-04-25 - **In Progress**
- [ ] Test failover in staging environment - Owner: @mwilson - Due: 2026-04-25

### Long-term (Within 1 month)

- [ ] Implement quarterly DR drills - Owner: @mwilson - Due: 2026-05-15
- [ ] Review all AWS RDS configurations - Owner: @mwilson - Due: 2026-05-15
- [ ] Evaluate upgrading to PostgreSQL 15 (better WAL management) - Owner: @mwilson - Due: 2026-05-30
- [ ] Create runbook for all P1 database scenarios - Owner: @jsmith - Due: 2026-05-30

### Process Improvements

- [x] Update on-call playbook with database section - Owner: @jsmith - Due: 2026-04-20 - ✅ **Completed**
- [ ] Add database failover to monthly game day exercises - Owner: @sre-team - Due: 2026-05-01
- [ ] Improve alert escalation (skip "warning" for critical systems) - Owner: @pgupta - Due: 2026-05-15

## Lessons Learned

### What Went Well

- **Fast initial response:** On-call engineer acknowledged within 2 minutes
- **Good communication:** Status page updated promptly
- **No data loss:** PostgreSQL WAL replay worked perfectly
- **Team collaboration:** Engineers from multiple teams coordinated well
- **Customer understanding:** Most customers appreciated transparency

### What Didn't Go Well

- **Automatic failover failed:** Should have worked but didn't due to config error
- **Alert fatigue:** 90% disk warning was ignored/dismissed
- **Knowledge silos:** Only one person knew how to do manual failover
- **Testing gaps:** Failover config change wasn't validated
- **Documentation lacking:** No clear runbook for this scenario

### What We'll Do Differently

- **Quarterly DR drills:** Practice all failure scenarios regularly
- **Validate all changes:** Test failover after every maintenance window
- **Distribute knowledge:** Train multiple engineers on critical operations
- **Better monitoring:** Monitor not just metrics but also system behaviors (WAL archiving)
- **Automate remediation:** Don't just alert - auto-fix when safe
- **Lower alert thresholds:** Critical systems need earlier warnings
- **Runbooks for everything:** Document all P1 scenarios

## Supporting Information

### Relevant Logs

**PostgreSQL Error Log (14:20-14:30 UTC):**
```
2026-04-15 14:23:15 UTC [12345]: ERROR:  could not write to file "pg_wal/000000010000012C000000AB": No space left on device
2026-04-15 14:23:16 UTC [12346]: FATAL:  could not create file "pg_wal/000000010000012C000000AC": No space left on device
2026-04-15 14:23:17 UTC [12347]: ERROR:  could not extend file "base/16384/12345.1": No space left on device
2026-04-15 14:28:45 UTC [12348]: LOG:  database system is shut down
```

**Application Log (order-service, 14:25 UTC):**
```
2026-04-15 14:25:32 ERROR [DBConnection] - Connection to database failed: could not connect to server
2026-04-15 14:25:33 ERROR [HealthCheck] - Health check failed: database unreachable
2026-04-15 14:25:34 INFO  [Kubernetes] - Readiness probe failed, removing pod from service
```

### Monitoring Data

**Grafana Dashboards:**
- [Database Metrics Dashboard](https://grafana.company.com/d/database-metrics?from=1697371200000&to=1697380000000)
- [Application Health Dashboard](https://grafana.company.com/d/app-health?from=1697371200000&to=1697380000000)

**CloudWatch Metrics:**
- Disk usage graph shows linear increase from 85% → 100% over 6 hours
- WAL archiving lag graph shows increase from 15 min → 6 hours
- Database connections dropped to 0 at 14:23 UTC

### Communication Threads

- Slack #incidents channel: https://company.slack.com/archives/incidents/p1697371380
- Status page: https://status.company.com/incidents/2026-04-15-database
- Customer email: Sent via Intercom to 3,400 affected users

## Related Incidents

- [INC-2026-018: Database connection pool exhaustion (2026-01-12)](2026-01-12-db-connection-pool.md)
- [INC-2025-089: AWS RDS maintenance caused brief downtime (2025-05-03)](2025-05-03-rds-maintenance.md)

**Pattern:** This is our 3rd database-related P1 incident in 18 months. Need comprehensive database reliability review.

## Sign-off

**Technical Review:**
- [x] Reviewed by: @mwilson on 2026-04-18
- [x] Approved by: @engineering-manager on 2026-04-19

**Management Review:**
- [x] Reviewed by: @vp-engineering on 2026-04-20

**Action Items Tracking:**
- [x] All action items created in Jira (Epic: ENG-2104)
- [x] Owners assigned and due dates set
- [x] Follow-up meeting scheduled: 2026-05-15 (30-day review)

---

**Document Status:** Published  
**Last Updated:** 2026-04-20  
**Next Review:** 2026-05-15 (after all action items completed)