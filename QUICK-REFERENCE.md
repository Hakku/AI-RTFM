# Documentation Quick Reference Card

**Print this page and keep it handy!** 📄

---

## 📂 Which Template?

| I need to... | Template | Kernel |
|--------------|----------|--------|
| **Document a procedure** | `techdoc-template.md` | `#techdoc` |
| **Report an incident** | `incident-template.md` | `#incident` |
| **Document a decision** | `adr-template.md` | `#adr` |
| **Write a help article** | `kb-template.md` | `#kb` |
| **Document an API** | `api-template.md` | `#api` |
| **Request a change** | `change-template.md` | `#change` |
| **Onboard new hire** | `onboard-template.md` | `#onboard` |
| **Security advisory** | `security-template.md` | `#security` |
| **Compliance doc** | `compliance-template.md` | `#compliance` |
| **IaC module docs** | `iac-template.md` | `#iac` |
| **DR plan** | `dr-template.md` | `#dr` |
| **Explain a concept** | `concept-template.md` | `#concept` |

---

## 🚀 Quick Start (5 Steps)
````bash
# 1. Copy template
cp templates/[template].md [folder]/[filename].md

# 2. Activate AI kernel
[Copy PRISM KERNEL or use #hashtag]

# 3. Give context to AI
"Write about X. Context: Y. Include: Z."

# 4. Copy result to file
[Paste into your .md file]

# 5. Update frontmatter
owner: @yourname
created: 2026-02-04
status: draft
````

---

## 🤖 AI Activation

### Option A: Hashtag (if Custom Instructions configured)
````
#techdoc Write about deploying microservice
````

### Option B: Copy full kernel
````
# KERNEL: Technical Documentation

PURPOSE: Create technical documentation that enables action without support tickets

RULES:
- Prerequisites first
- Commands must be copy-pasteable
[Full kernel from kernels/it-ops-kernels.md]
````

---

## ✅ Document Checklist

**Before requesting review:**
- [ ] Frontmatter complete (owner, date, tags)
- [ ] Title is descriptive
- [ ] Commands are copy-pasteable
- [ ] Expected outputs shown
- [ ] Verification steps included
- [ ] Status is "draft"

**After approval:**
- [ ] Update status → "active"
- [ ] Update last_updated date
- [ ] Set calendar reminder for review (30 days)

---

## 📝 Frontmatter Template
````yaml
---
type: [technical_documentation | incident_report | etc]
title: [Descriptive Title]
owner: @yourname
created: 2026-02-04
last_updated: 2026-02-04
status: draft
tags: [tag1, tag2, tag3]
---
````

---

## 🔍 Search & Find
````bash
# Search content
grep -r "keyword" .

# Find files
find . -name "*keyword*"

# Recent changes
git log --oneline . | head -10
````

---

## 💡 AI Prompting Tips

### ✅ GOOD Prompts
````
#techdoc

Write deployment guide for Node.js app to EC2.

Context:
- Node.js 18
- PM2 for process management
- NGINX reverse proxy
- Ubuntu 22.04

Include:
- SSH key setup
- PM2 configuration
- NGINX config
- Auto-restart on boot
````

### ❌ BAD Prompts
````
Write about deploying
````

**Key:** Specific context + clear requirements = better output

---

## 🎯 Best Practices

### DO ✅
- Start with one document (don't try to document everything)
- Update `last_updated` every time you edit
- Link related documents together
- Use 3-5 tags minimum
- Test your runbooks before publishing
- Ask for review always

### DON'T ❌
- Copy AI output without reading
- Skip frontmatter
- Forget verification steps
- Leave broken links
- Procrastinate on updates
- Aim for perfection (done > perfect)

---

## 🆘 Common Issues

| Problem | Solution |
|---------|----------|
| **AI doesn't understand** | Add more context, be specific |
| **Don't know which template** | When in doubt: `techdoc-template.md` |
| **Template doesn't fit** | Add custom sections, or create new template |
| **Document too long** | Split into multiple documents |
| **Can't find document** | Use tags, improve naming, add to README |

---

## 📊 Git Commands
````bash
# Add new document
git add runbooks/your-doc.md
git commit -m "docs: add deployment guide for X"
git push origin main

# Update existing
git add runbooks/your-doc.md
git commit -m "docs: update X procedure for version 2.0"
git push origin main

# See recent changes
git log --oneline .
````

---

## 🔗 Important Links

**Documentation:**
- Main guide: `README.md`
- Onboarding: `ONBOARDING.md`
- Standards: `standards/documentation-guide.md`
- Kernels: `kernels/it-ops-kernels.md`

**Support:**
- Slack: `#documentation`
- 1-on-1 help: Book time with facilitator
- Issues: Create GitHub/GitLab issue

---

## 📅 Review Schedule

| Document Type | Review Cycle |
|---------------|-------------|
| Active operational docs | 30 days |
| Incident reports | Once (at closure) |
| ADRs | On change (when superseded) |
| Change requests | Lifecycle-based |

**Set calendar reminders!**

---

## 🎓 Learning Path

**Week 1:** Create 1 document (any type)  
**Week 2:** Create 2-3 more, different types  
**Week 3:** Help a colleague get started  
**Week 4:** You're now a documentation pro! 🎉

---

## Keyboard Shortcuts (Markdown)
````markdown
# Heading 1
## Heading 2
### Heading 3

**bold**
*italic*
`code`

- Bullet list
1. Numbered list

[Link text](URL)
![Image](path/to/image.png)
```code block```
```

---

**Print double-sided!**  
**Keep at your desk or tape to monitor!**

---

**Version:** 1.0  
**Last Updated:** 2026-02-04  
**Download PDF:** [link]

---

## For PDF Version (Landscape Layout)
````
┌─────────────────────────────────────────────────────────────┐
│  DOCUMENTATION SYSTEM - QUICK REFERENCE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  WHICH TEMPLATE?          │  WORKFLOW                       │
│  ─────────────────        │  ──────────                     │
│  Procedure → techdoc      │  1. cp template → file          │
│  Incident → incident      │  2. #techdoc in AI              │
│  Decision → adr           │  3. Give context                │
│  Help article → kb        │  4. Copy result                 │
│  API → api                │  5. Update frontmatter          │
│                            │                                │
│  ───────────────────────────────────────────────────────────│
│                                                             │
│  AI PROMPTING             │  CHECKLIST                      │
│  ──────────────           │  ───────────                    │
│  ✅ Be specific           │  □ Frontmatter complete         │
│  ✅ Give context          │  □ Title descriptive            │
│  ✅ Show examples         │  □ Commands copy-pasteable      │
│  ✅ Iterate               │  □ Verification steps           │
│  ❌ Vague requests        │  □ Status = draft               │
│                            │  □ Tags added                   │
│  ───────────────────────────────────────────────────────────│
│                                                              │
│  SUPPORT: #documentation | README.md | Book 1-on-1           │
│                                                              │
└─────────────────────────────────────────────────────────────┘

To create PDF:
Method 1: Markdown to PDF
bashpandoc QUICK-REFERENCE.md -o QUICK-REFERENCE.pdf
Method 2: Print from browser

Open in Markdown viewer
Print to PDF
Select "Landscape" orientation

Method 3: Use online tool

https://www.markdowntopdf.com/
Upload QUICK-REFERENCE.md
Download PDF