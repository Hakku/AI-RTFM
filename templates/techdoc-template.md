---
type: technical_documentation
kernel: techdoc
title: [Descriptive Title - What This Document Covers]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [system-tag, action-tag, severity-tag]  # See standards/tag-taxonomy.md
# Required: 1+ system (postgresql, kubernetes, etc.), 1+ action (deploy, troubleshoot, etc.)
# Optional: severity (critical, standard), audience (oncall, developer), env (production)
---

# [Document Title]

## Overview

[Brief description of what this document covers. 2-3 sentences explaining:
- What system/process this documents
- Who should use this
- When to use this]

## Prerequisites

Before following this procedure, ensure you have:

- [ ] Access to [system/environment]
- [ ] Required permissions: [list specific permissions]
- [ ] Tools installed:
  - Tool 1 (version X.X)
  - Tool 2 (version Y.Y)
- [ ] Knowledge of: [prerequisite concepts]

## Procedure

### Step 1: [First Action]

[Brief description of what this step accomplishes]
```bash
# Command to execute
command --with-flags argument
```

**Expected output:**
```
Expected result here
Showing what success looks like
```

**Verification:**
- Check that [specific condition is true]
- Confirm [another condition]

### Step 2: [Next Action]

[Description of this step]
```bash
# Next command
another-command --option value
```

**Expected output:**
```
Expected result
```

### Step 3: [Continue...]

[Add as many steps as needed]

## Verification

After completing all steps, verify the procedure was successful:

1. **Check [System/Service] Status:**
```bash
   status-check-command
```
   Expected: `[desired state]`

2. **Validate [Functionality]:**
   - Test [specific function]
   - Confirm [expected behavior]

3. **Review Logs:**
```bash
   log-command | grep "success"
```

## Troubleshooting

### Issue: [Common Problem 1]

**Symptoms:**
- [Symptom A]
- [Symptom B]

**Cause:**
[Root cause explanation]

**Solution:**
```bash
# Fix command
fix-command
```

### Issue: [Common Problem 2]

**Symptoms:**
- [Symptom description]

**Cause:**
[Explanation]

**Solution:**
[Step-by-step fix]

### Issue: [Common Problem 3]

**Symptoms:**
[Description]

**Cause:**
[Explanation]

**Solution:**
[Resolution steps]

## Rollback Procedure

If something goes wrong, follow these steps to revert:

1. **Stop the Process:**
```bash
   stop-command
```

2. **Restore Previous State:**
```bash
   rollback-command
```

3. **Verify Rollback:**
```bash
   verify-command
```

## Notes

- [Important consideration 1]
- [Important consideration 2]
- [Known limitation]

## Related Documentation

- [Link to related runbook 1](../runbooks/related-doc-1.md)
- [Link to related runbook 2](../runbooks/related-doc-2.md)
- [External documentation link](https://example.com/docs)

## Maintenance

**Review Schedule:** [Every 30 days / After major changes / Quarterly]

**Last Reviewed By:** @username on YYYY-MM-DD

**Changelog:**
- YYYY-MM-DD: Initial creation
- YYYY-MM-DD: Updated [section] to reflect [change]