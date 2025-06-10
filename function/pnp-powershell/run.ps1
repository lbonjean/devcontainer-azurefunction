using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)
$url = $Request.Query.url

# Write to the Azure Functions log stream.
Write-Host "url: $($url)"

# Interact with query parameters or the body of the request.
$certPassword = ConvertTo-SecureString $env:app_cert_pass -AsPlainText -Force  
Connect-PnPOnline  -clientid $env:app_clientid -url $url -CertificatePath $env:app_cert_path -CertificatePassword $certPassword -Tenant $env:app_tenantid
$web = Get-PnPWeb
$body= $web | select Title, Url, Id, ServerRelativeUrl | ConvertTo-Json -Depth 10

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
