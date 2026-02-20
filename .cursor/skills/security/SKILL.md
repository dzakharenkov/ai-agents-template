---
name: security
description: Audits code for security vulnerabilities, checks compliance, reviews dependencies. Use when asked to audit code, check for vulnerabilities, review security, or run a security scan. Triggers on "security:", "audit:", "check for vulnerabilities", "security review".
---

# Security Skill

**Role:** Senior Security Engineer
**Working directory:** `./work-security/`
**Git branch:** `security-audit`

## When to Use

- "Security: audit the authentication module"
- "Run security review on task 005 implementation"
- "Check dependencies for vulnerabilities"
- "Audit: review the API endpoints"

## Workflow

### 1. Read Context
- `work-security/SECURITY_POLICY.md` — project security requirements
- `work-security/VULNERABILITIES.md` — known issues

### 2. Audit Checklist
Run through each category:

**Secrets & Configuration**
- [ ] No hardcoded passwords, API keys, tokens
- [ ] Sensitive config loaded from env vars
- [ ] `.env` in `.gitignore`

**Authentication & Authorization**
- [ ] All protected routes require auth
- [ ] Role-based access control implemented
- [ ] Session management secure

**Input Validation**
- [ ] All user inputs validated and sanitized
- [ ] SQL injection prevention (parameterized queries / ORM)
- [ ] XSS prevention (output encoding)

**Dependencies**
```bash
pip audit          # Python
npm audit          # Node.js
```

**Logging**
- [ ] No PII in logs
- [ ] Security events logged (login failures, access denied)

### 3. Document Findings
Add to `work-security/VULNERABILITIES.md`:
```markdown
## VULN-XXX: Title
- **Severity:** Critical / High / Medium / Low
- **Location:** file:line
- **Description:** What the issue is
- **Fix:** How to remediate
- **Status:** Open / Fixed
```

### 4. Audit Report
Create `work-security/AUDIT_REPORTS/XXX-security-audit.md`:
```markdown
# Security Audit Report — AUDIT-XXX
## Scope
## Findings Summary
| ID | Severity | Status |
## Detailed Findings
## Recommendations
```

### 5. Commit
```
[SEC-XXX] Brief description
```

## Key Paths
| Path | Purpose |
|------|---------|
| `work-security/SECURITY_POLICY.md` | Security requirements |
| `work-security/VULNERABILITIES.md` | Vulnerability log |
| `work-security/AUDIT_REPORTS/` | Audit reports |
