#!/usr/bin/env bash
set -e
REPO_URL="https://github.com/xtzyyy-dev/xtzy.git"
BRANCH="main"

echo "=== XTZYYY Premium API — GitHub Deploy ==="
echo "Repo: $REPO_URL"
command -v git >/dev/null 2>&1 || { echo "Git belum terpasang."; exit 1; }
git init 2>/dev/null || true
git branch -M "$BRANCH"
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"
git config user.name >/dev/null 2>&1 || git config user.name "xtzyyy-dev"
git config user.email >/dev/null 2>&1 || git config user.email "xtzyyy-dev@users.noreply.github.com"
git add .
git commit -m "Deploy XTZYYY Premium API" 2>/dev/null || true
echo
echo "Push ke GitHub:"
echo "  git push -u origin main"
echo
echo "Jika remote main memang ingin ditimpa:"
echo "  git push -u origin main --force"
