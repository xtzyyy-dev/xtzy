# XTZYYY Premium API — GitHub Only

Deployment: **GitHub → GitHub Actions → Cloudflare Workers**.

Repository: `https://github.com/xtzyyy-dev/xtzy.git`

Public domain: `https://xtzyyy.my.id`

## Production

The production app does not require a Termux Node.js server or Cloudflare Tunnel. The Worker in `worker.js` serves the API and the `public/` website.

## GitHub Secrets

Add these repository Actions secrets:

- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`

The API token must be allowed to deploy Workers. Never commit secrets or API keys to Git.

## Cloudflare

The Cloudflare zone for `xtzyyy.my.id` must be **Active** in the same Cloudflare account as the deployment credentials. `wrangler.toml` configures `xtzyyy.my.id` as the Worker custom domain.

## Automatic deployment

Every push to `main` runs `.github/workflows/deploy-cloudflare.yml`. It can also be started manually from GitHub Actions.

## GitHub push

```bash
./DEPLOY-GITHUB.sh
git push -u origin main
```

No `npm start` is required for production deployment.
