# Documentation System Workshop

**Duration:** 2 hours  
**Participants:** 5-12 people  
**Goal:** Team can create documentation independently after this workshop

---

## Pre-Workshop Checklist (Facilitator)

**1 week before:**
- [ ] Book 2-hour meeting room with projector
- [ ] Send calendar invite with Zoom link (for remote participants)
- [ ] Share pre-reading: `README.md` and `ONBOARDING.md`
- [ ] Ask participants to bring laptops

**1 day before:**
- [ ] Test projector and screen sharing
- [ ] Print handouts (Quick Reference Cards - see bottom of this doc)
- [ ] Set up demo environment (repo cloned, AI configured)
- [ ] Prepare breakout rooms (if hybrid/remote)

**Morning of workshop:**
- [ ] Arrive 15 min early
- [ ] Test AV equipment
- [ ] Put Quick Reference Cards on each seat
- [ ] Write WiFi password on whiteboard

---

## Workshop Agenda

### Part 1: Introduction (20 minutes)

#### 1. Welcome & Context (5 min)

**Facilitator says:**
> "Welcome! Today we're learning our new documentation system. By the end of this workshop, you'll be able to create professional documentation in 15 minutes instead of 2 hours."

**Show on screen:**
````
Problem:
❌ Documentation scattered (Confluence, Wiki, Google Docs, Email)
❌ Outdated and hard to find
❌ Takes 2+ hours to write
❌ Nobody maintains it

Solution:
✅ Centralized structure (organized folders)
✅ Templates for everything
✅ AI-assisted writing (10-20 min per doc)
✅ Built-in review process
````

**Ask participants:**
"Quick poll: How many of you have spent >30 minutes searching for documentation?"
*(Expect many hands - validates the problem)*

---

#### 2. System Overview (10 min)

**Live demo on projector:**

**Show folder structure:**
````bash
cd docs
tree -L 2
````

**Explain each folder (1 min each):**

| Folder | What Goes Here | Example |
|--------|---------------|---------|
| **runbooks/** | "How to do X" | Deploy to production, Restart service |
| **incidents/** | "What happened" | Postmortems after outages |
| **adr/** | "Why we decided X" | Technology choices, architecture |
| **kb/** | "How to fix Y" | Troubleshooting guides for users |
| **templates/** | Empty starting points | Don't edit these! Copy first |

**Key message:** "Right place for everything, everything in its place."

---

#### 3. Show A Real Example (5 min)

**Open:** `runbooks/deploy-to-production.md`

**Scroll through while narrating:**
- "Notice the frontmatter at top - who owns it, when updated"
- "Clear prerequisites checklist"
- "Step-by-step commands you can copy-paste"
- "Expected output shown - you know if it worked"
- "Troubleshooting section - what if it fails"

**Ask:** "Could a junior developer follow this without help?"
*(Answer should be yes)*

**Then reveal:**
> "This document was created in 20 minutes using AI + our template system. Let me show you how."

---

### Part 2: Hands-On Practice (60 minutes)

#### Exercise 1: Create Your First Document (25 min)

**Facilitator demonstrates first (10 min live coding):**

**Step 1: Copy template**
````bash
cp templates/techdoc-template.md runbooks/restart-apache.md
````

**Step 2: Open AI (ChatGPT/Claude)**

Show your screen:
````
#techdoc

Write documentation for restarting Apache web server on Ubuntu.

Context:
- Apache 2.4 on Ubuntu 22.04
- Used by company website
- Need zero-downtime restart
- Check config before restart

Include:
- When to restart (symptoms)
- How to check if restart needed
- Graceful restart command
- Verification steps
````

**Step 3: AI generates document**

Show result (takes ~30 seconds).

**Step 4: Copy to file**

Copy-paste AI output into `restart-apache.md`.

**Step 5: Update frontmatter**
````yaml
---
title: Apache Web Server Restart Procedure
owner: @your-name
created: 2026-02-04
last_updated: 2026-02-04
status: draft
tags: [apache, restart, webserver]
---
````

**Done! 5 minutes total.**

---

**Now participants do it (15 min):**

**Facilitator says:**
> "Your turn! Pick one of these scenarios and create a document:"

**Options (pick one):**
1. How to restart PostgreSQL database
2. How to clear application cache
3. How to deploy to staging environment
4. How to check disk space

**Instructions on screen:**
````
1. Copy template: cp templates/techdoc-template.md runbooks/your-topic.md
2. Open AI, activate kernel: #techdoc
3. Describe your scenario
4. Copy result to your file
5. Update frontmatter
6. Raise hand when done
````

**Facilitator walks around:**
- Help with AI configuration if stuck
- Check that frontmatter is filled correctly
- Encourage those who finish early to try a second document

**Wrap up:**
"Who wants to share their document?" (Pick 1-2 to show on screen briefly)

---

#### Exercise 2: Different Document Types (20 min)

**Facilitator explains:**
> "We have templates for different purposes. Let's practice using the right one."

**Show comparison table:**

| Scenario | Template | Kernel |
|----------|----------|--------|
| "How do I deploy?" | techdoc-template.md | #techdoc |
| "Database was down yesterday" | incident-template.md | #incident |
| "Why did we choose Kubernetes?" | adr-template.md | #adr |
| "VPN won't connect" | kb-template.md | #kb |

**Activity: Match the scenario (5 min)**

**Facilitator reads scenarios, participants shout out answer:**

1. "User can't login - how to fix?" → **KB article**
2. "We need to document the API" → **API template**
3. "Production deploy crashed last night" → **Incident report**
4. "We're choosing between React and Vue" → **ADR**
5. "How to backup the database?" → **Runbook (techdoc)**

**Practice: Create an incident report (15 min)**

**Facilitator:**
> "Imagine: Our database was down for 1 hour yesterday. Let's document it."

**Everyone creates:**
````bash
cp templates/incident-template.md incidents/2026-02-04-practice.md
````

**Prompt for AI:**
````
#incident

Document a practice incident for training:

Timeline:
- 14:00: Database primary went down (disk full)
- 14:15: On-call paged, began investigation
- 14:30: Root cause found (logs filled disk)
- 14:45: Cleaned up logs, restarted database
- 15:00: Service restored

Impact: 200 users affected, 1 hour downtime
````

**Give 10 minutes to work.**

**Debrief:**
"Notice how the template guided you? You didn't forget important sections like impact analysis or action items."

---

#### Exercise 3: Review Process (15 min)

**Facilitator:**
> "Documentation isn't done until someone reviews it. Let's practice."

**Activity: Pair review**

1. **Pair up** (2 people)
2. **Swap laptops**
3. **Review partner's document** (5 min)

**Review checklist** (put on screen):
````
Reviewer checks:
- [ ] Frontmatter complete (owner, date, tags)?
- [ ] Title descriptive?
- [ ] Commands copy-pasteable?
- [ ] Steps numbered and clear?
- [ ] At least one verification step?
- [ ] No spelling errors?

Give feedback:
✅ What's good?
💡 What could be clearer?
````

4. **Discuss feedback** (5 min with partner)
5. **Make one improvement** based on feedback

**Debrief:**
"Two pairs of eyes = much better documentation. Always get review before publishing."

---

### Part 3: Advanced Topics (30 minutes)

#### AI Tips & Tricks (15 min)

**Facilitator shares pro tips:**

**Tip 1: Be specific**

❌ Bad:
````
Write about deploying
````

✅ Good:
````
#techdoc
Write deployment guide for Node.js app to AWS EC2 using PM2
Include: SSH setup, PM2 install, environment variables, monitoring
````

**Tip 2: Iterate**

Don't try to get perfect result in one go:
````
1. First prompt: Get the structure
2. Second prompt: "Make step 3 more detailed"
3. Third prompt: "Add troubleshooting for Error 500"
````

**Tip 3: Give context**
````
Context:
- Our team: 5 developers, mix of junior/senior
- Stack: Python, Flask, PostgreSQL
- Deploy: Kubernetes via GitLab CI/CD
- Audience: Junior developers
````

More context = better output.

**Tip 4: Use examples**
````
Include an example like this:

kubectl get pods -n production
# Expected output:
# NAME                     READY   STATUS
# myapp-7d8f5b4c9-abc12   1/1     Running
````

AI will follow the pattern.

**Live demo:** Show how to improve an AI-generated section.

---

#### Customization & Best Practices (15 min)

**What if templates don't fit your needs?**

**Option 1: Add sections**
````markdown
## Security Considerations
[Your custom section]
````

**Option 2: Create team-specific template**
````bash
cp templates/techdoc-template.md templates/deploy-template-custom.md
# Add your sections
# Use this for all deployments
````

**Best practices (rapid fire):**

1. **Start small** - One document is better than zero
2. **Update regularly** - Set calendar reminder for review
3. **Link documents** - "See also: [related doc]"
4. **Use tags liberally** - Helps future search
5. **Test your runbooks** - Follow your own instructions
6. **Keep it simple** - Perfect is enemy of done
7. **Ask for help** - #documentation Slack channel

**Common mistakes to avoid:**

❌ Trying to document everything at once
❌ Skipping frontmatter metadata
❌ Copying AI output without reading it
❌ No verification steps in procedures
❌ Forgetting to update `last_updated` date

---

### Part 4: Wrap-Up & Next Steps (10 minutes)

#### Q&A (7 min)

**Open floor for questions.**

**Anticipated questions:**

**Q: "Do I HAVE to use AI?"**
A: "No, but you'll be 5-10x faster. Templates work without AI too."

**Q: "What if AI gives wrong information?"**
A: "Always review! You're responsible for accuracy. AI is assistant, not expert."

**Q: "Can I use this for [specific use case]?"**
A: "Probably yes! If no template fits, ask in #documentation and we'll help."

**Q: "How do we measure success?"**
A: "Track: docs written, support tickets reduced, time saved. Let's review in 30 days."

---

#### Next Steps (3 min)

**Everyone must do this week:**
- [ ] Configure AI Custom Instructions (see ONBOARDING.md Step 4)
- [ ] Create ONE real document (not practice)
- [ ] Get it reviewed by a colleague
- [ ] Publish to appropriate folder

**Within 2 weeks:**
- [ ] Create 2-3 more documents
- [ ] Help a colleague who's stuck
- [ ] Share your best AI prompt in #documentation

**Resources:**
- 📖 Full guide: `README.md`
- 📚 Standards: `standards/`
- 💬 Questions: #documentation Slack channel
- 🎓 1-on-1 help: Book time with @facilitator

**Facilitator's final words:**
> "Remember: The goal isn't perfect documentation. The goal is USEFUL documentation that people can FIND and TRUST. Start today. Document one thing. Then another. In a month, you'll have a knowledge base that saves everyone hours."

**Thank everyone and dismiss!**

---

## Post-Workshop Follow-Up

### Day 1 (same day):
- [ ] Send Slack message with:
  - Recording link (if recorded)
  - `README.md` link
  - Quick Reference Card (PDF)
  - Reminder to configure AI this week

### Day 3:
- [ ] Check-in message: "Who has created their first document?"
- [ ] Offer 1-on-1 help to anyone stuck

### Week 2:
- [ ] Team standup: Quick show-and-tell of best documents
- [ ] Celebrate wins (share stats: X docs created, Y time saved)

### Month 1:
- [ ] Retrospective: What's working? What's not?
- [ ] Adjust templates based on feedback
- [ ] Plan next workshop for new joiners

---

## Facilitator Notes

### If workshop goes long:
- **Skip:** Exercise 2 (different document types) - assign as homework
- **Shorten:** Exercise 3 (review) to 10 min instead of 15

### If workshop finishes early:
- **Add:** Live demo of more complex document (API docs)
- **Activity:** Everyone shares one pro tip they discovered

### For remote workshops:
- Use breakout rooms for Exercise 3 (pair review)
- More frequent breaks (5 min every 30 min)
- Use Miro/Mural for collaborative activities

### Common stumbling blocks:
1. **AI not configured** - Have backup: pre-generated examples
2. **Git issues** - Focus on creating docs, commit later
3. **Template choice paralysis** - "When in doubt, use techdoc-template"
4. **Perfectionism** - Emphasize "done > perfect"

---

## Success Metrics

**During workshop:**
- [ ] 90%+ participants create at least 1 document
- [ ] Everyone can explain when to use which template
- [ ] Positive energy and engagement

**After workshop (1 week):**
- [ ] 70%+ have AI configured
- [ ] 50%+ have created a real (non-practice) document
- [ ] <5 "I'm stuck" messages

**After workshop (1 month):**
- [ ] Team has created 20+ new documents
- [ ] Support ticket volume decreased by 10%+
- [ ] Positive feedback in retro

---

## Materials Needed

### Print (1 per participant):
- [ ] Quick Reference Card (see below)
- [ ] Agenda (this document, first page only)

### Digital (share in Slack):
- [ ] `README.md`
- [ ] `ONBOARDING.md`
- [ ] Recording link (after workshop)

### Equipment:
- [ ] Projector + laptop
- [ ] Whiteboard + markers
- [ ] Post-its and pens (for review activity)
- [ ] Timer (for exercises)

---

## Appendix: Workshop Slides Outline

If you want to create slides (optional):

**Slide 1:** Title + Agenda  
**Slide 2:** The Problem (scattered docs, time waste)  
**Slide 3:** The Solution (structure, templates, AI)  
**Slide 4:** Folder structure diagram  
**Slide 5:** Template decision tree  
**Slide 6:** Exercise 1 instructions  
**Slide 7:** AI prompting tips  
**Slide 8:** Exercise 2 instructions  
**Slide 9:** Review checklist  
**Slide 10:** Best practices summary  
**Slide 11:** Next steps + resources

Keep slides minimal - most time should be hands-on practice!

---

**Workshop version:** 1.0  
**Last delivered:** [Date]  
**Facilitator:** [Name]  
**Participants:** [Number]  
**Feedback:** [Link to survey]