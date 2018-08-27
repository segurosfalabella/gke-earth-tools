# Certbot for Kong on Kubernetes

## Steps

* Patch config file with Cloudflare variables (edit what is inside brackets).

```bash
CLOUDFLARE_EMAIL=[YOUR_CLOUDFLARE_EMAIL]
CLOUDFLARE_API_KEY=[YOUR_CLOUDFLARE_API_KEY]
sed -e "s/CLOUDFLARE-EMAIL/${CLOUDFLARE_EMAIL}/g" -i "" inc/dns-server.ini
sed -e "s/CLOUDFLARE-API-KEY/${CLOUDFLARE_API_KEY}/g" -i "" inc/dns-server.ini
```

* Patch kube manifests with personal data (edit what is inside brackets).

```bash
DOMAIN=[YOUR_DOMAIN]
EMAIL=[YOUR_EMAIL]
GCP_PROJECT=[YOUR_GCP_PROJECT_ID]
sed -e "s/REPLACE-WITH-DOMAIN/${DOMAIN}/g" -i "" certbot-job.yaml certbot-cronjob.yaml
sed -e "s/REPLACE-WITH-EMAIL/${YOUR_EMAIL}/g" -i "" certbot-job.yaml certbot-cronjob.yaml
sed -e "s/GCP-PROJECT-ID/${GCP_PROJECT}/g" -i "" certbot-job.yaml certbot-cronjob.yaml
```

* Create Certbot Job.

```bash
kubectl apply -f certbot-job.yaml
```

* Create Certbot Cron Job scheduled to one time each three months.

```bash
kubectl apply -f certbot-cronjob.yaml
```