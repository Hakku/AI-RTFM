#!/usr/bin/env python3
"""
Commit Message Validator — PreToolUse hook for Bash
Blocks git commit commands with non-conforming messages.
Format: feat|fix|refactor|docs|test|chore: description
"""

import json
import re
import sys

COMMIT_FORMAT = re.compile(r'^(feat|fix|refactor|docs|test|chore): .+', re.MULTILINE)

# Patterns to extract commit message
MSG_FLAG_DOUBLE = re.compile(r'-m\s+"([^"]*)"')
MSG_FLAG_SINGLE = re.compile(r"-m\s+'([^']*)'")
HEREDOC_PATTERN = re.compile(
    r"""\$\(cat\s+<<'?EOF'?\s*\n(.*?)\nEOF""",
    re.DOTALL,
)


def extract_message(command: str) -> str | None:
    """Extract commit message from git commit command. Returns None if can't parse."""
    match = HEREDOC_PATTERN.search(command)
    if match:
        return match.group(1).strip()

    match = MSG_FLAG_DOUBLE.search(command)
    if match:
        return match.group(1).strip()

    match = MSG_FLAG_SINGLE.search(command)
    if match:
        return match.group(1).strip()

    return None


def main():
    try:
        input_data = json.load(sys.stdin)
    except (json.JSONDecodeError, Exception):
        sys.exit(0)

    tool_name = input_data.get("tool_name", "")
    if tool_name != "Bash":
        sys.exit(0)

    command = input_data.get("tool_input", {}).get("command", "")
    if "git commit" not in command:
        sys.exit(0)

    # Skip amend-only commands (no new message)
    if "--amend" in command and "-m" not in command:
        sys.exit(0)

    message = extract_message(command)
    if message is None:
        # Can't parse message (interactive or unusual format) — skip
        sys.exit(0)

    # Get first line of message for format check
    first_line = message.split("\n")[0].strip()

    if not COMMIT_FORMAT.match(first_line):
        output = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "deny",
                "reason": (
                    f"BLOCKED: Commit message doesn't match required format.\n"
                    f"  Got: \"{first_line}\"\n"
                    f"  Expected: feat|fix|refactor|docs|test|chore: description\n"
                    f"  Example: \"feat: add frontmatter validation hook\""
                ),
            }
        }
        print(json.dumps(output))

    sys.exit(0)


if __name__ == "__main__":
    main()
