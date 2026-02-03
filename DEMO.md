# Documentation System Demo Script

**Duration:** 15 minutes
**Audience:** IT team
**Goal:** Show how the system works in practice

---

## Preparation (do before demo)
```bash
# 1. Verify structure is in place
ls

# 2. Open terminal + AI tool (ChatGPT/Claude)
# 3. Open in browser: README.md
# 4. Have ready: runbooks/deploy-to-production.md
```

---

## Demo Flow (follow this)

### 1. Intro (2 min)

**Say:**
> "We've had a problem: documentation is scattered, outdated, and takes too long to write. This system solves these problems."

**Show on screen:** folder structure

**Explain:**
```
├── runbooks/      ← How to do things
├── incidents/     ← What happened (postmortems)
├── adr/          ← Why we decided this way
├── kb/           ← How to fix problems
└── templates/    ← Ready templates
```

**Key message:** "Every document type has its own place and template."

---

### 2. Show a Completed Document (3 min)

**Open:** `runbooks/deploy-to-production.md`

**Scroll through while showing:**

1. **Frontmatter:** "Metadata - who owns it, when updated"
2. **Overview:** "Clear description of what this does"
3. **Prerequisites:** "Checklist - what's needed"
4. **Steps:** "Exact commands, copy-paste ready"
5. **Verification:** "How to know it succeeded"
6. **Troubleshooting:** "What if something goes wrong"

**Say:**
> "This is a complete runbook. A junior developer can follow this without help. Let's see how to create this in 5 minutes with AI."

---

### 3. Live Demo: Create Document with AI (5 min)

**Step 1: Copy template**
```bash
cp templates/techdoc-template.md runbooks/restart-redis.md
```

**Say:** "Start from a ready template."

---

**Step 2: Activate AI kernel**

**Open AI tool (ChatGPT/Claude)**

**Copy this to AI:**
```
# KERNEL: Technical Documentation

PURPOSE: Create technical documentation that enables action without support tickets

RULES:
- Prerequisites first
- Commands must be copy-pasteable
- Show expected output
- Cover error scenarios
- Version numbers explicit
- No assumptions about reader knowledge
- Screenshots only if UI is complex
- Update date visible

IDENTITY: Senior engineer writing for their past self, not expert showing off

STRUCTURE: Overview → Prerequisites and access → Step-by-step procedure → Verification steps → Troubleshooting common issues → Rollback if needed

TRIGGER: #techdoc, #howto, #runbook

META:
- Format: Numbered steps with code blocks
- Test: Can junior follow without questions?
- Include: Last updated, owner, review cycle
```

**Say:** "This is a PRISM kernel - it guides the AI."

---

**Step 3: Write prompt**

**Write to AI:**
```
Write documentation for restarting Redis cache cluster in production.

Context:
- Redis 7.0 running on AWS ElastiCache
- 3-node cluster with replication
- Used by order-service and user-service
- Need to minimize downtime

Include:
- When to restart (symptoms)
- Prerequisites (access, permissions)
- Step-by-step restart procedure
- How to verify it's working
- What to do if restart fails
```

**Press Enter**

**Say:** "AI understands what we want and creates the structure automatically."

---

**Step 4: Show result**

**AI produces a complete document in 30 seconds.**

**Show audience:**
- ✅ Clear structure
- ✅ Exact commands
- ✅ Verification steps
- ✅ Troubleshooting

**Say:**
> "This would have taken 2 hours to write manually. AI + PRISM kernel did it in 30 seconds. Now I just copy this to the template and fill in the metadata."

---

**Step 5: Copy and complete**

**Copy AI response → `restart-redis.md`**

**Update frontmatter:**
```yaml
---
title: Redis Cluster Restart Procedure
owner: @your-name
created: 2026-02-04
last_updated: 2026-02-04
status: draft
tags: [redis, restart, cache, production]
---
```

**Say:** "Done! Now I just request a review from a colleague and publish."

---

### 4. Other Features (3 min)

**Show quickly:**

**A) Incident Report Template**
```bash
cat templates/incident-template.md | head -50
```

**Say:** "After an incident - fill this out. Forces proper documentation."

---

**B) Architecture Decision Records**
```bash
ls adr/
```

**Say:** "When we make big decisions - document why. Example: Why we chose PostgreSQL."

---

**C) Knowledge Base**

**Say:**
> "When the same question comes to support 10 times → KB article. Users can solve it themselves."

---

### 5. Workflow for Team (2 min)

**Show:**
```
1. Copy template    →  cp templates/X.md target/file.md
2. Activate kernel  →  [Copy kernel + write task]
3. Copy-paste result →  Paste into template
4. Fill metadata    →  Frontmatter
5. Request review   →  Colleague checks
6. Publish          →  Git push
```

**Say:**
> "First document takes 30 min. After that, 10-15 min per document."

---

### 6. Q&A and Next Steps (3 min)

**Common questions:**

**Q: "Do I have to use AI?"**
A: "Not required, but 10x faster. Templates work without AI too."

**Q: "What if AI makes a mistake?"**
A: "That's why we have a review process. Always check."

**Q: "Can I modify templates?"**
A: "Yes! They're a starting point, not a rule."

**Q: "How much time is saved?"**
A: "Writing a document: 2h → 20min. Finding it: 10min → 2min."

---

**Next steps for team:**

1. **Today:** Read `README.md` (5 min)
2. **This week:** Create one test document (30 min)
3. **Next week:** Start using for real projects

**Say:**
> "Start small. When you see how much time you save, you'll want to use this for everything."

---

## Demo Checklist

**Before demo:**
- [ ] Run through demo once
- [ ] Verify AI connection works
- [ ] Open necessary files
- [ ] Close unnecessary apps (focus on demo)

**During demo:**
- [ ] Stay on schedule (15 min)
- [ ] Show real examples
- [ ] Live demo doesn't always work → be ready to show completed result
- [ ] Emphasize time savings

**After demo:**
- [ ] Share README.md link on Slack
- [ ] Offer 1-on-1 sessions for interested people
- [ ] Collect feedback after one week

---

**Pro Tip:** If live demo fails (AI slow/buggy), show the completed `deploy-to-production.md` and say: "This was created the same way in 20 minutes."
