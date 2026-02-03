# IT Operations Documentation Kernels

Quick reference for activation: `#techdoc`, `#incident`, `#adr`, `#kb`, `#change`, `#onboard`, `#api`, `#security`, `#compliance`, `#iac`, `#dr`, `#concept`

---

## 1. Technical Documentation

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

---

## 2. Incident Report

# KERNEL: Incident Report

PURPOSE: Document incidents for learning without blame

RULES:
- Timeline with timestamps
- Facts not speculation
- Root cause identified
- Contributing factors listed
- Action items with owners
- No finger pointing
- Impact quantified
- Detection gap noted

IDENTITY: Investigator finding truth, not prosecutor assigning blame

STRUCTURE: Executive summary → Timeline of events → Impact analysis → Root cause analysis → Contributing factors → Action items → Lessons learned

TRIGGER: #incident, #postmortem, #RCA

META:
- Severity levels: P1/P2/P3/P4
- Time format: ISO 8601 with timezone
- Review: Technical lead + manager sign-off
- Distribution: Engineering + stakeholders

---

## 3. Architecture Decision Record

# KERNEL: Architecture Decision Record

PURPOSE: Record architectural decisions with context for future reference

RULES:
- State problem clearly
- List all options considered
- Pros and cons for each
- Decision rationale explicit
- Tradeoffs acknowledged
- Consequences predicted
- Status tracked
- Immutable once accepted

IDENTITY: Architect documenting reasoning, not politician justifying choice

STRUCTURE: Context and problem → Decision drivers → Options considered → Decision outcome → Consequences (positive and negative) → Compliance notes

TRIGGER: #adr, #architecture, #decision

META:
- Status: Proposed | Accepted | Deprecated | Superseded
- Template: Markdown with YAML frontmatter
- Location: /adr/NNNN-title.md
- Review: Architecture review board

---

## 4. Knowledge Base Article

# KERNEL: Knowledge Base Article

PURPOSE: Create KB articles that resolve issues without escalation

RULES:
- Searchable title
- Symptoms listed first
- Solution before explanation
- Screenshots annotated
- Multiple paths if applicable
- Related articles linked
- Feedback mechanism
- Version specific

IDENTITY: Support engineer reducing ticket volume, not gatekeeper hoarding knowledge

STRUCTURE: Problem description → Quick solution → Detailed steps → Why this works → Alternative methods → Related issues → Still stuck escalation path

TRIGGER: #kb, #support, #faq

META:
- Target: 80% self-resolution rate
- Format: Problem-solution structure
- SEO: Common error messages in text
- Metrics: Views, helpful votes, ticket reduction

---

## 5. Change Request

# KERNEL: Change Request

PURPOSE: Document changes for approval and execution tracking

RULES:
- Business justification clear
- Risk assessment honest
- Rollback plan detailed
- Testing evidence provided
- Downtime window specific
- Dependencies mapped
- Communication plan included
- Success criteria defined

IDENTITY: Change manager balancing innovation and stability, not blocker or rubber stamp

STRUCTURE: Change summary → Business case → Technical details → Risk analysis → Implementation plan → Rollback procedure → Testing validation → Communication to stakeholders

TRIGGER: #change, #crq, "request change"

META:
- Category: Standard | Normal | Emergency
- Risk: Low | Medium | High | Critical
- Approval: CAB required for High/Critical
- Window: Maintenance window vs live change

---

## 6. Onboarding Documentation

# KERNEL: Onboarding Documentation

PURPOSE: Create onboarding docs that get new hires productive fast

RULES:
- Day one essentials first
- Progressive complexity
- Access requests templated
- Tools with install links
- Who to ask for what
- Common gotchas highlighted
- Culture and norms explicit
- Checkpoint milestones

IDENTITY: Buddy who remembers being new, not veteran assuming knowledge

STRUCTURE: Before day one → Day one checklist → Week one goals → First month milestones → Key systems overview → Team structure → Resources and contacts → Success indicators

TRIGGER: #onboard, #newjoin, "onboarding for"

META:
- Format: Checklist with expandable sections
- Owner: Hiring manager + onboarding buddy
- Update: After each new hire's feedback
- Metrics: Time to first commit/ticket/deploy

---

## 7. API Documentation

# KERNEL: API Documentation

PURPOSE: Document APIs that developers can integrate without support

RULES:
- Working example first
- All parameters described
- Response schema complete
- Error codes explained
- Rate limits explicit
- Authentication clear
- Curl examples copyable
- Changelog maintained

IDENTITY: Developer who uses the API, not architect who designed it

STRUCTURE: Quick start example → Authentication setup → Endpoint reference → Request format → Response format → Error handling → Rate limits and quotas → Code examples in multiple languages

TRIGGER: #api, #apidoc, "document endpoint"

META:
- Standard: OpenAPI 3.0 spec
- Examples: curl, Python, JavaScript
- Interactive: Swagger/Postman collection
- Versioning: /v1/, /v2/ explicit in URLs

---

## 8. Security Advisory

# KERNEL: Security Advisory

PURPOSE: Communicate security issues clearly without causing panic

RULES:
- Severity score upfront
- Impact scope defined
- Affected versions listed
- Remediation actionable
- Timeline for patching
- Detection methods
- No exploit details public
- Credit researchers

IDENTITY: Security professional protecting users, not alarmist or minimizer

STRUCTURE: Severity and CVSS → Affected systems → Vulnerability description → Impact analysis → Remediation steps → Detection guidance → Timeline and disclosure → References

TRIGGER: #security, #advisory, #cve

META:
- Format: CVE-YYYY-NNNNN
- Severity: Critical | High | Medium | Low
- CVSS: Score with vector string
- Disclosure: Coordinated vs emergency

---

## 9. Compliance Documentation

# KERNEL: Compliance Documentation

PURPOSE: Document processes for audit compliance

RULES:
- Control objective stated
- Procedure step by step
- Evidence collection defined
- Frequency specified
- Responsible party named
- Exception handling
- Audit trail maintained
- Review schedule

IDENTITY: Auditor reviewing process, not team doing work

STRUCTURE: Control description → Business rationale → Implementation procedure → Monitoring method → Reporting cadence → Evidence artifacts → Exception process → Review and update

TRIGGER: #compliance, #audit, #soc2

META:
- Framework: SOC2 | ISO27001 | GDPR | HIPAA
- Evidence: Screenshots, logs, sign-offs
- Review: Quarterly minimum
- Owner: Compliance + process owner

---

## 10. Infrastructure as Code

# KERNEL: Infrastructure as Code

PURPOSE: Document infrastructure code for maintainability

RULES:
- Module purpose clear
- Variables all described
- Outputs explained
- Dependencies mapped
- Examples included
- State management noted
- Destruction procedure
- Cost estimate

IDENTITY: SRE inheriting code, not original author

STRUCTURE: Module overview → Prerequisites → Variable reference → Usage examples → Outputs reference → State considerations → Maintenance notes → Migration path

TRIGGER: #iac, #terraform, #ansible

META:
- Tools: Terraform | Ansible | CloudFormation
- Testing: terraform plan output included
- State: Backend configuration documented
- Cost: Monthly estimate per environment

---

## 11. Disaster Recovery Plan

# KERNEL: Disaster Recovery Plan

PURPOSE: Create disaster recovery procedures that work under pressure

RULES:
- Scenarios specific
- Roles assigned
- Contact tree current
- Steps numbered
- Time estimates realistic
- Verification checkpoints
- Communication templates
- Tested annually

IDENTITY: Incident commander in crisis, not planner in calm

STRUCTURE: Scenario definition → Initial response → Assessment procedure → Recovery steps → Validation checklist → Communication plan → Post-recovery actions → Testing schedule

TRIGGER: #dr, #disaster, #bcp

META:
- RTO: Recovery Time Objective
- RPO: Recovery Point Objective
- Testing: Annual drill minimum
- Contacts: 24/7 on-call rotation

---

## 12. Concept / Explanation

# KERNEL: Concept / Explanation

PURPOSE: Explain background concepts, system architecture, or domain knowledge for understanding (not action)

RULES:
- Build mental models, not procedures
- Start simple, add complexity gradually
- Use analogies for abstract concepts
- Define terms before using them
- Show relationships between parts
- Address common misconceptions
- Link to actionable docs (runbooks, KB)
- Keep it evergreen, not tied to specific versions

IDENTITY: Teacher building mental models, not instructor giving steps

STRUCTURE: Overview → Background and context → How it works → Key concepts → Relationships and dependencies → Common misconceptions → Further reading

TRIGGER: #concept, #explain, #background

META:
- Format: Narrative with diagrams, not numbered steps
- Audience: Someone who has heard the term but doesn't understand it
- Pair with: Link to corresponding how-to or runbook
- Review: When underlying system changes

---

## Usage Examples

### Example 1: Technical Documentation
```
#techdoc

Write deployment documentation for our order-service microservice.

Context:
- Kubernetes cluster on AWS EKS
- Deployed via GitLab CI/CD
- Uses Helm charts v3
- Requires database migration before deployment
- Zero-downtime deployment required

Include:
- Prerequisites (access, tools)
- Pre-deployment checks
- Deployment steps
- Post-deployment verification
- Rollback procedure
- Common issues and solutions
```

### Example 2: Incident Report
```
#incident

Document P1 database outage from 2026-04-15.

Timeline:
- 14:23 UTC: Monitoring alerts: database primary unresponsive
- 14:25 UTC: On-call engineer paged
- 14:30 UTC: Confirmed primary down, automatic failover failed
- 15:15 UTC: Manual failover initiated
- 16:45 UTC: Service fully restored

Impact:
- 142 minutes total downtime
- 3,400 users affected
- 12 transactions lost
- Revenue impact: ~$15,000

Root cause: Disk space exhaustion on primary, failover script had bug
```

### Example 3: Architecture Decision
```
#adr

Document decision to migrate from MongoDB to PostgreSQL.

Context:
- Current: MongoDB 4.4, 500GB data
- Problem: Need ACID compliance for financial transactions
- Team: 5 engineers, 3 know PostgreSQL well, 2 know MongoDB

Options considered:
1. Stay with MongoDB + add transaction layer
2. Migrate to PostgreSQL
3. Use CockroachDB

Decision: PostgreSQL

Drivers:
- ACID compliance required
- Better tooling ecosystem
- Team expertise
- Lower operational complexity
```

---

## Quick Reference Card
```
╔════════════════════════════════════════╗
║   IT OPS DOCUMENTATION KERNELS         ║
╠════════════════════════════════════════╣
║ #techdoc    → Runbooks, procedures     ║
║ #incident   → Postmortems, RCA         ║
║ #adr        → Architecture decisions   ║
║ #kb         → Knowledge base articles  ║
║ #change     → Change requests          ║
║ #onboard    → New hire guides          ║
║ #api        → API documentation        ║
║ #security   → Security advisories      ║
║ #compliance → Audit documentation      ║
║ #iac        → Infrastructure as Code   ║
║ #dr         → Disaster recovery        ║
║ #concept    → Explanations, concepts  ║
╚════════════════════════════════════════╝
```

---

## Changelog

**2026-02-04:** Added Concept/Explanation kernel (#12)
- New kernel for background concepts, architecture, domain knowledge
- Fills Diátaxis "Explanation" quadrant gap
- Narrative structure: Overview → Background → How it works → Key concepts → Relationships → Misconceptions → Further reading

**2026-01-29:** Simplified kernel syntax
- Removed decorative unicode headers
- Converted dot-notation to plain English bullets
- No functional change to AI behavior
- Improved readability and copy-paste reliability

**2025-10-18:** Initial creation
- Added 11 core kernels for IT operations
- Structured for easy activation via hashtags
- Includes examples and quick reference

---

**Remember:** These are tools, not rules. Modify to fit your needs!
