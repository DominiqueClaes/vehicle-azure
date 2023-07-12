param location string

param appServicePrincipalId string

resource acrVehicleResource 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: 'vehicleacr'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid('vehicleacr', appServicePrincipalId, 'AcrPullSystemAssigned')
  scope: acrVehicleResource
  properties: {
    principalId: appServicePrincipalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d')
  }
}