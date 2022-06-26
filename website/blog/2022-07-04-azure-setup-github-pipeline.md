---
slug: azure-setup-github-pipeline
title: Setup Azure Login Action
authors: graemel
tags: [azure, github, cli]
---

Time to write down the recipe for connecting a Github pipeline into Azure without googling!  Let's start with a problem statement:


:::info Problem Statement

How do I allow my Github actions based pipeline perform actions directly against Azure?

:::

Within the context of a subscription I am interested in being able to:

- Create resource groups,
- Create and configure resources into these resource groups,
- Manipulate these resources,
- Create service principles,
- Create roles, and
- Assign roles to service principles

## Create the Service Principal

```bash
SP_NAME="myApp"
SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

az ad sp create-for-rbac \
    --name "$SP_NAME" \
    --role contributor \
    --scopes /subscriptions/"$SUBSCRIPTION_ID" \
    --sdk-auth
```

:::note

Running this command returns the deprecation warning 

```
Option '--sdk-auth' has been deprecated and will be removed in a future release.
```

I am not sure what this will be replaced with however will update once I know.

:::

This returns a JSON value with the following format:

```json
{
  "clientId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "clientSecret": "0000000000000000000000000000000000000000",
  "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

## Store in Github

Within your github project, navigate to *Settings*, *Secrets*, *Actions* and add the JSON from above as a secret named `AZURE_CREDENTIALS` into *Repository Secrets*.

## Use in Github

Add the following task into a pipeline.

```yaml
- name: Login to Azure
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
```

On other occasions it is necessary to place a component of this secret into the environment so that it is accessible to shell scripts.  I use the following task to do that.

```yaml
- name: Set PRINCIPAL ID
  run: |
    PRINCIPAL_ID=`echo '${{ secrets.AZURE_CREDENTIALS }}' | jq -r '.clientId'`
    echo "PRINCIPAL_ID=$PRINCIPAL_ID" >> $GITHUB_ENV
```


# See Also

- [Azure CLI Basics: Logging In](https://craigforrester.com/posts/azure-cli-basics-logging-in/) is a really nice blog post containing some helpful CLI commands.