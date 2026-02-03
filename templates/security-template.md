---
type: security_advisory
kernel: security
title: [CVE-YYYY-NNNNN or Brief Vulnerability Description]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [system-tag, security, severity-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system (postgresql, kubernetes, etc.), security action
# Recommended: severity (critical, standard), cve identifier
---

# Security Advisory: [Brief Title]

**Advisory ID:** [SA-YYYY-NNNN or CVE-YYYY-NNNNN]
**Published:** YYYY-MM-DD
**Last Updated:** YYYY-MM-DD

## Severity and CVSS

| Field | Value |
|-------|-------|
| **Severity** | Critical / High / Medium / Low |
| **CVSS Score** | [X.X] |
| **CVSS Vector** | `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H` |
| **Exploitability** | [Active exploitation / Proof of concept / Theoretical] |

## Affected Systems

| System | Affected Versions | Fixed Version | Status |
|--------|-------------------|---------------|--------|
| [System/Package 1] | [< X.X.X] | [X.X.X] | [Patch available / Pending] |
| [System/Package 2] | [< Y.Y.Y] | [Y.Y.Y] | [Patch available / Pending] |

**Our exposure:**
- [ ] [Environment 1]: [Affected / Not affected / Mitigated]
- [ ] [Environment 2]: [Affected / Not affected / Mitigated]

## Vulnerability Description

[Clear, factual description of the vulnerability. Include:
- What the vulnerability is
- How it can be exploited (without providing exploit details)
- What conditions are required for exploitation
- Attack vector (network, local, physical)]

**Root Cause:**
[Technical explanation of the underlying flaw]

## Impact Analysis

### Confidentiality
[What data could be exposed? Who is affected?]

### Integrity
[What data or systems could be modified?]

### Availability
[What services could be disrupted?]

### Business Impact
- **Data at risk:** [Type and volume of data]
- **Users affected:** [Number and scope]
- **Regulatory implications:** [GDPR, SOC2, etc.]
- **Estimated financial impact:** [If applicable]

## Remediation Steps

### Immediate Actions (Within [X] Hours)

1. **[Action 1: e.g., Apply patch]**
```bash
# Command to apply fix
upgrade-command --version X.X.X
```
   **Verification:**
```bash
# Verify fix applied
version-check-command
```
   Expected: `version X.X.X`

2. **[Action 2: e.g., Apply workaround if patch unavailable]**
```bash
# Temporary mitigation
config-change-command
```

### Short-Term Actions (Within [X] Days)

- [ ] Patch all affected environments
- [ ] Verify patches applied successfully
- [ ] Review logs for signs of exploitation
- [ ] Update monitoring and alerting rules

### Long-Term Actions

- [ ] Review and harden related configurations
- [ ] Update security baseline documentation
- [ ] Schedule follow-up vulnerability scan
- [ ] Update incident response procedures if needed

## Detection Guidance

### Indicators of Compromise (IOC)

| Type | Value | Description |
|------|-------|-------------|
| Log pattern | `[pattern]` | Indicates exploitation attempt |
| Network traffic | `[signature]` | Suspicious outbound connection |
| File hash | `[SHA256]` | Known malicious payload |

### Monitoring Queries

```
# [SIEM/log query to detect exploitation]
search index=security sourcetype=[type]
| where [condition]
| stats count by src_ip, dest_ip
```

### What to Do If Exploitation Is Detected

1. Isolate affected system immediately
2. Preserve logs and forensic evidence
3. Escalate to security team: @security-team
4. Follow incident response process

## Timeline and Disclosure

| Date | Event |
|------|-------|
| YYYY-MM-DD | Vulnerability discovered / reported |
| YYYY-MM-DD | Vendor notified |
| YYYY-MM-DD | Patch released by vendor |
| YYYY-MM-DD | Internal assessment completed |
| YYYY-MM-DD | Remediation started |
| YYYY-MM-DD | Remediation completed |
| YYYY-MM-DD | Public disclosure |

## References

- [CVE entry](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-YYYY-NNNNN)
- [Vendor advisory](https://example.com/security-advisory)
- [NVD entry](https://nvd.nist.gov/vuln/detail/CVE-YYYY-NNNNN)
- [Internal incident report](../incidents/related-incident.md) (if applicable)

## Related Documentation

- [Security baseline](../runbooks/security-baseline.md)
- [Incident response process](../standards/review-process.md)
- [Patch management procedure](../runbooks/patch-management.md)

## Maintenance

**Review Schedule:** Every 30 days until fully remediated, then archive

**Last Reviewed By:** @username on YYYY-MM-DD

**Changelog:**
- YYYY-MM-DD: Initial advisory published
- YYYY-MM-DD: Updated remediation status
