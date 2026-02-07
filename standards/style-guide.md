---
title: Writing Style Guide
owner: @team-lead
created: 2026-02-04
last_updated: 2026-02-07
status: active
---

# Writing Style Guide

Quick reference for the team's writing style.

## Language & Tone

**Use:**
- Simple, direct language
- Active voice: "Click Save" not "Save should be clicked"
- Present tense: "The system sends" not "The system will send"
- Second person: "You can configure" not "Users can configure"

**Avoid:**
- Jargon without explanation
- "Please", "kindly" (unnecessary politeness)
- "Simply", "just", "easy" (minimizing)
- "Obviously", "clearly" (assumes knowledge)

## Formatting

### Headers

**Sentence case:**
- ✅ "Configure the database"
- ❌ "Configure The Database"

**Hierarchy:**
```markdown
# H1: Document title (one per document)
## H2: Major sections
### H3: Subsections
#### H4: Use sparingly
```

### Lists

**Use bullets for unordered:**
- Item one
- Item two
- Item three

**Use numbers for sequences:**
1. First step
2. Second step
3. Third step

**Parallel structure:**
- ✅ Start, Configure, Test (all verbs)
- ❌ Starting, Configure, Test (mixed)

### Code

**Inline code:** Use `backticks` for commands, filenames, variables

**Code blocks:** Use with language identifier
```python
def example():
    return "formatted code"
```

## Technical Writing

### Commands

**Show complete commands:**
```bash
# Good
docker run -d -p 8080:80 --name myapp nginx:latest

# Bad (incomplete)
docker run nginx
```

**Include expected output:**
```bash
systemctl status postgresql
# Expected: active (running) since...
```

### Variables

**Use descriptive placeholders:**
- ✅ `<your-api-key>`
- ✅ `[USERNAME]`
- ❌ `xxx`
- ❌ `...`

### Errors

**Quote exact error messages:**
```
Error: "Connection refused on port 5432"
```

## Common Terms

### Standardized terminology

| Use | Don't Use |
|-----|-----------|
| username | user name, login name |
| email | e-mail, Email |
| checkbox | check box |
| dropdown | drop-down, drop down |
| login (verb) | log in, log-in |
| log in (noun) | login |
| setup (noun) | set-up |
| set up (verb) | setup |
| database | data base, DB |

### Product names

**Follow official capitalization:**
- PostgreSQL (not Postgresql, postgres)
- JavaScript (not Javascript, java script)
- GitHub (not Github, github)

## Numbers & Units

**Numbers:**
- Spell out: one to nine
- Use numerals: 10 and above
- Exception: Technical contexts use numerals always

**Units:**
- Use spaces: 500 MB (not 500MB)
- Time: 5 seconds, 10 minutes, 2 hours
- No periods: MB, GB, TB (not M.B.)

## Punctuation

**Commas:**
- Use Oxford comma: "A, B, and C"

**Periods:**
- End all sentences with periods
- Lists: use periods if complete sentences

**Colons:**
- Use before lists
- Lowercase after colon (unless proper noun)

**Semicolons:**
- Avoid in technical writing
- Use bullets or separate sentences

## Accessibility

**Alt text for images:**
```markdown
![Description of what image shows](path/to/image.png)
```

**Link text:**
- ✅ "See the [deployment guide](link)"
- ❌ "Click [here](link)"

**Color:**
- Don't rely solely on color
- Use text + color for status

## Abbreviations

**First use:**
Spell out with abbreviation: "Application Programming Interface (API)"

**Common abbreviations (no need to spell out):**
- API, URL, HTTP, HTTPS
- HTML, CSS, JSON, XML
- SSH, VPN, DNS, IP

## Examples

### Before (poor style):
```
You should probably try to simply restart the service 
by running the command. This will fix the issue.
```

### After (good style):
```
Restart the service:
systemctl restart myservice

This resolves the connection timeout issue.
```

---

**Version:** 1.0  
**Last Updated:** YYYY-MM-DD  
**Questions:** #documentation on Slack