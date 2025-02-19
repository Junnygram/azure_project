resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: '${appName}-frontend'
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
}

output frontendUrl string = staticWebApp.defaultHostname
