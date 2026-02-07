#!/usr/bin/env python3
"""
Frontmatter & Tag Validator — PreToolUse hook for Write
Blocks writes to content .md files with invalid/missing frontmatter.
"""

import json
import os
import re
import sys
from pathlib import Path

# Directories containing content docs (relative to repo root)
CONTENT_DIRS = {
    "templates", "runbooks", "incidents", "adr", "kb",
    "examples", "guides", "procedures",
}

# Directories/files to skip
SKIP_DIRS = {"standards", "tools", ".backup", ".claude", "kernels", "training"}
SKIP_FILES = {
    "claude.md", "claude.md", "progress.txt", "lessons.md", "readme.md",
    "prd.md", "app_flow.md", "tech_stack.md", "implementation_plan.md",
    "workflow.md", "demo.md", "onboarding.md", "workshop.md",
    "quick-reference.md", "llms.txt", "license", "security.md",
    "session-brief-interrogation.md", "session-brief-jtbd.md",
    "contributing.md",
}

REQUIRED_FIELDS = {"type", "kernel", "title", "owner", "created", "last_updated", "status", "tags"}

TYPE_SPECIFIC_FIELDS = {
    "architecture_decision_record": ["adr_number"],
    "incident_report": ["incident_id", "severity", "duration"],
    "knowledge_base_article": ["kb_id", "category", "difficulty", "audience"],
}

VALID_TYPES = {
    "technical_documentation", "architecture_decision_record",
    "incident_report", "knowledge_base_article",
}

VALID_STATUSES = {"draft", "active", "deprecated", "archived"}


def load_valid_tags() -> set[str]:
    """Parse tag-taxonomy.md for all valid tags."""
    tags = set()
    taxonomy_path = os.path.join(
        os.environ.get("CLAUDE_PROJECT_DIR", "."),
        "standards", "tag-taxonomy.md",
    )
    try:
        with open(taxonomy_path, "r", encoding="utf-8") as f:
            for line in f:
                # Tags are listed as `- `tag-name` - description`
                match = re.match(r'^- `([a-z0-9-]+)`', line.strip())
                if match:
                    tags.add(match.group(1))
    except FileNotFoundError:
        pass  # Can't validate tags if taxonomy missing
    return tags


def is_content_file(file_path: str) -> bool:
    """Check if file is in a content directory and is .md."""
    path = Path(file_path)

    if path.suffix.lower() != ".md":
        return False

    if path.name.lower() in SKIP_FILES:
        return False

    # Check path parts against skip/content dirs
    parts = [p.lower() for p in path.parts]

    for skip_dir in SKIP_DIRS:
        if skip_dir in parts:
            return False

    for content_dir in CONTENT_DIRS:
        if content_dir in parts:
            return True

    return False


def parse_frontmatter(content: str) -> dict | None:
    """Extract YAML frontmatter as a dict. Returns None if no frontmatter."""
    if not content.startswith("---"):
        return None

    end = content.find("---", 3)
    if end == -1:
        return None

    yaml_block = content[3:end].strip()
    if not yaml_block:
        return None

    # Simple YAML parser — no PyYAML dependency
    result = {}
    for line in yaml_block.split("\n"):
        line = line.strip()
        if not line or line.startswith("#"):
            continue

        colon_idx = line.find(":")
        if colon_idx == -1:
            continue

        key = line[:colon_idx].strip()
        value = line[colon_idx + 1:].strip()

        # Parse tags array: [tag1, tag2, tag3]
        if key == "tags" and value.startswith("["):
            tag_str = value.strip("[]")
            result[key] = [t.strip().strip("'\"") for t in tag_str.split(",") if t.strip()]
        else:
            result[key] = value.strip("'\"")

    return result


def validate(file_path: str, content: str) -> list[str]:
    """Validate frontmatter. Returns list of error messages."""
    errors = []

    fm = parse_frontmatter(content)
    if fm is None:
        return ["Missing YAML frontmatter (--- delimiters)"]

    # Check required fields
    missing = REQUIRED_FIELDS - set(fm.keys())
    if missing:
        errors.append(f"Missing required fields: {', '.join(sorted(missing))}")

    # Validate type
    doc_type = fm.get("type", "")
    if doc_type and doc_type not in VALID_TYPES:
        errors.append(f"Invalid type '{doc_type}'. Valid: {', '.join(sorted(VALID_TYPES))}")

    # Validate status
    status = fm.get("status", "")
    if status and status not in VALID_STATUSES:
        errors.append(f"Invalid status '{status}'. Valid: {', '.join(sorted(VALID_STATUSES))}")

    # Validate tags
    tags = fm.get("tags", [])
    if isinstance(tags, str):
        tags = [tags]

    if len(tags) < 3:
        errors.append(f"Minimum 3 tags required, found {len(tags)}")

    valid_tags = load_valid_tags()
    if valid_tags:
        invalid = [t for t in tags if t and t not in valid_tags]
        if invalid:
            errors.append(f"Invalid tags (not in tag-taxonomy.md): {', '.join(invalid)}")

    # Type-specific fields
    if doc_type in TYPE_SPECIFIC_FIELDS:
        for field in TYPE_SPECIFIC_FIELDS[doc_type]:
            if field not in fm:
                errors.append(f"Type '{doc_type}' requires field: {field}")

    return errors


def main():
    try:
        input_data = json.load(sys.stdin)
    except (json.JSONDecodeError, Exception):
        sys.exit(0)

    tool_name = input_data.get("tool_name", "")
    if tool_name != "Write":
        sys.exit(0)

    tool_input = input_data.get("tool_input", {})
    file_path = tool_input.get("file_path", "")
    content = tool_input.get("content", "")

    if not file_path or not content:
        sys.exit(0)

    if not is_content_file(file_path):
        sys.exit(0)

    errors = validate(file_path, content)
    if errors:
        error_list = "\n".join(f"  - {e}" for e in errors)
        output = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "deny",
                "reason": (
                    f"BLOCKED: Frontmatter validation failed for {Path(file_path).name}:\n"
                    f"{error_list}\n"
                    f"See documentation-conventions.md for required format."
                ),
            }
        }
        print(json.dumps(output))

    sys.exit(0)


if __name__ == "__main__":
    main()
