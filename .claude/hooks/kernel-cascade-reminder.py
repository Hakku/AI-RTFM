#!/usr/bin/env python3
"""
Kernel Cascade Reminder — PostToolUse hook for Write|Edit
Reminds about dependent file updates after kernel edits.
"""

import json
import sys

KERNEL_FILE = "kernels/it-ops-kernels.md"

DEPENDENT_FILES = [
    "DEMO.md",
    "ONBOARDING.md",
    "WORKSHOP.md",
    "QUICK-REFERENCE.md",
    "README.md",
]


def main():
    try:
        input_data = json.load(sys.stdin)
    except (json.JSONDecodeError, Exception):
        sys.exit(0)

    tool_name = input_data.get("tool_name", "")
    if tool_name not in ("Write", "Edit"):
        sys.exit(0)

    tool_input = input_data.get("tool_input", {})
    file_path = tool_input.get("file_path", "")

    if not file_path:
        sys.exit(0)

    # Normalize path separators for comparison
    normalized = file_path.replace("\\", "/").lower()
    if not normalized.endswith(KERNEL_FILE.lower()):
        sys.exit(0)

    dep_list = ", ".join(DEPENDENT_FILES)
    output = {
        "hookSpecificOutput": {
            "hookEventName": "PostToolUse",
            "additionalContext": (
                f"KERNEL CASCADE: You just edited {KERNEL_FILE}. "
                f"Per safety.md, you MUST also update these dependent files: {dep_list}. "
                f"Do NOT mark the task complete until all dependents are updated."
            ),
        }
    }
    print(json.dumps(output))
    sys.exit(0)


if __name__ == "__main__":
    main()
