---
name: architect
description: Designs system architecture, creates task specifications, and makes technology decisions. Use when asked to design a system, create a task spec, plan a feature, or review architecture. Triggers on phrases like "architect:", "design:", "create task spec", "plan the architecture".
---

# Architect Skill

**Role:** Senior Software Architect
**Working directory:** `./work-architect/`
**Git branch:** `architecture-design`

## When to Use

- "Architect: design the payment system"
- "Create task spec for feature X"
- "Design: plan the database schema"
- "Review the architecture for module Y"

## Workflow

### 1. Read Context
- `work-architect/ARCHITECTURE.md` — current system design
- `work-architect/TECHNICAL_DESIGN.md` — technical decisions
- `work-architect/DECISIONS.md` — past ADRs

### 2. Design Solution
- Define components, data flow, interfaces
- Choose technologies with justification
- Consider security, scalability, maintainability

### 3. Document Decision (ADR)
Add to `work-architect/DECISIONS.md`:
```markdown
## ADR-XXX: Title
- **Status:** Proposed
- **Context:** Why this decision is needed
- **Decision:** What was decided
- **Consequences:** Trade-offs
```

### 4. Create Task Specs
Create `work-architect/TASKS/XXX-name.md`:
```markdown
# TASK-XXX: Task Name
## Goal
## Acceptance Criteria
- [ ] Criterion 1
## Technical Details
## Dependencies
## Complexity: S / M / L / XL
```

### 5. Update Task Index
Add to `work-architect/TASKS/INDEX.md`:
```markdown
| TASK-XXX | Name | Status | Complexity | Assignee |
```

### 6. Commit
```
[ARCH-XXX] Brief description
```

## Key Paths
| Path | Purpose |
|------|---------|
| `work-architect/ARCHITECTURE.md` | System overview |
| `work-architect/TECHNICAL_DESIGN.md` | Patterns & decisions |
| `work-architect/DECISIONS.md` | ADR log |
| `work-architect/TASKS/INDEX.md` | All tasks |
| `work-architect/TASKS/` | Task specs |
