#!/usr/bin/env bash
set -euo pipefail
REPO="xtzyyy-dev/xtzy"; BRANCH="main"
echo '=== XTZYYY PREMIUM API — AUTO DEPLOY ==='
command -v git >/dev/null || { echo 'Git belum terpasang: pkg install git -y'; exit 1; }
command -v gh >/dev/null || { echo 'GitHub CLI belum terpasang: pkg install gh -y'; exit 1; }
if ! gh auth status >/dev/null 2>&1; then
  echo '[1] Login GitHub...'; gh auth login --web
fi
gh auth setup-git
git init >/dev/null 2>&1 || true
git branch -M "$BRANCH"
git remote remove origin >/dev/null 2>&1 || true
git remote add origin "https://github.com/$REPO.git"
git config user.name >/dev/null 2>&1 || git config user.name xtzyyy-dev
git config user.email >/dev/null 2>&1 || git config user.email xtzyyy-dev@users.noreply.github.com
echo
echo '[2] Cloudflare Account ID:'
read -r CF_ACCOUNT_ID
[ -n "$CF_ACCOUNT_ID" ] || { echo 'Account ID kosong.'; exit 1; }
echo
echo '[3] Cloudflare API Token (tidak ditampilkan):'
read -r -s CF_API_TOKEN; echo
[ -n "$CF_API_TOKEN" ] || { echo 'Token kosong.'; exit 1; }
echo '[4] Menyimpan GitHub Secrets...'
gh secret set CLOUDFLARE_ACCOUNT_ID --repo "$REPO" --body "$CF_ACCOUNT_ID"
gh secret set CLOUDFLARE_API_TOKEN --repo "$REPO" --body "$CF_API_TOKEN"
unset CF_API_TOKEN CF_ACCOUNT_ID
echo '[5] Push source...'
git add .
git commit -m 'Deploy XTZYYY Premium API' >/dev/null 2>&1 || true
git push -u origin "$BRANCH"
echo '[6] Menjalankan workflow...'
gh workflow run 'Deploy XTZYYY Premium API' --repo "$REPO" --ref "$BRANCH" || true
echo
echo '=== SELESAI: deployment diproses GitHub Actions ==='
echo 'Status: gh run list --repo xtzyyy-dev/xtzy --limit 1'
