# AI-RTFM Tech Stack

> Locked dependencies. No additions without explicit approval.

## Documentation Format

| Tool | Version | Purpose |
|------|---------|---------|
| Markdown | CommonMark spec | All documentation files |
| YAML frontmatter | — | Document metadata |

## Tooling

| Tool | Version | Purpose |
|------|---------|---------|
| PowerShell | 7+ | Validation scripts (search.ps1, stale-finder.ps1) |
| Git | 2.x | Version control |
| GitHub | — | Remote repository (Hakku/AI-RTFM) |

## AI

| Tool | Version | Purpose |
|------|---------|---------|
| Claude Code | Claude Opus 4.5 | Primary development AI |
| PRISM Kernels | 12 kernels | Structured AI prompts for documentation |

## Standards

| Standard | Purpose |
|----------|---------|
| llms.txt | AI-readable documentation index |
| Tag taxonomy | Controlled vocabulary (standards/tag-taxonomy.md) |
| Style guide | Writing standards (standards/style-guide.md) |
| Review process | Quality gates (standards/review-process.md) |

## Not Yet Adopted (Deferred)

| Tool | Blocked By | Notes |
|------|------------|-------|
| CI/CD platform | Platform decision | GitHub Actions likely, not confirmed |
| Rendered docs site | Phase 4+ | Currently raw markdown only |
| MCP integration | Phase 4 | AI-to-system real-time integration |
| JSON Schema | Phase 3 | Frontmatter validation schema |

## Constraints

- All scripts must be PowerShell 7+ compatible
- All documentation must be valid CommonMark
- No external dependencies beyond what's listed above
- Document size limit: ~400 lines per file
