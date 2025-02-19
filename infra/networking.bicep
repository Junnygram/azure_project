resource vnet 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: '${appName}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = {
  name: 'backend-subnet'
  parent: vnet
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}

resource firewall 'Microsoft.Network/azureFirewalls@2022-01-01' = {
  name: '${appName}-firewall'
  location: location
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
  }
}

output vnetId string = vnet.id
output subnetId string = subnet.id
output firewallId string = firewall.id
