// Scope can also be set for resource groups, management groups and subscriptions
targetScope = 'subscription'

@description('Location for all resources.')
param location string = 'westeurope'

@description('set resource group')
param resourcePrefix string = 'bicep-aks'

var resourceGroupName = '${resourcePrefix}-rg'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module aks './modules/aks-cluster.bicep' = {
  name: resourcePrefix
  scope: rg
  params: {
    location: location
    clusterName: resourcePrefix
  }
}
