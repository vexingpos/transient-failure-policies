# Pre-req
I am assuming you have a management group called "testmg"

If not, create one, or find-and-replace all instances of "testmg" in this repo with the name of your MG.

# Let's deploy
````
New-AzManagementGroupDeployment -Name "policy" -ManagementGroupId "testmg" -Location "eastus2" -TemplateFile "assignment.bicep"
````

# Tear-down
````
Remove-AzPolicyAssignment -Scope "/providers/Microsoft.Management/managementGroups/testmg" -Name "Policy-Tagging" -ErrorAction SilentlyContinue ; Remove-AzPolicySetDefinition -ManagementGroupName "testmg" -Name "Initiative-Tagging" -Force -ErrorAction SilentlyContinue ; Remove-AzPolicyDefinition -ManagementGroupName "testmg" -Name "ProductNameTagOnResource_InheritFromRG_IfMissing" -Force -ErrorAction SilentlyContinue

````

