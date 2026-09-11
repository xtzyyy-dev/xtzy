# XTZYYY Premium API — AUTO DEPLOY

Dari Termux, jalankan satu script untuk memasang GitHub Secrets dan memicu Cloudflare deployment.

```bash
pkg install git gh unzip -y
chmod +x AUTO-DEPLOY.sh
./AUTO-DEPLOY.sh
```

Script akan meminta Cloudflare Account ID dan API Token secara lokal, lalu menyimpannya sebagai GitHub Secrets. Token tidak ditulis ke source atau ZIP.

Jika token pernah dibagikan, revoke token tersebut di Cloudflare dan buat token baru.
