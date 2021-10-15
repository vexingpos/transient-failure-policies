targetScope = 'managementGroup'

var mgId = tenantResourceId('Microsoft.Management/managementGroups', 'testmg')

// Deploy the tagging initiative
module taggingInitiative 'Initiative-Tagging.bicep' = {
  name: 'Initiative-Tagging'
}

// Assign the tagging initiative
resource taggingInitiativeAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: 'Policy-Tagging'
  properties: {
    displayName: 'Initiative-Tagging'
    description: 'Initiative-Tagging'
    enforcementMode: 'Default'
    policyDefinitionId: extensionResourceId(mgId, 'Microsoft.Authorization/policySetDefinitions', taggingInitiative.name)
  }
  location: 'eastus2'
  identity: {
    type: 'SystemAssigned'
  }
}
