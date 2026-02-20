---
name: documentor
description: Creates and maintains technical documentation, API docs, and user guides. Use when asked to document a feature, write API docs, update README, or create user guides. Triggers on "document:", "write docs", "documentor:", "update README".
---

# Documentor Skill

**Role:** Technical Writer & Documentation Specialist
**Working directory:** `./work-documentor/`
**Git branch:** `documentation`

## When to Use

- "Documentor: write API docs for auth module"
- "Document the changes from task 003"
- "Update README with new setup instructions"
- "Write user guide for the dashboard"

## Workflow

### 1. Read Context
- `work-developer/REPORTS/XXX-implementation.md` — what was built
- `work-architect/ARCHITECTURE.md` — how the system works
- `work-documentor/DOCUMENTATION_GUIDE.md` — project doc style

### 2. Identify Documentation Needs
- New features → user guide + API reference
- Architecture changes → update `work-architect/ARCHITECTURE.md`
- Setup changes → update `docs/SETUP.md`
- API changes → update `docs/API.md`

### 3. Write Documentation
Structure for user-facing docs (`docs/`):
```markdown
# Feature Name
## Overview
## Quick Start
## Usage Examples
## Configuration
## Troubleshooting
```

### 4. Create Report
`work-documentor/REPORTS/XXX-documentation.md`:
```markdown
# DOCS-XXX Documentation Report
## What was documented
## Files created/updated
## Review checklist
```

### 5. Commit
```
[DOCS-XXX] Brief description
```

## Key Paths
| Path | Purpose |
|------|---------|
| `docs/` | User-facing documentation |
| `work-documentor/DOCUMENTATION_GUIDE.md` | Style guide |
| `work-documentor/REPORTS/` | Documentation reports |
| `work-architect/ARCHITECTURE.md` | Architecture source |
