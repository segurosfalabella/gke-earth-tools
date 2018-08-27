# Prometheus, Grafana & Weave-Scope on Kubernetes

## Steps

* Set your domain for the UI (edit what is inside brackets).

```bash
DOMAIN=[YOUR_DOMAIN]
sed -e "s/REPLACE-WITH-DOMAIN/${DOMAIN}/g" -i "" prometheus.yaml
sed -e "s/REPLACE-WITH-DOMAIN/${DOMAIN}/g" -i "" grafana.yaml
sed -e "s/REPLACE-WITH-DOMAIN/${DOMAIN}/g" -i "" weavescope.yaml
```

* Deploy Prometheus.

```bash
kubectl apply -f prometheus.yaml
```

* Deploy Grafana.

```bash
kubectl apply -f grafana.yaml
```

* Deploy Weave-Scope.

```bash
kubectl apply -f weavescope.yaml
```