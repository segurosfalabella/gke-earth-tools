# Set gcloud environment
## Install gcloud cli

## login 
```bash
gcloud auth login
```

## Verify organization and projects
```bash
gcloud organizations list
```

```bash
gcloud projects list
```

## Crate a new project (if you want)

```bash
gcloud projects create [PROJECT_ID] --enable-cloud-apis=[LIST_OF_APIS_SEPARATED_BY_COMA] --organization=[ORGANIZATION_ID] --name=[PROJECT_PRETTY_NAME]
```

## Create a service account key
```bash
gcloud iam service-accounts keys create ~/key.json --iam-account [SA_NAME]@[PROJECT_ID].iam.gserviceaccount.com
```

# Set Env and Terraform Variables
Export gcloud account service keys to the system

```bash
export GOOGLE_APPLICATION_CREDENTIALS=~/key.json
```
## Fetch compute list of services and zones to prepare
```bash
gcloud compute zones list
```

## Fetch all services (if you dont remember the name of one of them)

```bash
gcloud services list 
```	

## Enable kubernetes API
```bash
gcloud components install kubectl
```

## Enable kubernetes component 
**NOTE:** If you have an older version remove from your bin path. An error happen if you have a previous version of kubectl in your system.

```bash
gcloud components install kubectl
```

## Enable kubernetes API in Account Service (Google Cloud Console)
**NOTE:**  I foundn't this option in gcloud cli so you must go to the google console direclty and add to your Service Account the function of "Kubernates Engine Admin"

**TODO**

- [] Add command line instruction to add specific API to Service Account.

## Bind service account role editor
```bash
gcloud projects add-iam-policy-binding [PROJECT_ID] \
    --member serviceAccount:[SA_NAME]@[PROJECT_ID].iam.gserviceaccount.com --role roles/editor`
```

## Search for Gke's right version for master an nodes 
Search for latest version of GKE and edit on **[ENVIRONMENT].ftvars**

```bash
gcloud container get-server-config --zone=[ZONE_ID]
```

## TERRAFORM
Check your **[ENVIRONMENT].ftvars** and vars.tf 

### Test that everything is OK
```bash
terraform plan -var-file [ENVIRONMENT].tfvars
```
### Create your cluster on Google Cloud
```bash
terraform plan -var-file [ENVIRONMENT].tfvars
```
Enjoy!!


# TODO
- [] Improve docs
- [] 