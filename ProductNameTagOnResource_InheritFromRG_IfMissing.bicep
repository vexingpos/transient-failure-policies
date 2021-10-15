targetScope = 'managementGroup'

resource ProductNameTagOnResource_InheritFromRG_IfMissing 'Microsoft.Authorization/policyDefinitions@2020-09-01' = {
  name: 'ProductNameTagOnResource_InheritFromRG_IfMissing'
  properties: {
    displayName: 'ProductNameTagOnResource_InheritFromRG_IfMissing'
    description: 'Resources will inherit the ProductName tag from the resource group if no value is provided'
    policyType: 'Custom'
    mode: 'Indexed'
    metadata: {
      category: 'Tags'
    }
    parameters: {}
    policyRule: {
      if: {
        allOf: [
          {
            anyOf: [
              {
                field: 'tags[\'ProductName\']'
                exists: false
              }
              {
                field: 'tags[\'ProductName\']'
                equals: '' 
              }
            ]
          }
          {
            allOf: [
              {
                value: '[resourceGroup().tags[\'ProductName\']]'
                exists: true
              }
              {
                value: '[resourceGroup().tags[\'ProductName\']]'
                notEquals: ''
              }
            ]
          }
        ]
      }
      then: {
        effect: 'modify'
        details: {
          roleDefinitionIds: [
            '/providers/microsoft.authorization/roleDefinitions/4a9ae827-6dc8-4573-8ac7-8239d42aa03f'
          ]
          operations: [
            {
              operation: 'addOrReplace'
              field: 'tags[\'ProductName\']'
              value: '[resourceGroup().tags[\'ProductName\']]'
            }
          ]
        }
      }
    }
  }
}
