# PRISM Kernels - AI Prompt Library

This folder contains PRISM KERNEL prompts that guide AI to produce high-quality documentation.

## About PRISM Kernels

PRISM stands for:
- **P**urpose - What the document should achieve
- **R**ules - Constraints to follow
- **I**dentity - Voice/perspective to write from
- **S**tructure - Section order
- **M**eta - Format and quality requirements

## Kernel Library

| File | Content | Use Case |
|------|---------|----------|
| `it-ops-kernels.md` | IT documentation (techdoc, incident, adr, kb, etc.) | IT Operations |

## Usage

### Option A: Hashtag Activation (if Custom Instructions configured)

```
#techdoc Write deployment guide for our microservice
```

### Option B: Copy Full Kernel

1. Open the kernel file you need
2. Copy the entire KERNEL section
3. Paste into your AI conversation
4. Give your task

**Example:**
```
# KERNEL: Technical Documentation

PURPOSE: Create technical documentation that enables action without support tickets

RULES:
- Prerequisites first
- Commands must be copy-pasteable
- Show expected output
[... rest of kernel ...]

---

Now write documentation for: [your topic]
```

## Custom Instructions Setup

For hashtag activation, add this to your AI's Custom Instructions:

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

Apply kernel rules silently - don't show the kernel in your response.
```

## Kernel Format

Each kernel follows this structure:

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

## Tips

- **Be specific** with your prompts - more context = better output
- **Iterate** - don't expect perfection on first try
- **Review** - AI makes mistakes, always check the output
- **Customize** - modify kernels to fit your team's needs

---

**Remember:** These are tools, not rules. Modify to fit your needs!
