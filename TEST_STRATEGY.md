# Test Strategy

> QA approach and standards for this project.

## Test Pyramid

```
        /\
       /e2e\         ← Few, slow, critical paths only
      /------\
     /integrat\      ← API tests, DB tests
    /----------\
   /  unit tests \   ← Many, fast, isolated
  /--------------\
```

## Coverage Targets

| Type | Target | Tool |
|------|--------|------|
| Unit | 90%+ | pytest-cov |
| Integration | key flows | pytest |
| E2E | happy path + critical errors | playwright / selenium |

## Test Commands

```bash
# Run all tests
pytest tests/ -v --cov=src --cov-report=term-missing

# Run only unit tests
pytest tests/unit/ -v

# Run only integration
pytest tests/integration/ -v

# Run with specific marker
pytest tests/ -v -m "not slow"
```

## Test File Naming

```
tests/
├── unit/
│   └── test_user_service.py      # mirrors src/services/user_service.py
├── integration/
│   └── test_auth_api.py
└── e2e/
    └── test_checkout_flow.py
```

## What Must Be Tested

- Every acceptance criterion in task specs
- All API endpoints (happy path + error cases)
- Business logic edge cases
- Authentication and authorization
