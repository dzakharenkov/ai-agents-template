@"
# 🤖 AI Agents Multi-Worktree System

Multi-agent AI system with 5 specialized agents working in parallel using Git worktrees.

## 📋 Agents

### 🏗️ Architecture Agent (architecture-design)
- **Location:** `architect-work/`
- **Role:** System design, technology selection, architecture decisions
- **Branch:** architecture-design

### 👨‍💻 Developer Agent (feature-implementation)
- **Location:** `developer-work/`
- **Role:** Code implementation, feature development, debugging
- **Branch:** feature-implementation

### 🧪 QA Agent (quality-assurance)
- **Location:** `tester-work/`
- **Role:** Testing strategy, test automation, quality assurance
- **Branch:** quality-assurance

### 🔒 Security Agent (security-audit)
- **Location:** `security-work/`
- **Role:** Security analysis, vulnerability assessment, compliance
- **Branch:** security-audit

### 📚 Documentation Agent (documentation)
- **Location:** `documentor-work/`
- **Role:** Technical documentation, user guides, API docs
- **Branch:** documentation

## 🚀 Quick Start

```bash  
# Check all worktrees  
git worktree list  

# Switch to an agent's workspace  
cd architect-work  
git status  

# View work in specific branch  
git log --oneline architecture-design  

# Switch back to main  
cd ..  