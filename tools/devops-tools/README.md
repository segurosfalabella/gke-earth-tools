# DevOps tools on Kubernetes

## Steps

* Patch kube manifest with your Google Container Registry Project (edit what is inside brackets).

```bash
GCP_PROJECT=[YOUR_GCP_PROJECT_ID]
sed -e "s/GCP-PROJECT-ID/${GCP_PROJECT}/g" -i "" devops-tools.yaml
```

* Deploy DevOps tools.

```bash
kubectl apply -f devops-tools.yaml
```

## Access

This tool is using [Fish Shell](https://fishshell.com), to get inside the container execute:

```bash
kubectl exec -it \
  (kubectl get pod -n kube-system \
  --selector="app=devops-tools" \
  --output jsonpath='{.items[0].metadata.name}') \
  -- fish
```