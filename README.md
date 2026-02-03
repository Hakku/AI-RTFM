# Documentation System - Quick Start

Welcome! This is the IT department's documentation system based on the PRISM KERNEL methodology.

## 🚀 Get Started (5 minutes)

### 1. Your First Document (try it now!)
```bash
# Copy template
cp templates/techdoc-template.md runbooks/test-document.md

# Open in editor
nano runbooks/test-document.md
```

**Fill in the frontmatter:**
```yaml
---
type: technical_documentation
kernel: techdoc
title: Test Document - Your Name
owner: @your-name
created: 2026-02-04
last_updated: 2026-02-04
review_cycle: 30_days
status: draft
tags: [test]
---
```

**Write something in the Overview section** → Save → **Done!**

### 2. AI-Assisted Writing (recommended)

**Option A: Copy-paste kernel (works immediately)**

1. Open `kernels/it-ops-kernels.md`
2. Copy the entire "PRISM KERNEL :: TECH.DOCS" section
3. Paste it into a ChatGPT/Claude conversation
4. Write: "Write documentation for deploying our web service"
5. AI produces ready content → copy to your document

**Option B: Custom Instructions (one-time setup, then easy)**

ChatGPT: Settings → Personalization → Custom Instructions
Claude: Projects → New Project → Custom Instructions

**Paste this:**
```
I use PRISM KERNEL documentation methodology. When I activate
a kernel with hashtags like #techdoc, #incident, #adr, #kb,
apply the corresponding kernel from my documentation system.

Available kernels:
- #techdoc: Technical documentation and runbooks
- #incident: Incident postmortems
- #adr: Architecture decisions
- #kb: Knowledge base articles
- #change: Change requests
- #api: API documentation
- #onboard: Onboarding guides
- #security: Security advisories
- #compliance: Compliance documentation
- #iac: Infrastructure as Code
- #dr: Disaster recovery plans
- #concept: Background concepts and explanations

Apply kernel rules silently - don't show the kernel in your response.
```

**Usage:**
```
#techdoc Write deployment guide for our microservice
```

The AI understands and produces the correct format!

### 3. See an Example
```bash
# A completed document
cat runbooks/deploy-to-production.md
```

This shows what a finished document looks like in practice.

---

## 📂 Folder Structure - What Goes Where
```
├── runbooks/          ← Operational guides (how to do X)
├── incidents/         ← Incident reports (what happened)
├── adr/               ← Architecture decisions (why we chose X)
├── kb/                ← Support articles (how to fix problem Y)
├── templates/         ← Empty templates (don't edit directly!)
├── kernels/           ← AI prompts (team-shared)
└── standards/         ← Documentation standards (read these)
```

**Quick reference:**

| I need... | Use | Template | Location |
|-----------|-----|----------|----------|
| Procedure guide | #techdoc | techdoc-template.md | runbooks/ |
| Incident report | #incident | incident-template.md | incidents/ |
| Decision document | #adr | adr-template.md | adr/ |
| Support article | #kb | kb-template.md | kb/ |
| API documentation | #api | api-template.md | (define yourself) |
| Onboarding guide | #onboard | onboard-template.md | (define yourself) |
| Security advisory | #security | security-template.md | (define yourself) |
| Compliance doc | #compliance | compliance-template.md | (define yourself) |
| IaC documentation | #iac | iac-template.md | (define yourself) |
| DR plan | #dr | dr-template.md | (define yourself) |
| Concept explanation | #concept | concept-template.md | (define yourself) |

---

## 💡 Common Use Cases

### "I need a deployment guide"
```bash
# 1. Copy template
cp templates/techdoc-template.md runbooks/deploy-myapp.md

# 2. Use AI
#techdoc Write deployment guide for MyApp microservice to Kubernetes

Context:
- Kubernetes on AWS EKS
- Uses Helm charts
- Requires database migration
- Zero-downtime deployment

# 3. Copy-paste AI response → runbooks/deploy-myapp.md
# 4. Update frontmatter
# 5. Request review
```

### "We just had an incident, need to document it"
```bash
# 1. Copy template
cp templates/incident-template.md incidents/2026-04-18-api-outage.md

# 2. Use AI
#incident Document API outage from today 14:23-16:45 UTC

Timeline:
- 14:23: Alerts fired
- 14:30: On-call responded
- 15:00: Root cause identified (disk space)
- 16:45: Service restored

Impact: 3400 users, 142min downtime

# 3. Fill in details in template
```

### "We made an architecture decision"
```bash
# 1. Copy template
cp templates/adr-template.md adr/0001-use-postgresql.md

# 2. Use AI
#adr Document decision to migrate from MongoDB to PostgreSQL

Context: Need ACID compliance for financial transactions
Options: MongoDB with transactions, PostgreSQL, CockroachDB
Decision: PostgreSQL
Reason: Team expertise, better tooling, ACID native

# 3. Fill in details
```

---

## 🎯 Workflow (recommended)

### New Document
```
1. Copy template     →  cp templates/X.md target/file.md
2. Activate kernel   →  #techdoc Write about...
3. Paste AI output   →  Edit file
4. Update metadata   →  Frontmatter
5. Self-review       →  Checklist
6. Create PR         →  Request review
7. Merge             →  Status → active
```

### Update Document
```
1. Edit file         →  Make changes
2. Update metadata   →  last_updated: today
3. Test changes      →  If commands/steps
4. Create PR         →  Request review
5. Merge             →  Done
```

---

## 📖 Essential Documents (read these)

**FIRST:**
1. `standards/documentation-guide.md` - Documentation standards
2. `kernels/README.md` - How to use PRISM kernels

**THEN:**
3. `standards/style-guide.md` - Writing style
4. `standards/review-process.md` - Review process

---

## ⚡ Pro Tips

### 1. Save time - use kernels

**Without AI:**
- Write document from scratch: ~2 hours
- Figure out structure: ~30 min
- Format correctly: ~30 min

**AI + PRISM Kernel:**
- Activate kernel: 10 seconds
- AI creates structure: 30 seconds
- Fill in details: 20 min
- **Total: ~20-30 min** ⚡

### 2. Use kernels for different document types
```
# Incident happened? Use the incident kernel
#incident Document the API outage from today

# Need a runbook? Use techdoc
#techdoc Write deployment guide for our microservice

# Architecture decision? Use ADR
#adr Document decision to use PostgreSQL
```

### 3. Template = starting point, not law

**You can:**
- ✅ Add sections if needed
- ✅ Remove sections if not needed
- ✅ Modify structure to fit your project

**Don't:**
- ❌ Remove frontmatter
- ❌ Edit the template file itself (make a copy!)

### 4. Version control
```bash
# Good commit message
git commit -m "docs: add database backup procedure"

# Bad
git commit -m "update"
```

### 5. Review cycle

**Active documents:** Review every 30 days
- Set a calendar reminder
- Check that info is up to date
- Update `last_updated`

---

## 🆘 Troubleshooting

### "I don't know which template to use"

| If you need... | Use |
|----------------|-----|
| Step-by-step guide | techdoc-template.md |
| Incident documentation | incident-template.md |
| Decision documentation | adr-template.md |
| Problem solution | kb-template.md |
| API guide for developers | api-template.md |
| New hire guide | onboard-template.md |
| Security advisory | security-template.md |
| Compliance doc | compliance-template.md |
| IaC module docs | iac-template.md |
| Disaster recovery plan | dr-template.md |
| Background concept | concept-template.md |

### "AI isn't working correctly"

**Check:**
1. Did you copy the entire KERNEL definition? (PURPOSE, RULES, IDENTITY, STRUCTURE, TRIGGER, META)
2. Did you provide enough context?
3. Did you activate with the correct #hashtag?

**Test:**
```
#techdoc

Write documentation for restarting Apache web server.

Context:
- Ubuntu 22.04
- Apache 2.4
- Need to check status first
- Need to verify after restart
```

If this doesn't work → AI Custom Instructions aren't configured properly.

### "Document is too long"

**Solutions:**
1. Split into multiple documents (one per process)
2. Use internal links
3. Create "overview" + "detailed" versions

### "I can't find a document"

**Improvements:**
1. Use descriptive file names
2. Add many tags in frontmatter
3. Update README.md to include list of important docs
4. Use `grep` or `find`:
```bash
# Search all documents
grep -r "database backup" .

# Search file names
find . -name "*backup*"
```

---

## 📊 Metrics

**Recommended metrics:**

1. **Document count per type**
```bash
   ls runbooks/ | wc -l
   ls incidents/ | wc -l
```

2. **Outdated documents** (>30 days)
```bash
   find . -name "*.md" -mtime +30
```

3. **Support ticket count** (should decrease as KB grows)

4. **Review cycle compliance** (are reviews happening?)

---

## 🔗 Links

**Internal:**
- [Documentation Standards](standards/documentation-guide.md)
- [Style Guide](standards/style-guide.md)
- [Review Process](standards/review-process.md)
- [PRISM Kernels](kernels/README.md)

**External:**
- Slack: #documentation
- Support: support@company.com
- GitLab/GitHub: [repo-link]

---

## ✅ Checklist for New Team Members

When a new person joins the team:

- [ ] Read this README
- [ ] Read `standards/documentation-guide.md`
- [ ] Try creating one test document
- [ ] Configure AI Custom Instructions
- [ ] Test the kernels
- [ ] Request review on your first real document
- [ ] Join the #documentation Slack channel

**Time:** ~1 hour for orientation

---

**Last updated:** 2026-01-30
**Next update:** When you get feedback from users!
**Questions:** #documentation on Slack
