# Documentation Conventions

## Frontmatter (Required)

Every document MUST have YAML frontmatter:

```yaml
---
type: technical_documentation | architecture_decision_record | incident_report | knowledge_base_article
kernel: techdoc | adr | incident | kb | api | onboard | security | compliance | iac | dr | change | concept
title: Descriptive Title
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
status: draft | active | deprecated | archived
tags: [system-tag, action-tag, optional-tags]  # minimum 3
---
```

Type-specific fields:
- **ADRs:** `adr_number: NNNN`, `supersedes:`, `superseded_by:`
- **Incidents:** `incident_id: INC-YYYY-NNNN`, `severity: P1|P2|P3|P4`, `duration:`
- **KB articles:** `kb_id: KB-NNNN`, `category:`, `difficulty:`, `audience:`

## File Naming

| Type | Pattern | Example |
|------|---------|---------|
| Runbooks | `action-description.md` | `deploy-to-production.md` |
| ADRs | `NNNN-brief-title.md` | `0001-use-postgresql.md` |
| Incidents | `YYYY-MM-DD-brief-description.md` | `2026-04-15-database-outage.md` |
| KB articles | `descriptive-name.md` | `vpn-connection-troubleshooting.md` |

All lowercase with hyphens. No spaces, no underscores.

## Section Order by Template

**Runbooks:** Overview, Prerequisites, Procedure, Verification, Troubleshooting, Rollback, Notes, Related Docs, Maintenance

**ADRs:** Status, Context, Decision Drivers, Options, Decision, Consequences, Implementation, Compliance, Related Decisions (immutable once accepted)

**KB articles:** Problem, Quick Solution, Detailed Solutions, Root Cause, Prevention, Troubleshooting, Escalation, Related Articles (solution-first, explanation-second)

**Incidents:** Executive Summary, Timeline (UTC), Impact, Root Cause, Resolution, Action Items, Lessons Learned, Supporting Info, Sign-off

## Style Rules

- Active voice, present tense, sentence case headings
- Commands must be copy-paste ready with expected output shown
- Tags: lowercase with hyphens, from `standards/tag-taxonomy.md` only
- Links: relative paths, descriptive text (never "click here")
- Every document ends with "Related Documentation" section
