# Traefik on Kubernetes

## Steps

* Patch kube manifests with your data (edit what is inside brackets).

```bash
DOMAIN=[YOUR_DOMAIN]
EMAIL=[YOUR_EMAIL]
CONSUL_HTTP_TOKEN=[YOUR_CONSUL_HTTP_TOKEN]
CLOUDFLARE_EMAIL=[YOUR_CLOUDFLARE_EMAIL]
CLOUDFLARE_API_KEY=[YOUR_CLOUDFLARE_API_KEY]
```

```bash
sed -e "s/REPLACE-WITH-DOMAIN/${YOUR_DOMAIN}/g" -i "" config-map.yaml traefik.yaml
sed -e "s/REPLACE-WITH-EMAIL/${YOUR_EMAIL}/g" -i "" config-map.yaml
```

```bash
sed -e "s/REPLACE-WITH-CONSUL-HTTP-TOKEN/${CONSUL_HTTP_TOKEN}/g" -i "" consul-job.yaml traefik.yaml
sed -e "s/REPLACE-WITH-CLOUDFLARE-EMAIL/${CLOUDFLARE_EMAIL}/g" -i "" consul-job.yaml traefik.yaml
sed -e "s/REPLACE-WITH-CLOUDFLARE-API-KEY/${CLOUDFLARE_API_KEY}/g" -i "" consul-job.yaml traefik.yaml
```

* Create config map with Traefik data.

```bash
kubectl apply -f config-map.yaml
```

* Create a Job for populating Consul with Traefik configuration.

```bash
kubectl apply -f consul-job.yaml
```

* Deploy Traefik.

```bash
kubectl apply -f traefik.yaml
```