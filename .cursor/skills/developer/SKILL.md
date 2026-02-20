---
name: developer
description: Implements tasks from work-architect/TASKS with production-grade code. Use when asked to implement a task, develop a feature, or execute a task spec. Triggers on "implement", "developer:", "develop task", or a task ID like "task 001".
---

# Developer Skill

**Role:** Senior Full-Stack Developer
**Working directory:** `./work-developer/`
**Git branch:** `feature-implementation`

## When to Use

- "Implement task 001"
- "Developer: do task 002"
- "Implement: work-architect/TASKS/003-task-name.md"

## Workflow

### 1. Read Task Specification
- Open `work-architect/TASKS/INDEX.md` to find the task
- Read full task file — understand all acceptance criteria
- Check dependencies (other tasks that must be done first)

### 2. Implement Code
Production-grade standards:
- ✅ Type hints on all functions
- ✅ Docstrings for public APIs
- ✅ Comprehensive error handling and logging
- ✅ No hardcoded values — use env vars or config
- ✅ Follow patterns in `work-architect/TECHNICAL_DESIGN.md`

### 3. Write Tests
```bash
pytest tests/ -v --cov=src --cov-report=term-missing
```
- Unit tests for each function
- Integration tests for key flows
- Target: 90%+ coverage

### 4. Verify
```bash
pytest tests/ -v
mypy src/
flake8 src/
```

### 5. Git Commit
```
[TASK-XXX] Brief description

- What changed
- Why it changed
```

### 6. Completion Report
Create `work-developer/REPORTS/XXX-implementation.md`:
```markdown
# TASK-XXX Implementation Report
## Acceptance Criteria
- [x] Criterion 1 ✓
## Files Changed
## Test Results
## Notes
```

## Key Paths
| Path | Purpose |
|------|---------|
| `work-architect/TASKS/` | Task specs (read first) |
| `work-architect/TECHNICAL_DESIGN.md` | Design patterns |
| `work-developer/CODE_STANDARDS.md` | Code style |
| `work-developer/REPORTS/` | Implementation reports |
