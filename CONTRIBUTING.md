# Contributing

This repository builds on two tools:

1. The base image from [pangeo-docker-image](https://github.com/pangeo-data/pangeo-docker-images)
2. [conda-lock](https://github.com/conda-incubator/conda-lock) to pre-solve a conda environment

See https://github.com/pangeo-data/pangeo-docker-images for more on the build process. Most dependencies should go in a conda `environment.yml` file.

The overall workflow is

- Specify requirements in `environment.yml`
- Re-solve the dependencies for an environment using conda-lock
- Push to planetary-computer-containers
- Create a release

Upon release, packages with changes since the last commit will be built and pushed to Microsoft Container Registry.

## Updating packages

You'll need to install conda / mamba and conda-lock. See https://mamba.readthedocs.io/en/latest/installation.html for installing mamba

```
$ mamba create -n conda-lock -c conda-forge conda-lock
$ conda activate conda-lock
```

Now you can re-solve the dependencies. Using either the makefile

```
$ make "<environment>/conda-linux-64.lock"
```

Which just calls `mamba lock` with some arguments.

## Azure Credentials

This repository has secret credentials to push to our Azure Container Registry. These were created in the "Planetary Computer" subscription following [this guide](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-service-principal#create-a-service-principal).

```bash
#!/bin/bash

ACR_NAME=pcccr
SERVICE_PRINCIPAL_NAME=planetary-computer-containers-service-principal

# Obtain the full registry ID for subsequent command args
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

SP_PASSWD=$(az ad sp create-for-rbac --name http://$SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpush --query password --output tsv)
SP_APP_ID=$(az ad sp show --id http://$SERVICE_PRINCIPAL_NAME --query appId --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "Service principal ID: $SP_APP_ID"
echo "Service principal password: $SP_PASSWD"
```
