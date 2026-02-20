# ================================================================
# init-worktrees.ps1 — Initialise Git worktrees for AI agents
# Run once after cloning the template to a new project
# Usage: .\init-worktrees.ps1
# ================================================================

$ErrorActionPreference = "Stop"

$worktrees = @(
    @{ Dir = "work-architect";  Branch = "architecture-design"   },
    @{ Dir = "work-developer";  Branch = "feature-implementation" },
    @{ Dir = "work-documentor"; Branch = "documentation"          },
    @{ Dir = "work-security";   Branch = "security-audit"         },
    @{ Dir = "work-tester";     Branch = "quality-assurance"      }
)

Write-Host "`n🚀 Initialising AI Agent worktrees..." -ForegroundColor Cyan

# Fetch all remote branches
git fetch --all

foreach ($wt in $worktrees) {
    if (Test-Path $wt.Dir) {
        Write-Host "  ✅ $($wt.Dir) already exists — skipping" -ForegroundColor Gray
        continue
    }

    Write-Host "  🔧 Creating $($wt.Dir) [branch: $($wt.Branch)]" -ForegroundColor Yellow

    # Create local branch tracking remote if it doesn't exist
    $branchExists = git branch --list $wt.Branch
    if (-not $branchExists) {
        git branch $wt.Branch origin/$($wt.Branch)
    }

    git worktree add $wt.Dir $wt.Branch
    Write-Host "     ✅ Done" -ForegroundColor Green
}

Write-Host "`n📋 Worktree status:" -ForegroundColor Cyan
git worktree list

Write-Host "`n✅ All worktrees ready. Open project in Cursor and agents are available." -ForegroundColor Green
