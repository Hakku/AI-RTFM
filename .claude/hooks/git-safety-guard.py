#!/usr/bin/env python3
"""
Git Safety Guard — PreToolUse hook for Bash
Blocks destructive git commands per safety.md rules.
"""

import json
import re
import sys


DESTRUCTIVE_PATTERNS = [
    (re.compile(r'git\s+push\s+.*(-f|--force)'), "git push --force"),
    (re.compile(r'git\s+reset\s+--hard'), "git reset --hard"),
    (re.compile(r'git\s+checkout\s+\.\s*$'), "git checkout ."),
    (re.compile(r'git\s+checkout\s+--\s+\.\s*$'), "git checkout -- ."),
    (re.compile(r'git\s+restore\s+\.\s*$'), "git restore ."),
    (re.compile(r'git\s+clean\s+.*-f'), "git clean -f"),
    (re.compile(r'git\s+branch\s+-D\s+main\b'), "git branch -D main"),
]


def main():
    try:
        input_data = json.load(sys.stdin)
    except (json.JSONDecodeError, Exception):
        sys.exit(0)

    tool_name = input_data.get("tool_name", "")
    if tool_name != "Bash":
        sys.exit(0)

    command = input_data.get("tool_input", {}).get("command", "")
    if not command:
        sys.exit(0)

    for pattern, label in DESTRUCTIVE_PATTERNS:
        if pattern.search(command):
            output = {
                "hookSpecificOutput": {
                    "hookEventName": "PreToolUse",
                    "permissionDecision": "deny",
                    "reason": (
                        f"BLOCKED: `{label}` is a destructive git command. "
                        f"safety.md requires explicit user authorization for destructive operations. "
                        f"Ask the user before proceeding."
                    ),
                }
            }
            print(json.dumps(output))
            sys.exit(0)

    sys.exit(0)


if __name__ == "__main__":
    main()
