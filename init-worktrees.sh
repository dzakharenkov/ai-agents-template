#!/usr/bin/env bash
# ================================================================
# init-worktrees.sh — Initialise Git worktrees for AI agents
# Run once after cloning the template to a new project
# Usage: bash init-worktrees.sh
# ================================================================

set -e

declare -A WORKTREES=(
    ["work-architect"]="architecture-design"
    ["work-developer"]="feature-implementation"
    ["work-documentor"]="documentation"
    ["work-security"]="security-audit"
    ["work-tester"]="quality-assurance"
)

echo ""
echo "🚀 Initialising AI Agent worktrees..."

# Fetch all remote branches
git fetch --all

for dir in "${!WORKTREES[@]}"; do
    branch="${WORKTREES[$dir]}"

    if [ -d "$dir" ]; then
        echo "  ✅ $dir already exists — skipping"
        continue
    fi

    echo "  🔧 Creating $dir [branch: $branch]"

    # Create local branch tracking remote if it doesn't exist
    if ! git branch --list "$branch" | grep -q "$branch"; then
        git branch "$branch" "origin/$branch"
    fi

    git worktree add "$dir" "$branch"
    echo "     ✅ Done"
done

echo ""
echo "📋 Worktree status:"
git worktree list

echo ""
echo "✅ All worktrees ready. Open project in Cursor and agents are available."
