# 🤖 AI Agents Multi-Worktree System

Multi-agent AI system with 5 specialized agents working in parallel using Git worktrees.

## 📋 Agents

### 🏗️ Architecture Agent (architecture-design)
- **Location:** `work-architect/`
- **Role:** System design, technology selection, architecture decisions
- **Branch:** architecture-design

### 👨‍💻 Developer Agent (feature-implementation)
- **Location:** `work-developer/`
- **Role:** Code implementation, feature development, debugging
- **Branch:** feature-implementation

### 🧪 QA Agent (quality-assurance)
- **Location:** `work-tester/`
- **Role:** Testing strategy, test automation, quality assurance
- **Branch:** quality-assurance

### 🔒 Security Agent (security-audit)
- **Location:** `work-security/`
- **Role:** Security analysis, vulnerability assessment, compliance
- **Branch:** security-audit

### 📚 Documentation Agent (documentation)
- **Location:** `work-documentor/`
- **Role:** Technical documentation, user guides, API docs
- **Branch:** documentation

## 🚀 Quick Start

```bash
# Check all worktrees
git worktree list

# Switch to an agent's workspace
cd work-architect
git status

# View work in specific branch
git log --oneline architecture-design

# Switch back to main
cd ..
```

## 📁 Directory Structure

```
D:/AI_agents/
├── work-architect/       # Architecture Agent workspace
├── work-developer/       # Developer Agent workspace
├── work-documentor/      # Documentation Agent workspace
├── work-security/        # Security Agent workspace
├── work-tester/          # QA Agent workspace
└── README.md
```
