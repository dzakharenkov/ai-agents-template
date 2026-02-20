# Documentation Guide

> How to write documentation for this project.

## What to Document

| Event | Where to document |
|-------|------------------|
| New feature | `docs/USAGE.md` + update `docs/README.md` |
| New API endpoint | `docs/API.md` |
| Setup change | `docs/SETUP.md` |
| Architecture change | `work-architect/ARCHITECTURE.md` |
| Deployment change | `docs/DEPLOY.md` |

## Writing Style

- **Active voice:** "The system sends an email" not "An email is sent"
- **Second person:** "You can configure..." not "The user can configure..."
- **Short sentences:** Max 25 words
- **Code examples:** Include for every technical concept

## Doc Structure Template

```markdown
# Feature Name

## Overview
What it does and why it exists (2-3 sentences).

## Quick Start
```bash
# Minimal working example
```

## Usage
### Basic Usage
### Advanced Options

## Configuration
| Parameter | Default | Description |
|-----------|---------|-------------|

## Troubleshooting
### Common Error 1
**Cause:** ...
**Fix:** ...
```

## Commit Format

```
[DOCS-XXX] Brief description
```
