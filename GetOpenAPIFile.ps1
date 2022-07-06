
$subscriptionId = 'e84e35c4-622e-48c6-bc99-6cc125dcc30f'
$resourceGroupName = 'LogicAppTest'
$workflowName = 'Greet'

$uri = "https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Logic/workflows/${workflowName}/listSwagger?api-version=2016-06-01"
$accessToken = Get-AzAccessToken

$response = Invoke-WebRequest -Uri $uri -Method Post -Headers @{Authorization = "$($accessToken.Type) $($accessToken.Token)" }

$response.Content | Out-File './swagger.json'
