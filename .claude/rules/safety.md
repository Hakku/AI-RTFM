# Safety and Protection Rules

## Backup Before Delete

Before deleting any file, copy to `.backup/filename.YYYYMMDD`

## Path References

Use relative paths from repo root. Never use `docs/` prefix — files are at root.

## Kernel Edit Cascade

Never edit kernels without updating ALL dependent files:
- DEMO.md
- ONBOARDING.md
- WORKSHOP.md
- QUICK-REFERENCE.md
- README.md

## Language Rules

- **System files:** English (all framework, config, project management files)
- **Output examples:** Finnish (documentation teams create in Finnish)
- Finnish company, global operations

## No Regressions

- Before modifying any existing file, diff what exists against what you're changing
- Never break working functionality to implement new functionality
- If a change touches more than one system, verify each system still works after
- When in doubt, ask before overwriting

## Dead Code / Reference Hygiene

- After refactoring or implementing changes, identify code/references that are now unreachable
- List dead code explicitly
- Ask: "Should I remove these now-unused elements: [list]?"
- Don't leave corpses. Don't delete without asking.

## Scope Discipline

- Touch only what you're asked to touch
- Do not remove comments you don't understand
- Do not "clean up" code that is not part of the current task
- Do not refactor adjacent systems as side effects
- Do not delete code that seems unused without explicit approval
- Your job is surgical precision, not unsolicited renovation

## Tags

Use only tags from `standards/tag-taxonomy.md`. Do not create new tags.

## Examples Must Work

Test any kernel/template changes before committing.
