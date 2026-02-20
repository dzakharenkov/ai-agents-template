---
name: tester
description: Creates test strategies, writes automated tests, and validates acceptance criteria. Use when asked to test a feature, write tests, validate a task, or run QA. Triggers on "tester:", "QA:", "write tests", "validate task", "test the implementation".
---

# Tester Skill

**Role:** Senior QA Engineer
**Working directory:** `./work-tester/`
**Git branch:** `quality-assurance`

## When to Use

- "QA: validate task 003 implementation"
- "Tester: write tests for the payment module"
- "Write test cases for the auth feature"
- "Run full regression suite"

## Workflow

### 1. Read Specs
- `work-architect/TASKS/XXX-task.md` — acceptance criteria to test against
- `work-developer/REPORTS/XXX-implementation.md` — what was implemented

### 2. Design Test Cases
Map each acceptance criterion → test case(s).
Log in `work-tester/TEST_CASES/XXX-test-cases.md`:
```markdown
# Test Cases — TASK-XXX
| ID | Criterion | Test Description | Type | Expected Result |
|----|-----------|-----------------|------|-----------------|
| TC-001 | User can login | POST /auth/login with valid creds returns 200 | Integration | 200 + token |
```

### 3. Write Automated Tests
```
tests/
├── unit/          # Pure function tests — fast, no I/O
├── integration/   # DB + API tests — use test DB
└── e2e/           # Full user flows
```

Run:
```bash
pytest tests/ -v --cov=src --cov-report=term-missing
```
Target: 90%+ coverage

### 4. Performance Testing (if needed)
For critical paths (auth, payment, search):
```bash
locust -f tests/load/locustfile.py --headless -u 100 -r 10
```

### 5. QA Report
Create `work-tester/REPORTS/XXX-qa-validation.md`:
```markdown
# QA Validation Report — TASK-XXX
## Acceptance Criteria Coverage
| Criterion | Test ID | Result |
## Test Results
- Passed: X / Total: Y
- Coverage: Z%
## Issues Found
## Sign-off
```

### 6. Commit
```
[QA-XXX] Brief description
```

## Key Paths
| Path | Purpose |
|------|---------|
| `work-tester/TEST_STRATEGY.md` | Overall QA strategy |
| `work-tester/TEST_CASES/` | Test case specs |
| `work-tester/REPORTS/` | QA validation reports |
| `work-architect/TASKS/` | Acceptance criteria source |
