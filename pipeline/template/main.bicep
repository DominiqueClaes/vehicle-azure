targetScope = 'subscription'

@description('Location where the resources will be deployed')
param location string

@description('Name of the resource group')
param rgName string

resource rgVehicleResource 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}

module appServiceModule 'appService.bicep' = {
  name: 'appServiceModule'
  scope: rgVehicleResource
  params: {
    location: location
  }
}

module acrModule 'acr.bicep' = {
  name: 'acrModule'
  scope: rgVehicleResource
  dependsOn: [
    appServiceModule
  ]
  params: {
    location: location
    appServicePrincipalId: appServiceModule.outputs.principalId
  }
}