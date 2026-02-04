# PRISM KERNEL Syntax Simplification Plan

## Objective
Strip decorative unicode syntax from kernels while preserving functional AI behavior. Convert to plain English format for improved readability and copy-paste reliability.

---

## Phase 1: Audit Current State

### 1.1 Kernel Inventory
Location: `it-ops-kernels.md`
Total: 11 kernels

1. #techdoc (Technical Documentation)
2. #incident (Incident Report)
3. #adr (Architecture Decision Record)
4. #kb (Knowledge Base Article)
5. #change (Change Request)
6. #onboard (Onboarding Documentation)
7. #api (API Documentation)
8. #security (Security Advisory)
9. #compliance (Compliance Documentation)
10. #iac (Infrastructure as Code)
11. #dr (Disaster Recovery Plan)

### 1.2 Dependent Files
Files containing kernel syntax or references that require updates:
- DEMO.md
- ONBOARDING.md
- README.md
- QUICK-REFERENCE.md
- WORKSHOP.md

---

## Phase 2: New Syntax Standard

### 2.1 Target Format
```
# KERNEL: [Name]

PURPOSE: [Single sentence describing goal]

RULES:
- [Rule 1]
- [Rule 2]
- [Rule 3]

IDENTITY: [Who the AI should write as]

STRUCTURE: [Section 1] → [Section 2] → [Section 3] → ...

TRIGGER: #[hashtag]

META:
- Format: [Output format notes]
- Test: [Quality check]
- Include: [Required elements]
```

### 2.2 Conversion Mapping
| Old | New |
|-----|-----|
| `///▙▖▙▖▞▞▙▂▂...` | Delete |
| `▛///▞ PRISM KERNEL ::` | `# KERNEL:` |
| `//▞▞〔...〕` | Delete |
| `P::` | `PURPOSE:` |
| `R::` | `RULES:` (bullet list) |
| `I::` | `IDENTITY:` |
| `S::` | `STRUCTURE:` |
| `M::` | `TRIGGER:` |
| `META::` | `META:` (bullet list) |
| `:: ∎` | Delete |
| `dot.notation.style` | Plain English |
| `∙` separators | Bullet points |

---

## Phase 3: Convert Kernels

### 3.1 Priority Order
1. #techdoc — establishes pattern
2. #incident — critical ops use
3. #kb — high visibility
4. #adr — architecture dependency
5. #change — process dependency
6. #onboard
7. #api
8. #security
9. #compliance
10. #iac
11. #dr

### 3.2 Per-Kernel Checklist
- [ ] Remove decorative header lines
- [ ] P:: → PURPOSE:
- [ ] R:: dot-notation → RULES: with bullets
- [ ] I:: → IDENTITY:
- [ ] S:: → STRUCTURE: (keep → arrows)
- [ ] M:: → TRIGGER:
- [ ] META:: → META: with bullets
- [ ] Remove `:: ∎` closing
- [ ] Verify no unicode decoration remains

---

## Phase 4: Update Dependent Files

### 4.1 File-Specific Changes

**DEMO.md**
- Section: "Vaihe 2: Aktivoi AI kernel"
- Replace full kernel example with new format

**ONBOARDING.md**
- Section: "Askel 4: Konfiguroi AI"
- Update kernel example and Custom Instructions text

**README.md**
- Section: "Vaihtoehto A: Copy-paste kernel"
- Replace kernel example

**QUICK-REFERENCE.md**
- Section: "Option B: Copy full kernel"
- Replace kernel example

**WORKSHOP.md**
- Section: "Step 2: Open AI"
- Update demo script kernel example

### 4.2 Search Patterns
Find old syntax with:
- `///▙`
- `PRISM KERNEL`
- `:: ∎`
- `P::`

---

## Phase 5: Update Custom Instructions Template

### 5.1 New Template
```
I use structured documentation kernels. When I activate a kernel 
with hashtags like #techdoc, #incident, #adr, #kb, follow the 
corresponding kernel format.

Kernel structure:
- PURPOSE: What the document should achieve
- RULES: Constraints to follow
- IDENTITY: Voice/perspective to write from
- STRUCTURE: Section order
- META: Format and quality requirements

Apply kernel rules silently - don't echo the kernel in your response.
```

Update this template in:
- README.md (AI configuration section)
- ONBOARDING.md (Custom Instructions section)

---

## Phase 6: Validate

### 6.1 AI Behavior Testing
For each kernel:
- [ ] Copy new format to AI
- [ ] Issue same prompt as before
- [ ] Compare output quality
- [ ] Document any differences

### 6.2 User Testing
- [ ] Junior team member follows ONBOARDING.md
- [ ] Measure time to first document
- [ ] Note confusion points
- [ ] Iterate if needed

---

## Phase 7: Finalize

### 7.1 Cleanup
- Remove any orphaned references

### 7.2 Add Changelog Entry
```
## Changelog

**[DATE]:** Simplified kernel syntax
- Removed decorative unicode headers
- Converted dot-notation to plain English
- No functional change to AI behavior
- Improved readability and copy-paste reliability
```

---

## Example Conversion

### Before
```
///▙▖▙▖▞▞▙▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂
▛///▞ PRISM KERNEL :: TECH.DOCS ⫸
//▞▞〔Purpose · Rules · Identity · Structure · Motion〕

P:: Create technical documentation that enables action without support tickets

R:: prerequisites.first ∙ exact.commands.copyable ∙ 
    expected.output.shown ∙ error.scenarios.covered ∙
    version.numbers.explicit ∙ no.assumptions.about.knowledge

I:: Senior engineer writing for their past self, not expert showing off

S:: what.this.does → prerequisites.and.access →
    step.by.step.procedure → verification.steps →
    troubleshooting.common.issues → rollback.if.needed

M:: Activate on #techdoc, #howto, #runbook

META:: Format: Numbered steps with code blocks
       Test: Can junior follow without questions?
       Include: Last updated, owner, review cycle

:: ∎
```

### After
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

IDENTITY: Senior engineer writing for their past self, not expert showing off

STRUCTURE: Overview → Prerequisites → Step-by-step procedure → Verification → Troubleshooting → Rollback

TRIGGER: #techdoc, #howto, #runbook

META:
- Format: Numbered steps with code blocks
- Test: Can junior follow without questions?
- Include: Last updated, owner, review cycle
```

---

## Estimated Time
| Phase | Duration |
|-------|----------|
| Audit | 15 min |
| Define standard | 10 min |
| Convert 11 kernels | 45 min |
| Update 7 files | 30 min |
| Update instructions | 10 min |
| Validate | 30 min |
| Finalize | 5 min |
| **Total** | **~2.5 hours** |
