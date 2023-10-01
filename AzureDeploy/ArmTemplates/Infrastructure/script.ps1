Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Import-Module Az
$subscriptionId = "4f3f4052-a29a-4988-9f42-8c20c81ea86d"
Connect-AzAccount -Subscription $subscriptionId


# Create the resource group
$resourceGroupName = "Accruent-Assessment-RG"
$location = "westeurope"
New-AzResourceGroup -Name $resourceGroupName -Location $location
$deploymentName = "AccruentDeployment"
$templateFile = "up.json"
$parameterFile = "parameters.json"

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                             -Name $deploymentName `
                             -TemplateFile $templateFile `
                             -TemplateParameterFile $parameterFile



