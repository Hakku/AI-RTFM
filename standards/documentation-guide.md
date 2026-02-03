---
title: Documentation Standards Guide
owner: @team-lead
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
status: active
---

# Documentation Standards Guide

This document defines our team's documentation standards.

## General Principles

### 1. Write for Your Audience

**End Users:**
- No technical jargon
- Step-by-step instructions with screenshots
- Solution first, explanation second

**Technical Staff:**
- Technical accuracy
- Command-line examples
- Understands context

**Management:**
- Executive summary
- Business impact
- Clear recommendations

### 2. Be Clear and Concise

✅ **Good:**
```
Run the deployment script:
./deploy.sh production
```

❌ **Bad:**
```
You might want to consider running the deployment script
that we use for deploying to production, which would be
something like ./deploy.sh production.
```

### 3. Keep It Current

- Update the document whenever the process changes
- Review cycle: 30 days for active documents
- Mark deprecated documents clearly

## Document Types and Usage

| Type | When | Template | Location |
|------|------|----------|----------|
| **Runbook** | Operational procedures | techdoc-template.md | /runbooks/ |
| **Incident Report** | After an incident | incident-template.md | /incidents/ |
| **ADR** | Architecture decision | adr-template.md | /adr/ |
| **KB Article** | Self-service support | kb-template.md | /kb/ |
| **Change Request** | Production change | change-template.md | (ticket system) |
| **API Docs** | Developer documentation | api-template.md | /api/ |
| **Onboarding** | New hire guides | onboard-template.md | (custom) |
| **Security Advisory** | Vulnerability communication | security-template.md | (custom) |
| **Compliance** | Audit documentation | compliance-template.md | (custom) |
| **IaC** | Infrastructure code docs | iac-template.md | (custom) |
| **DR Plan** | Disaster recovery | dr-template.md | (custom) |
| **Concept** | Background explanations | concept-template.md | (custom) |

## Frontmatter Requirements

**Every document MUST include:**
```yaml
---
type: [document_type]
title: [Descriptive Title]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
status: draft | active | deprecated
tags: [relevant, tags]
---
```

**Optional fields:**
```yaml
review_cycle: 30_days
related_docs: [link1, link2]
audience: [end-users | admins | developers]
```

## Naming Conventions

### File Naming

**Format:** `lowercase-with-dashes.md`

✅ **Good:**
- `deploy-to-production.md`
- `database-backup-procedure.md`
- `vpn-troubleshooting.md`

❌ **Bad:**
- `Deploy_To_Production.md`
- `database backup procedure.md`
- `VPN-TROUBLESHOOTING.MD`

### ADR Numbering

**Format:** `NNNN-brief-title.md`
```
adr/
├── 0001-use-postgresql.md
├── 0002-kubernetes-deployment.md
└── 0003-adopt-graphql.md
```

### Incident Reports

**Format:** `YYYY-MM-DD-brief-description.md`
```
incidents/
├── 2026-04-15-database-outage.md
└── 2026-03-20-api-rate-limit.md
```

## Language and Style

### Use active voice

✅ **Active:** "Run the command"
❌ **Passive:** "The command should be run"

### Use present tense

✅ **Present:** "The system generates a token"
❌ **Past:** "The system generated a token"

### Avoid

- "Please", "kindly" (unnecessary)
- "Simply", "just", "easy" (minimizing)
- "Obviously", "clearly" (assumes knowledge)
- Gendered pronouns (use "they")

### Headings

**Use sentence case:**

✅ "How to deploy to production"
❌ "How To Deploy To Production"

**Headings describe content:**

✅ "Troubleshooting VPN connection errors"
❌ "Issues"

## Code Blocks and Commands

### Copy-paste ready

**Include everything needed:**
```bash
# Good - complete command
kubectl apply -f deployment.yaml --namespace production

# Bad - incomplete
kubectl apply -f deployment.yaml
```

### Show expected output
```bash
curl -X GET https://api.example.com/health

# Expected output:
# {"status": "healthy", "version": "2.1.0"}
```

### Comment complex commands
```bash
# Backup database before migration
pg_dump -h localhost -U postgres mydb > backup.sql

# Run migration (this may take 5-10 minutes)
./migrate.sh --env production
```

## Screenshots

### When to use

✅ **Use when:**
- UI is complex
- Significantly aids understanding
- Shows visual information

❌ **Don't use when:**
- Text is sufficient
- UI changes frequently
- A command-line example works better

### Screenshot requirements

- **Format:** PNG (not JPEG)
- **Resolution:** Max 1920px wide
- **Annotations:** Use red boxes/arrows
- **Location:** `/images/`
- **Naming:** `doc-name-step1.png`

### Alt text
```markdown
![Database connection dialog showing hostname and port fields](../images/db-config.png)
```

## Links and References

### Internal links

**Use relative paths:**
```markdown
See [deployment guide](../runbooks/deploy-production.md)
```

### External links

**Include context:**
```markdown
According to [PostgreSQL documentation](https://postgresql.org/docs/14/backup.html),
pg_dump creates consistent backups.
```

### Check links regularly

Broken links → the document looks abandoned

## Version Control

### Commit messages

**Format:** `docs: description`
```bash
# Good
git commit -m "docs: add rollback procedure to deployment guide"
git commit -m "docs: update VPN troubleshooting for Windows 11"

# Bad
git commit -m "updated docs"
git commit -m "fix"
```

### Pull request description

**Include:**
- Which document was changed
- Why the change was made
- What it's based on (ticket, incident, feature)
```markdown
## Changes
- Updated database backup procedure
- Added automated backup verification steps

## Reason
After incident INC-2026-042, we need better backup verification

## Testing
- Tested procedure on staging environment
- Verified all commands work on PostgreSQL 14
```

## Review Process

### Peer review before publishing

**Technical documents:**
- Another technical person tests the procedure
- Verifies technical accuracy

**User-facing documents:**
- A non-technical person tests comprehensibility
- Verifies clarity

### Review checklist

- [ ] Frontmatter filled in correctly
- [ ] Headings in sentence case
- [ ] Code blocks are copy-paste ready
- [ ] Links work
- [ ] Screenshots are clear (if used)
- [ ] No typos
- [ ] Status updated (draft → active)

## Maintenance

### Regular reviews

**Active documents:** Review every 30 days

**Review checklist:**
- [ ] Information up to date?
- [ ] Links working?
- [ ] Screenshots current?
- [ ] Process changed?

### Deprecation

**When a document becomes outdated:**

1. Update status → `deprecated`
2. Add warning at the top:
```markdown
> ⚠️ **DEPRECATED:** This document is outdated.
> See [new-process.md](new-process.md) instead.
```

3. Don't delete — keep for historical reference

## Metrics

**Track:**
- Document usage counts
- Support ticket count changes (KB articles)
- Review cycle compliance
- Deprecated document count

**Tools:**
- Analytics on KB articles
- Git log for document updates

## Templates and PRISM Kernels

### Use templates

**Don't start from scratch:**
```bash
cp templates/techdoc-template.md runbooks/new-process.md
```

### PRISM Kernels for AI-assisted writing

**See:** `kernels/README.md`

**Quick start:**
```
#techdoc Write documentation for...
```

## Getting Help

**Questions:** #documentation Slack channel
**Template requests:** Create issue in GitLab
**Style guide updates:** Propose PR with rationale

---

**Version:** 1.0
**Last Updated:** YYYY-MM-DD
**Owner:** Documentation Team
