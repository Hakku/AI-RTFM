# Documentation System Onboarding

**Audience:** New users (for yourself and your team)
**Duration:** 1-2 hours
**Goal:** Be able to create documentation independently

---

## Day 1: Basics (30 min)

### Step 1: Explore the Structure (5 min)

**Read these in order:**

1. **`README.md`** ← START HERE
   - System overview
   - Quick start instructions
   - Common use cases

2. **`standards/documentation-guide.md`**
   - Documentation standards
   - Naming conventions
   - Writing style

**Time:** 15 minutes for reading

**Tip:** Don't try to memorize everything. Come back when you need it.

---

### Step 2: Explore the Folder Structure (5 min)

**Open terminal:**
```bash
tree -L 2
# OR if tree is not installed:
ls -R
```

**Understand what type of content goes where:**
```
runbooks/      → "How do I do this?"
incidents/     → "What happened?"
adr/          → "Why did we decide this?"
kb/           → "How do I fix this?"
templates/    → "Where do I start?"
```

**Test:**
```bash
# View templates
ls templates/

# View an example
cat runbooks/deploy-to-production.md
```

---

### Step 3: Create Your First Test Document (20 min)

**Copy template:**
```bash
cp templates/techdoc-template.md runbooks/test-[your-name].md
```

**Open in editor:**
```bash
nano runbooks/test-[your-name].md
# OR
code runbooks/test-[your-name].md
```

**Fill in frontmatter:**
```yaml
---
type: technical_documentation
kernel: techdoc
title: Test Document - [Your Name]
owner: @[your-name]
created: 2026-02-04
last_updated: 2026-02-04
review_cycle: 30_days
status: draft
tags: [test, onboarding]
---
```

**Write in the Overview section:**
```markdown
## Overview

This is a test document I created as part of the onboarding process.
I'm testing the documentation system.

I'm using this document to practice:
- Using templates
- Filling in frontmatter metadata
- Markdown formatting
```

**Save the file.**

**✅ Congratulations!** You created your first document.

---

## Day 2: AI-Assisted Writing (30 min)

### Step 4: Configure AI (15 min)

**Choose your AI tool:**
- ChatGPT (recommended for beginners)
- Claude (better for long documents)

**ChatGPT:**

1. Log in → https://chat.openai.com
2. Settings (bottom left) → Personalization → Custom instructions
3. Copy and paste:
```
I use PRISM KERNEL documentation methodology for structured
documentation. When I use hashtags like #techdoc, #incident,
#adr, #kb, apply the corresponding kernel rules from my
documentation system.

Available kernels:
- #techdoc: Technical runbooks and procedures
- #incident: Incident postmortems
- #adr: Architecture decisions
- #kb: Knowledge base articles
- #api: API documentation
- #onboard: Onboarding guides
- #security: Security advisories
- #compliance: Compliance documentation
- #iac: Infrastructure as Code
- #dr: Disaster recovery plans
- #concept: Background concepts and explanations

When I activate a kernel:
1. Follow all RULES
2. Match the STRUCTURE
3. Adopt the IDENTITY
4. Format as specified in META
5. DO NOT repeat the kernel in your response

If I don't specify a kernel, ask which one I want.
```

4. Save

**Claude:**

1. Log in → https://claude.ai
2. Projects → Create new project
3. Project name: "Documentation System"
4. Custom instructions: [Same text as above]
5. Create project

**Test:**

Write to AI:
```
#techdoc Write a brief guide for restarting Apache web server
```

If AI responds with a well-formatted document → **Success!** ✅

---

### Step 5: Create a Document with AI (15 min)

**Exercise: Write a backup guide**

1. **Copy template:**
```bash
   cp templates/techdoc-template.md runbooks/backup-exercise.md
```

2. **Open AI (ChatGPT/Claude)**

3. **Write prompt:**
```
   #techdoc

   Write documentation for backing up PostgreSQL database.

   Context:
   - PostgreSQL 14 on Ubuntu 22.04
   - Database name: myapp_production
   - Need daily backups
   - Store in /backups directory
   - Retain 7 days

   Include:
   - Manual backup procedure
   - Automated backup script
   - Restore procedure
   - Verification steps
```

4. **Copy AI's response**

5. **Paste → `backup-exercise.md`**

6. **Fill in frontmatter**

7. **Save**

**Compare:**
- Without AI: you would have written for 1-2 hours
- With AI: 15 minutes

**Key learning:** AI does 80% of the work. You do 20% (context + review).

---

## Day 3: Review and Publishing (20 min)

### Step 6: Review Process (10 min)

**Read:** `standards/review-process.md`

**Understand:**
- Why review is important
- Who reviews
- What is checked

**Exercise:**

1. **Review your own document** (backup-exercise.md):
   - [ ] Frontmatter filled in?
   - [ ] Commands copy-paste ready?
   - [ ] Expected output shown?
   - [ ] Troubleshooting section?

2. **Fix any gaps**

3. **Update status:** `draft` → `active`

---

### Step 7: Git Workflow (10 min)

**If using version control:**
```bash
# Add files
git add runbooks/test-*.md
git add runbooks/backup-exercise.md

# Commit
git commit -m "docs: add onboarding test documents"

# Push
git push origin main
```

**If not using version control:**
- Save files in a safe location
- Share with team (Confluence, SharePoint, etc.)

---

## Week 1: Practical Practice (2-3 hours)

### Step 8: Create a Real Document (1-2h)

**Choose a real need:**
- A process you do often but isn't documented
- A problem that comes up repeatedly
- A new system that needs documentation

**Examples:**
- Deployment guide
- Troubleshooting guide
- Onboarding checklist for new people
- API documentation

**Use the workflow:**

1. Choose the right template
2. Activate AI kernel
3. Provide enough context
4. Copy and complete
5. Test the instructions yourself
6. Request review from a colleague
7. Publish

---

### Step 9: Try Different Document Types (1h)

**Create one example of each:**

**Incident Report:**
```bash
cp templates/incident-template.md incidents/test-incident.md
```

Imagine: "Database was down for 30 min yesterday"
Fill in the template. (Doesn't have to be real - it's practice!)

---

**Architecture Decision Record:**
```bash
cp templates/adr-template.md adr/0001-test-decision.md
```

Imagine: "We decided to use PostgreSQL instead of MongoDB"
Fill in the template. List pros/cons.

---

**Knowledge Base Article:**
```bash
cp templates/kb-template.md kb/test-problem.md
```

Imagine: "VPN won't connect"
Write the solution.

---

**After this you understand:**
- Which template to use for what
- How different document types differ
- When to create which one

---

## Week 2: Advanced Techniques (1-2h)

### Step 10: Chain Kernels (30 min)

**Multi-step process:**

**Step 1: Plan**
```
[To AI without kernel]

Create outline for documentation about:
"How to set up CI/CD pipeline with GitLab"

Include:
- Prerequisites
- GitLab Runner setup
- Pipeline configuration
- Testing
- Deployment
```

**Step 2: Write section by section**
```
#techdoc

Using this outline: [paste outline]

Write "Prerequisites" section in detail.
```

Repeat for each section.

**Benefit:** Better control, you can refine each section.

---

### Step 11: Edit and Refine (30 min)

**Exercise: Improve AI-generated text**

1. Create a document with AI
2. Identify unclear parts
3. Ask AI to improve:
```
This section is unclear:
[copy unclear section]

Make it clearer:
- Use simpler language
- Add example
- Break into smaller steps
```

**Or:**
```
This command explanation is too technical.
Rewrite for junior developers who haven't used
[tool] before.
```

---

### Step 12: Template Customization (30 min)

**If team has special needs:**

1. Copy template
2. Add your own sections
3. Save as team template

**Example:**
```bash
cp templates/techdoc-template.md templates/deploy-template-custom.md
```

Add new section:
```markdown
## Security Considerations

[Security checklist for deployments]
- [ ] Secrets rotated
- [ ] Access logs enabled
- [ ] Audit trail configured
```

**Use:**
```bash
cp templates/deploy-template-custom.md runbooks/new-deploy.md
```

---

## Best Practices (learned from experience)

### DO ✅

**1. Start small**
- First document: something simple
- Don't try to document everything at once

**2. Use AI boldly**
- AI creates structure → you check accuracy
- Time savings are huge

**3. Test your instructions**
- If you write a runbook, follow it yourself
- Best way to find gaps

**4. Always request review**
- Another pair of eyes catches mistakes
- Significantly improves quality

**5. Update regularly**
- Review cycle 30 days
- Mark in calendar

**6. Link documents together**
- "See also: [other document]"
- Builds knowledge network

**7. Use tags generously**
- Makes finding easier later
- At least 3-5 tags per document

---

### DON'T ❌

**1. Don't aim for perfection**
- "Done is better than perfect"
- Publish 80% ready, improve later

**2. Don't copy AI output without checking**
- AI makes mistakes
- You're responsible for content

**3. Don't forget frontmatter**
- Metadata is important
- Makes maintenance easier

**4. Don't document the obvious**
- "Open terminal" → not needed for senior developers
- Consider your audience

**5. Don't use outdated documents**
- Check last_updated
- If >90 days → verify it's current

**6. Don't leave broken links**
- Check links before publishing
- Fix immediately if you find broken ones

---

## Checklist: I'm Ready When...

### Basic Skills ✅

- [ ] I can copy and use templates
- [ ] I can fill in frontmatter correctly
- [ ] I can write markdown format
- [ ] I understand the folder structure
- [ ] I can find existing documents

### AI-Assisted Writing ✅

- [ ] I've configured AI Custom Instructions
- [ ] I can activate kernels (#techdoc, etc.)
- [ ] I can provide good context to AI
- [ ] I can evaluate AI-generated content quality
- [ ] I can improve AI-generated text

### Processes ✅

- [ ] I know how to request a review
- [ ] I can review others' documents
- [ ] I understand the git workflow (if used)
- [ ] I know how to update documents
- [ ] I can mark a document as deprecated

### Document Types ✅

- [ ] I can create a runbook
- [ ] I can create an incident report
- [ ] I can create an ADR
- [ ] I can create a KB article
- [ ] I know when to use which one

---

## Support and Help

**Questions:**
- Slack: #documentation channel
- Colleague: Ask a more experienced team member
- Documentation: `standards/` folder

**Common problems:**

**"AI doesn't understand what I want"**
→ Give more context. Tell: what, why, for whom, how.

**"Document is too long"**
→ Split into multiple documents. One process = one document.

**"I don't know which template to use"**
→ Check `README.md` → Quick reference table

**"Colleague gave lots of correction suggestions"**
→ Good! First one is always practice. Second is easier.

---

## Next Steps

**When you've mastered the basics:**

1. **Learn advanced techniques:**
   - Mermaid diagrams in documents
   - Interactive examples
   - Automated tests for documentation

2. **Participate in development:**
   - Suggest improvements to templates
   - Share good prompts with team
   - Help others get started

3. **Measure impact:**
   - How much time is saved?
   - Did support tickets decrease?
   - Is documentation up to date?

---

**Good luck! 🚀**

**Remember:** Every expert was once a beginner. The first document is hardest. The tenth is easy.
