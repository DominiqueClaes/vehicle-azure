param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'aspVehicle'
  location: location
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku:  {
  	name: 'B1'
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: 'asVehicle'
  location: location
  kind: 'app,linux,container'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOCKER|vehicleacr.azurecr.io/vehicles'
      acrUseManagedIdentityCreds: true
    }
  }
}

output principalId string = appService.identity.principalId