# Technical Design

> Design patterns, code conventions, and technical decisions for this project.

## Code Patterns

### API Endpoints (example: FastAPI)
```python
@router.get("/items/{item_id}", response_model=ItemResponse)
async def get_item(
    item_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
) -> ItemResponse:
    """Get item by ID."""
    item = await item_service.get_by_id(db, item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    return item
```

### Error Handling
```python
# Use structured error responses
class APIError(Exception):
    def __init__(self, status_code: int, message: str):
        self.status_code = status_code
        self.message = message
```

### Configuration
```python
# Use pydantic Settings — never hardcode secrets
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    database_url: str
    api_key: str

    class Config:
        env_file = ".env"
```

## Database Conventions

- Migrations: Alembic
- Naming: `snake_case` for tables and columns
- All tables have: `id`, `created_at`, `updated_at`
- Soft delete: `deleted_at` nullable timestamp

## Testing Conventions

```python
# Arrange / Act / Assert pattern
def test_create_user():
    # Arrange
    payload = {"email": "test@example.com", "password": "secret"}
    # Act
    response = client.post("/users", json=payload)
    # Assert
    assert response.status_code == 201
    assert response.json()["email"] == payload["email"]
```

## Commit Convention

```
[TASK-XXX] Short imperative summary (max 72 chars)

- Detail 1
- Detail 2
```

## Directory Structure

```
src/
├── api/          # Route handlers
├── services/     # Business logic
├── models/       # Database models
├── schemas/      # Pydantic schemas
├── core/         # Config, database, deps
└── utils/        # Shared utilities
tests/
├── unit/
├── integration/
└── e2e/
```
