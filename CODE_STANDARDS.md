# Code Standards

> Project-specific coding conventions. Fill in for your tech stack.

## Language & Runtime

- **Language:** [Python 3.11+ / TypeScript 5+ / Go 1.21+ / ...]
- **Framework:** [FastAPI / Next.js / Gin / ...]

## Linting & Formatting

```bash
# Python
black src/ tests/       # format
flake8 src/ tests/      # lint
mypy src/               # type check
pytest tests/ -v        # test

# TypeScript
eslint src/             # lint
prettier --write src/   # format
tsc --noEmit            # type check
```

## Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Variables | `snake_case` | `user_id` |
| Functions | `snake_case` | `get_user_by_id()` |
| Classes | `PascalCase` | `UserService` |
| Constants | `UPPER_SNAKE` | `MAX_RETRIES` |
| Files | `snake_case` | `user_service.py` |

## Mandatory in Every Function

1. Type hints
2. Docstring (for public APIs)
3. Error handling (no silent failures)
4. No hardcoded values

## Git Commit Format

```
[TASK-XXX] Short imperative summary

- What changed
- Why it changed
```
