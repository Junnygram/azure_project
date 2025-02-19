// Define input parameters (for flexibility)
param location string = 'eastus'
param appName string = 'eshop-app'

// Create a resource group (if not using an existing one)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${appName}-rg'
  location: location
}

// Deploy Networking
module networking './networking.bicep' = {
  name: 'networking'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    appName: appName
  }
}

// Deploy Database
module database './database.bicep' = {
  name: 'database'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    appName: appName
    vnetId: networking.outputs.vnetId
  }
}

// Deploy Backend (Golang API)
module backend './backend.bicep' = {
  name: 'backend'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    appName: appName
    dbConnectionString: database.outputs.dbConnectionString
  }
}

// Deploy Frontend (Next.js)
module frontend './frontend.bicep' = {
  name: 'frontend'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    appName: appName
    backendUrl: backend.outputs.backendUrl
  }
}

// Outputs
output frontendUrl string = frontend.outputs.frontendUrl
output backendUrl string = backend.outputs.backendUrl
output dbUrl string = database.outputs.dbConnectionString
