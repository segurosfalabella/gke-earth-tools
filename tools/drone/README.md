# Drone on Kubernetes

## Steps

* Create secret

```bash
# Randomly generate secret and patch drone-secret manifest
drone_token=`openssl rand -base64 8 | md5 | head -c8; echo`
b64_drone_token=`echo $drone_token | base64`
sed -e "s/REPLACE-WITH-BASE64-VALUE/${b64_drone_token}/g" -i "" drone.yaml
```

* create K8s resources for Drone

```bash
kubectl create -f drone.yaml
```