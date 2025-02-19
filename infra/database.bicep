resource postgresServer 'Microsoft.DBforPostgreSQL/servers@2022-02-01' = {
  name: '${appName}-postgres'
  location: location
  properties: {
    administratorLogin: 'postgres'
    administratorLoginPassword: 'postgres'
    version: '13'
  }
  sku: {
    name: 'GP_Gen5_2'
    tier: 'GeneralPurpose'
    capacity: 2
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/servers/databases@2022-02-01' = {
  name: '${appName}-db'
  parent: postgresServer
  properties: {
    charset: 'UTF8'
    collation: 'en_US.UTF8'
  }
}

output dbConnectionString string = 'postgres://postgres:postgres@${postgresServer.name}.postgres.database.azure.com:5432/postgres'
