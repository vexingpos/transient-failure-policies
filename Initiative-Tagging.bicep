targetScope = 'managementGroup'

var mgId = tenantResourceId('Microsoft.Management/managementGroups', 'testmg')

module ProductNameTagOnResource_InheritFromRG_IfMissing 'ProductNameTagOnResource_InheritFromRG_IfMissing.bicep' = {
  name: 'ProductNameTagOnResource_InheritFromRG_IfMissing'
}

resource Tagging 'Microsoft.Authorization/policySetDefinitions@2020-09-01' = {
  name: 'Initiative-Tagging'
  properties: {
    policyType: 'Custom'
    displayName: 'Initiative-Tagging'
    description: 'Initiative-Tagging'
    metadata: {
      category: 'Tags'
    }
    parameters: {}
    policyDefinitions: [
      {
        policyDefinitionId: extensionResourceId(mgId, 'Microsoft.Authorization/policyDefinitions', ProductNameTagOnResource_InheritFromRG_IfMissing.name)
      }
    ]
  }
}

