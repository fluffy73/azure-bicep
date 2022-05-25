param location string = 'westeurope'
param clusterName string = 'bicep-aks'

param nodeCount int = 3
param vmSize string = 'Standard_F8s_v2'

resource aks 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'bicep'
        type: 'VirtualMachineScaleSets'
        availabilityZones: [
          '1' 
          
        ]
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
        enableAutoScaling: true
        minCount: 1
        maxCount: 3
        maxPods: 100
      }
    ]
    networkProfile: {
      networkPolicy: 'calico'
      outboundType: 'loadBalancer'
    }
    kubernetesVersion: '1.21.9'
  }
}
