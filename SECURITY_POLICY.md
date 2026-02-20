# Security Policy

> Security requirements and standards for this project.

## Secrets Management

- **Never** commit secrets, passwords, API keys to git
- All secrets via environment variables or secrets manager
- `.env` must be in `.gitignore`
- Use `.env.example` with placeholder values only

## Authentication Requirements

- Passwords: bcrypt with cost factor ≥ 12
- Sessions: secure, httpOnly cookies or short-lived JWTs
- MFA: required for admin accounts
- Rate limiting: on all auth endpoints

## Input Validation

- Validate all user inputs server-side
- Use parameterized queries / ORM (no string interpolation in SQL)
- Sanitize HTML output to prevent XSS

## Dependency Policy

- Run `pip audit` / `npm audit` before each release
- No dependencies with Critical vulnerabilities
- Keep dependencies up to date (monthly review)

## Vulnerability Response

| Severity | Response Time | Action |
|----------|--------------|--------|
| Critical | 24h | Immediate patch + deploy |
| High | 72h | Patch in next release |
| Medium | 2 weeks | Planned fix |
| Low | Next sprint | Backlog |

## Logging

- Log security events: login failures, auth errors, access denied
- Never log: passwords, tokens, PII
- Audit log: retained for 90 days minimum
