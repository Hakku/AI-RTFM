---
title: Documentation Review Process
owner: @team-lead
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
status: active
---

# Documentation Review Process

## Overview

All documents go through a review process before publication and periodically thereafter.

## Review Types

### 1. Pre-Publication Review (mandatory)

**Who:** Another team member
**When:** Before status: draft → active
**Duration:** 1-2 days

**Checklist:**
- [ ] Frontmatter filled in correctly
- [ ] Text is clear and understandable
- [ ] Technical information is accurate
- [ ] Commands tested (if technical doc)
- [ ] Links work
- [ ] Language and style OK (see style-guide.md)

### 2. Technical Validation

**Who:** Subject matter expert
**When:** Technical docs, API docs, runbooks

**Focus:**
- Technical accuracy
- Commands work
- Safe to follow instructions

### 3. User Testing (recommended)

**Who:** Target audience representative
**When:** End-user documentation, KB articles

**Focus:**
- Is it understandable?
- Can it be followed without help?
- Is anything missing?

### 4. Periodic Review (mandatory)

**Who:** Document owner
**When:** Per review cycle (default: 30 days)

**Checklist:**
- [ ] Information still correct?
- [ ] Process changed?
- [ ] Links working?
- [ ] Screenshots up to date?

## Workflow

### Step 1: Create Draft
```bash
cp templates/techdoc-template.md runbooks/new-doc.md
# Edit file
# Set status: draft
```

### Step 2: Self-Review

**Before requesting review:**
- [ ] Run spell check
- [ ] Test all commands/steps
- [ ] Check all links
- [ ] Verify frontmatter

### Step 3: Request Review

**In GitLab/GitHub:**
1. Create merge/pull request
2. Assign reviewer
3. Link to related issue/ticket

**PR template:**
```markdown
## Document
- Type: [Runbook/KB/ADR/etc]
- Location: [folder]/[filename].md

## Changes
- [What was added/changed]

## Reason
- [Why this document is needed]

## Testing
- [ ] Tested all commands
- [ ] Verified on [environment]
```

### Step 4: Reviewer Actions

**Reviewer checks:**
1. Review checklist items
2. Test critical steps if technical doc
3. Comment on issues
4. Approve or request changes

**Timeline:**
- Respond within: 1 business day
- Complete review: 2 business days

### Step 5: Address Feedback

**Document owner:**
- Fix issues
- Reply to comments
- Re-request review if needed

### Step 6: Publish

**After approval:**
- [ ] Merge to main
- [ ] Update status → active
- [ ] Set last_updated date
- [ ] Schedule next review

## Review Schedule

| Document Type | Review Cycle |
|---------------|-------------|
| Runbooks (active processes) | 30 days |
| KB articles | 30 days |
| API documentation | 30 days |
| Security advisories | 30 days (archive after remediation) |
| Compliance documentation | 30 days |
| IaC documentation | 30 days |
| DR plans | 30 days |
| Onboarding guides | 30 days |
| Concept/explanation docs | 30 days |
| Incident reports | Once (at closure) |
| ADRs | On change (when superseded) |
| Change requests | Lifecycle-based (not recurring) |

## Quality Criteria

### Minimum Standards

**Must have:**
- ✅ Complete frontmatter
- ✅ Clear purpose/overview
- ✅ No broken links
- ✅ Correct technical info
- ✅ Follows style guide

**Should have:**
- ✅ Examples
- ✅ Troubleshooting section
- ✅ Related documentation links
- ✅ Last updated within review cycle

### Red Flags

❌ **Reject if:**
- Technical information wrong/dangerous
- Security vulnerability
- Major steps missing
- Incomprehensible language
- No frontmatter

## Review Tools

### Automated Checks

**Spelling:**
```bash
aspell check filename.md
```

**Links:**
```bash
markdown-link-check **/*.md
```

**Frontmatter validation:**
```bash
# Custom script checks required fields
./scripts/validate-frontmatter.sh
```

### Manual Review

**Use this template when reviewing:**
```markdown
## Review: [Document Title]

**Reviewer:** @username
**Date:** YYYY-MM-DD

### Technical Accuracy
- [ ] Information correct
- [ ] Commands tested
- [ ] No security issues

### Clarity
- [ ] Clear and understandable
- [ ] Appropriate for audience
- [ ] Good examples

### Completeness
- [ ] All necessary steps included
- [ ] Edge cases covered
- [ ] Troubleshooting adequate

### Style & Format
- [ ] Follows style guide
- [ ] Proper formatting
- [ ] Good structure

**Verdict:** ✅ Approve / ⚠️ Needs changes / ❌ Reject

**Comments:**
[Specific feedback]
```

## Escalation

**If disagreement:**
1. Discuss with reviewer
2. If unresolved → ask team lead
3. Team lead decision is final

## Metrics

**Track:**
- Average review time
- % documents reviewed on time
- % documents needing major revisions
- Overdue reviews

**Monthly report:**
- Documents reviewed: X
- Average review time: Y days
- Overdue reviews: Z

---

**Version:** 1.0
**Last Updated:** YYYY-MM-DD
**Questions:** #documentation on Slack
