---
type: compliance_documentation
kernel: compliance
title: [Control Name and Identifier]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [framework-tag, compliance, audit]  # See standards/tag-taxonomy.md
# Required: 1+ framework (soc2, iso27001, gdpr), compliance action
# Recommended: control-id, risk-level
---

# [Control Name]: [Control ID]

**Framework:** [SOC2 / ISO27001 / GDPR / HIPAA / Other]
**Control ID:** [CC6.1 / A.12.4.1 / Art. 32 / etc.]
**Risk Level:** High / Medium / Low
**Process Owner:** @team-name

## Control Description

[Clear statement of the control objective. What must be true for compliance?
- What the control requires
- What it protects against
- Regulatory or contractual basis]

**Control Type:** Preventive / Detective / Corrective
**Automation Level:** Manual / Semi-automated / Fully automated

## Business Rationale

[Why this control matters to the business:
- What risk it mitigates
- Regulatory requirements it satisfies
- Customer or contractual obligations
- Cost of non-compliance]

**Related Risks:**
- [Risk 1: e.g., Unauthorized access to customer data]
- [Risk 2: e.g., Regulatory penalty for non-compliance]

## Implementation Procedure

### Prerequisites

- [ ] [Required access or permissions]
- [ ] [Required tools or systems]
- [ ] [Training completed]

### Step-by-Step Implementation

1. **[Step 1: Configure control]**

   [Detailed description]
```bash
# Configuration command or setting
config-command --setting value
```

2. **[Step 2: Verify configuration]**

   [How to confirm the control is active]
```bash
# Verification command
verify-command
```
   **Expected output:** `[Expected result]`

3. **[Step 3: Document implementation]**

   Record the implementation in [system/tool].

### Configuration Details

| Setting | Value | Purpose |
|---------|-------|---------|
| [Setting 1] | [Value] | [Why this value] |
| [Setting 2] | [Value] | [Why this value] |

## Monitoring Method

### Automated Monitoring

| Check | Frequency | Tool | Alert Target |
|-------|-----------|------|-------------|
| [Check 1] | [Real-time / Daily / Weekly] | [Tool] | @team-name |
| [Check 2] | [Frequency] | [Tool] | @team-name |

### Manual Checks

| Check | Frequency | Performer | Documentation |
|-------|-----------|-----------|---------------|
| [Check 1] | [Monthly / Quarterly] | @role | [Where to record] |
| [Check 2] | [Frequency] | @role | [Where to record] |

### Monitoring Queries

```
# Query to verify control effectiveness
[monitoring query or script]
```

## Reporting Cadence

| Report | Audience | Frequency | Format |
|--------|----------|-----------|--------|
| Control status | Management | Monthly | Dashboard |
| Compliance summary | Auditor | Quarterly | PDF report |
| Exception report | Risk team | On occurrence | Ticket |

**Reporting tool:** [Tool/system name]
**Report template:** [Link to template]

## Evidence Artifacts

### Required Evidence

| Evidence | Format | Retention | Storage |
|----------|--------|-----------|---------|
| [Config screenshots] | PNG/PDF | [X years] | [Location] |
| [Access review logs] | CSV/JSON | [X years] | [Location] |
| [Approval records] | Email/ticket | [X years] | [Location] |
| [Test results] | Report | [X years] | [Location] |

### How to Collect Evidence

1. **[Evidence type 1]:**
```bash
# Command to generate evidence
export-command --format csv --output evidence-YYYY-MM.csv
```

2. **[Evidence type 2]:**
   Navigate to [system] → [section] → Export

### Evidence Storage

- **Primary:** [Storage location with path]
- **Retention period:** [X years per policy]
- **Access control:** [Who can access evidence]

## Exception Process

### When Exceptions Are Allowed

- [Circumstance 1: e.g., Legacy system cannot support control]
- [Circumstance 2: e.g., Temporary business need with compensating control]

### Exception Request Process

1. Submit exception request to @risk-team via [system/process]
2. Document compensating controls
3. Define exception expiration date (max [X months])
4. Obtain approval from [role/team]

### Active Exceptions

| Exception | Reason | Compensating Control | Expiry |
|-----------|--------|---------------------|--------|
| [None currently] | — | — | — |

## Review and Update

### Review Triggers

- [ ] Scheduled review (every 30 days)
- [ ] Framework version update
- [ ] Regulatory change
- [ ] Audit finding
- [ ] Security incident related to this control

### Review Checklist

- [ ] Control still addresses current risk
- [ ] Implementation matches documentation
- [ ] Evidence collection is current
- [ ] Monitoring alerts are functional
- [ ] Exception list is current
- [ ] Responsible parties are still assigned

## Related Documentation

- [Risk assessment](../path/to/risk-assessment.md)
- [Security baseline](../runbooks/security-baseline.md)
- [Access review procedure](../runbooks/access-review.md)
- [Audit preparation guide](../runbooks/audit-prep.md)

## Maintenance

**Review Schedule:** Every 30 days

**Last Reviewed By:** @username on YYYY-MM-DD

**Last Audit:** YYYY-MM-DD — [Pass / Findings noted]

**Changelog:**
- YYYY-MM-DD: Initial creation
- YYYY-MM-DD: Updated [section] per audit finding
