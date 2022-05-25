# Azure Bicep Playground

Exploring [Azure/Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/) to build production grade clusters.

## Prerequisites

- [Azure CLI: >=2.37.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

- [VS Code: Bicep Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)

## How to get started

```bash
git clone https://github.com/hivenetes/azure-bicep.git
cd azure-bicep
```

Validate whether a template is valid at subscription scope.

```bash
 az deployment sub validate --template-file ./aks-deployment.bicep --location westeurope
```

Start a deployment at subscription scope.

```bash
# --what-if flag is like `terraform plan` 
az deployment sub create --template-file ./aks-deployment.bicep --location westeurope --what-if

# Create the deployment
az deployment sub create --template-file ./aks-deployment.bicep --location westeurope

# Get access to managed K8s cluster
az aks get-credentials -n bicep-aks -g bicep-aks-rg
```

Cleanup.

`Note:` One can also clean up via [Azure Portal](https://portal.azure.com/)

```bash
# az group delete -n MyResourceGroup
az group delete -n bicep-aks-rg
```

### Reference

[Reference for managedClusters](https://docs.microsoft.com/en-us/azure/templates/microsoft.containerservice/managedclusters?tabs=bicep)