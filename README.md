# 🤖 AI Agents Multi-Worktree Template

> **Шаблон для запуска 5 специализированных AI-агентов в Cursor.**
> Каждый агент работает в своей изолированной git-ветке и папке.
> Скопируй в новый проект → запусти скрипт → агенты готовы.

---

## 📋 Содержание

1. [Концепция](#концепция)
2. [Структура проекта](#структура-проекта)
3. [Быстрый старт](#быстрый-старт)
4. [Агенты в Cursor](#агенты-в-cursor)
5. [Воркфлоу разработки](#воркфлоу-разработки)
6. [Использование на новом проекте](#использование-на-новом-проекте)
7. [Git-ветки и воркдеревья](#git-ветки-и-воркдеревья)
8. [Справочник команд](#справочник-команд)

---

## Концепция

Каждый AI-агент — отдельный специалист, работающий **в своей папке и ветке**:

```
main (шаблон / мета-файлы)
├── work-architect/   → ветка: architecture-design
├── work-developer/   → ветка: feature-implementation
├── work-documentor/  → ветка: documentation
├── work-security/    → ветка: security-audit
└── work-tester/      → ветка: quality-assurance
```

**Почему изоляция важна:**
- Архитектор пишет спеки в `work-architect/TASKS/` → Разработчик читает и пишет код → Тестер проверяет → Security аудирует
- Каждый агент коммитит в свою ветку — история чистая и читаемая
- Нет конфликтов между агентами, параллельная работа

**Cursor интеграция — 3 механизма на каждого агента:**

| Механизм | Файл | Когда срабатывает |
|---------|------|------------------|
| **Agent** | `.cursor/agents/NAME.md` | Прямой вызов: "Architect: ..." |
| **Rule** | `.cursor/rules/NAME.mdc` | Автоматически при открытии файлов из `globs` |
| **Skill** | `.cursor/skills/NAME/SKILL.md` | Slash-команда `/NAME` или по триггер-фразам |

---

## Структура проекта

```
[project-root]/
│
├── .cursor/                        # Cursor конфиг (трекается в git)
│   ├── agents/
│   │   ├── architect.md            # Agent definition
│   │   ├── developer.md
│   │   ├── documentor.md
│   │   ├── security.md
│   │   └── tester.md
│   ├── rules/
│   │   ├── architect.mdc           # Auto-applies by file glob
│   │   ├── developer.mdc
│   │   ├── documentor.mdc
│   │   ├── security.mdc
│   │   └── tester.mdc
│   └── skills/
│       ├── architect/SKILL.md      # Slash-command / trigger skill
│       ├── developer/SKILL.md
│       ├── documentor/SKILL.md
│       ├── security/SKILL.md
│       └── tester/SKILL.md
│
├── work-architect/                 # АРХИТЕКТОР (branch: architecture-design)
│   ├── architect.md                # Системный промт агента
│   ├── ARCHITECTURE.md             # Архитектура системы
│   ├── TECHNICAL_DESIGN.md         # Паттерны и стандарты кода
│   ├── DECISIONS.md                # ADR (Architecture Decision Records)
│   └── TASKS/
│       ├── INDEX.md                # Индекс всех задач
│       └── XXX-task-name.md        # Спека на задачу
│
├── work-developer/                 # РАЗРАБОТЧИК (branch: feature-implementation)
│   ├── developer.md                # Системный промт агента
│   ├── PROGRESS.md                 # Общий прогресс
│   ├── CODE_STANDARDS.md           # Стандарты кода проекта
│   └── REPORTS/
│       └── XXX-implementation.md   # Отчёт о реализации задачи
│
├── work-documentor/                # ДОКУМЕНТАТОР (branch: documentation)
│   ├── documentor.md               # Системный промт агента
│   ├── DOCUMENTATION_GUIDE.md      # Стиль документации
│   └── REPORTS/
│
├── work-security/                  # SECURITY (branch: security-audit)
│   ├── security.md                 # Системный промт агента
│   ├── SECURITY_POLICY.md          # Политика безопасности
│   ├── VULNERABILITIES.md          # Лог уязвимостей
│   └── AUDIT_REPORTS/
│
├── work-tester/                    # ТЕСТЕР (branch: quality-assurance)
│   ├── tester.md                   # Системный промт агента
│   ├── TEST_STRATEGY.md            # Стратегия тестирования
│   ├── TEST_CASES/
│   └── REPORTS/
│
├── docs/                           # Финальная документация (в main)
├── src/                            # Исходный код проекта
├── tests/                          # Тесты (unit / integration / e2e)
│
├── init-worktrees.ps1              # Запустить после клонирования (Windows)
├── init-worktrees.sh               # Запустить после клонирования (Mac/Linux)
├── config.json
└── README.md
```

---

## Быстрый старт

### Вариант A — через GitHub "Use this template" (рекомендуется)

1. Открыть https://github.com/dzakharenkov/ai-agents-template
2. Нажать **"Use this template"** → **"Create a new repository"**
3. Указать имя нового проекта, создать репозиторий

```bash
git clone https://github.com/YOUR_ORG/your-project.git
cd your-project

# Windows
.\init-worktrees.ps1

# Mac / Linux
bash init-worktrees.sh
```

### Вариант B — вручную через clone

```bash
git clone https://github.com/dzakharenkov/ai-agents-template.git my-project
cd my-project

# Переключить remote на свой репо
git remote set-url origin https://github.com/YOUR_ORG/my-project.git
git push -u origin main

# Восстановить воркдеревья
.\init-worktrees.ps1
```

### Проверить что всё готово

```bash
git worktree list
# Ожидаемый вывод — 6 строк:
# D:/path/to/project           abc123 [main]
# D:/path/to/project/work-architect  ... [architecture-design]
# D:/path/to/project/work-developer  ... [feature-implementation]
# D:/path/to/project/work-documentor ... [documentation]
# D:/path/to/project/work-security   ... [security-audit]
# D:/path/to/project/work-tester     ... [quality-assurance]
```

Открыть корневую папку в Cursor:
```
File → Open Folder → my-project/
```

---

## Агенты в Cursor

### 3 способа вызвать агента

#### 1. Прямой вызов по имени (Agent)

```
Architect: спроектируй систему аутентификации
Developer: implement task 001
Security: audit the auth module
QA: validate task 001
Documentor: write API docs for auth
```

#### 2. Автоматическое применение (Rule)

Rules применяются сами, когда открыт нужный файл:

| Открытый файл | Активное правило |
|--------------|-----------------|
| `work-architect/TASKS/*.md` | `architect.mdc` |
| `work-developer/REPORTS/*.md` | `developer.mdc` |
| `src/**/*` | `developer.mdc` |
| `work-tester/TEST_CASES/*.md` | `tester.mdc` |
| `work-security/VULNERABILITIES.md` | `security.mdc` |
| `docs/*.md` | `documentor.mdc` |

#### 3. Slash-команды (Skill)

```
/architect  → Architect Skill
/developer  → Developer Skill
/tester     → Tester Skill
/security   → Security Skill
/documentor → Documentor Skill
```

Или по ключевым словам:

| Фраза | Агент |
|-------|-------|
| `"implement task 003"` | Developer |
| `"create task spec"` | Architect |
| `"audit the payment module"` | Security |
| `"write tests for auth"` | Tester |
| `"document the API"` | Documentor |

---

## Воркфлоу разработки

### Стандартный цикл задачи

```
1. ARCHITECT → создаёт спеку
   work-architect/TASKS/001-feature.md
   git commit: [ARCH-001] Add task spec for feature

2. DEVELOPER → реализует
   src/feature/ + tests/
   git commit: [TASK-001] Implement feature
   work-developer/REPORTS/001-implementation.md

3. TESTER (параллельно) → валидирует
   work-tester/TEST_CASES/001-test-cases.md
   git commit: [QA-001] Add test cases for feature

4. SECURITY (параллельно) → аудирует
   work-security/AUDIT_REPORTS/001-security-audit.md
   git commit: [SEC-001] Security audit for feature

5. DOCUMENTOR → документирует
   docs/feature.md
   git commit: [DOCS-001] Add feature documentation
```

### Команды

```bash
# Шаг 1: Архитектор
cd work-architect
# Cursor: "Architect: create task spec for user authentication"
git add TASKS/ DECISIONS.md && git commit -m "[ARCH-001] Add task spec for user authentication"
git push origin architecture-design

# Шаг 2: Разработчик
# Cursor: "Implement: work-architect/TASKS/001-user-auth.md"
cd work-developer
git add REPORTS/ && git commit -m "[TASK-001] Implement user authentication"
git push origin feature-implementation

# Шаг 3 + 4 можно параллельно
cd work-tester   && git push origin quality-assurance
cd work-security && git push origin security-audit

# Шаг 5
cd work-documentor && git push origin documentation
```

---

## Использование на новом проекте

### Чеклист настройки

- [ ] Клонировал шаблон / создал из GitHub template
- [ ] Запустил `init-worktrees.ps1` или `init-worktrees.sh`
- [ ] Проверил `git worktree list` — 6 воркдеревьев
- [ ] Открыл **корневую** папку в Cursor
- [ ] Заполнил `work-architect/ARCHITECTURE.md` — описал систему
- [ ] Настроил `work-developer/CODE_STANDARDS.md` — язык, фреймворк, линтеры
- [ ] Настроил `work-tester/TEST_STRATEGY.md` — тест-фреймворк, команды
- [ ] Настроил `work-security/SECURITY_POLICY.md` — требования безопасности
- [ ] Обновил `config.json` — имя проекта, tech_stack
- [ ] Настроил `.cursor/mcp.json` если нужен MCP (не коммить секреты!)
- [ ] Тест: написал `"Architect: describe the project"` в Cursor

### Что нужно адаптировать под проект

**`work-architect/TECHNICAL_DESIGN.md`** — вставить реальные примеры кода на твоём языке/фреймворке

**`work-developer/CODE_STANDARDS.md`** — заменить Python-примеры на нужный стек:
```bash
# Python
black src/ && flake8 src/ && mypy src/ && pytest tests/ -v

# Node.js / TypeScript
eslint src/ && tsc --noEmit && jest --coverage

# Go
go vet ./... && go test ./... -cover
```

**`.cursor/skills/developer/SKILL.md`** — шаг "Verify Locally" — заменить команды на актуальные

---

## Git-ветки и воркдеревья

### Как устроено внутри

```
.git/  (один репозиторий)
  ├── refs/heads/main                    ← корень: .cursor/, README, init-скрипты
  ├── refs/heads/architecture-design     ← work-architect/
  ├── refs/heads/feature-implementation  ← work-developer/
  ├── refs/heads/documentation           ← work-documentor/
  ├── refs/heads/security-audit          ← work-security/
  └── refs/heads/quality-assurance       ← work-tester/
```

Файл `work-architect/.git` — это **файл** (не папка), указывающий на главный `.git`. Именно поэтому git понимает что это воркдерево.

### Полезные команды

```bash
# Статус всех воркдеревьев
git worktree list

# Статус конкретного агента без cd
git -C work-architect status
git -C work-developer log --oneline -5

# Добавить нового агента (например DevOps)
git checkout -b devops main
git push origin devops
git worktree add work-devops devops

# Удалить воркдерево (ветка остаётся)
git worktree remove work-tester
# Восстановить
git worktree add work-tester quality-assurance

# Посмотреть все ветки
git branch -vv
```

---

## Справочник команд

### Вызовы агентов в Cursor

| Фраза | Агент | Результат |
|-------|-------|-----------|
| `"Architect: design X"` | Architect | Проектирует, создаёт TASK спеки |
| `"Create task spec for X"` | Architect | `work-architect/TASKS/XXX-x.md` |
| `"Implement task 001"` | Developer | Читает спеку, пишет код + тесты |
| `"Developer: do task 002"` | Developer | То же самое |
| `"QA: validate task 001"` | Tester | Проверяет критерии, пишет тест-кейсы |
| `"Write tests for X"` | Tester | Пишет автотесты |
| `"Security: audit X"` | Security | Проверяет на уязвимости |
| `"Check deps for vulns"` | Security | Запускает pip/npm audit |
| `"Document X"` | Documentor | Пишет документацию |
| `"Update README"` | Documentor | Обновляет `docs/` |

### Форматы коммитов

| Агент | Префикс | Пример |
|-------|---------|--------|
| Architect | `[ARCH-XXX]` | `[ARCH-001] Add task spec for auth` |
| Developer | `[TASK-XXX]` | `[TASK-001] Implement user login` |
| Tester | `[QA-XXX]` | `[QA-001] Add auth integration tests` |
| Security | `[SEC-XXX]` | `[SEC-001] Fix hardcoded API key` |
| Documentor | `[DOCS-XXX]` | `[DOCS-001] Add auth API documentation` |

---

*Template repo: [ai-agents-template](https://github.com/dzakharenkov/ai-agents-template)*
