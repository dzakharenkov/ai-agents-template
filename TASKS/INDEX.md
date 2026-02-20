# Task Index

> All tasks for this project. Status: 🔲 Todo | 🔄 In Progress | ✅ Done | ❌ Blocked

| ID | Task | Status | Complexity | Assignee | Branch |
|----|------|--------|-----------|---------|--------|
| - | *No tasks yet* | - | - | - | - |

## How to Add a Task

1. Create `TASKS/XXX-descriptive-name.md` with the task spec
2. Add a row to this index
3. Commit: `[ARCH-XXX] Add task spec for feature name`

## Task Spec Template

```markdown
# TASK-XXX: Task Name

## Goal
One sentence: what needs to be built and why.

## Acceptance Criteria
- [ ] Criterion 1 (measurable, testable)
- [ ] Criterion 2
- [ ] Criterion 3

## Technical Details
- Patterns to follow: see TECHNICAL_DESIGN.md
- Key files to modify: `src/...`
- External dependencies: none / list them

## Dependencies
- Blocked by: TASK-XXX (if any)
- Required before: TASK-YYY (if any)

## Complexity
**S** (< 2h) / **M** (2-8h) / **L** (1-3 days) / **XL** (> 3 days)
```
