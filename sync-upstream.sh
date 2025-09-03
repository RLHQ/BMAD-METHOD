#!/bin/bash

# BMAD-METHOD Upstream Sync Script
# Syncs updates from upstream to specified branch

set -e

# Default target branch
TARGET_BRANCH="main-zhcn"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --branch)
      TARGET_BRANCH="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [--branch BRANCH_NAME]"
      echo ""
      echo "Options:"
      echo "  --branch    Target branch to sync to (default: main-zhcn)"
      echo "  --help      Show this help message"
      echo ""
      echo "Examples:"
      echo "  $0                           # Sync to main-zhcn"
      echo "  $0 --branch main-zhcn-epub  # Sync to main-zhcn-epub"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo "🔄 Starting upstream sync to branch: $TARGET_BRANCH"

# Fetch latest from upstream
echo "📥 Fetching latest from upstream..."
git fetch upstream

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

# Switch to target branch if not already on it
if [ "$CURRENT_BRANCH" != "$TARGET_BRANCH" ]; then
  echo "🔀 Switching to branch: $TARGET_BRANCH"
  git checkout "$TARGET_BRANCH"
fi

# Check if upstream/main exists
if ! git show-ref --verify --quiet refs/remotes/upstream/main; then
  echo "❌ Error: upstream/main branch not found"
  exit 1
fi

# Show what changes will be merged
echo "📋 Changes to be merged:"
git log --oneline "$TARGET_BRANCH"..upstream/main | head -10

# Ask for confirmation
echo ""
read -p "Continue with merge? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "❌ Sync cancelled"
  exit 1
fi

# Merge upstream changes
echo "🔄 Merging upstream/main into $TARGET_BRANCH..."
git merge upstream/main

echo "✅ Successfully synced upstream changes to $TARGET_BRANCH"
echo "💡 Don't forget to push changes: git push origin $TARGET_BRANCH"