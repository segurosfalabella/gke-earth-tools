# Drone on Kubernetes

## Steps

* Create a secret and patch kube manifest.

```bash
TOKEN=`openssl rand -base64 8 | md5 | head -c8; echo`
B64_TOKEN=`echo $TOKEN | base64`
sed -e "s/REPLACE-WITH-BASE64-VALUE/${B64_TOKEN}/g" -i "" drone.yaml
```

* Patch manifest with Domain and Github info (edit what is inside brackets).

```bash
DOMAIN=[YOUR_DOMAIN]
GITHUB_CLIENT=[YOUR_GITHUB_CLIENT]
GITHUB_SECRET=[YOUR_GITHUB_SECRET]
sed -e "s/REPLACE-WITH-DOMAIN/${DOMAIN}/g" -i "" drone.yaml
sed -e "s/REPLACE-WITH-CLIENT/${GITHUB_CLIENT}/g" -i "" drone.yaml
sed -e "s/REPLACE-WITH-SECRET/${GITHUB_SECRET}/g" -i "" drone.yaml
```

* Deploy Drone.

```bash
kubectl apply -f drone.yaml
```