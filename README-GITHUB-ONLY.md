# GitHub Only Deployment

1. Push the project to `xtzyyy-dev/xtzy`, branch `main`.
2. GitHub → Settings → Secrets and variables → Actions.
3. Add `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID`.
4. Push to `main` or run the workflow manually.
5. Cloudflare deploys `worker.js` plus `public/`.
6. The custom domain is `xtzyyy.my.id` once that Cloudflare zone is Active.

The production deployment no longer depends on a Termux process or Cloudflare Tunnel.
