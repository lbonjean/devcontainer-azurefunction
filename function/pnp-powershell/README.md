# pnp powershell in azure function local / devcontainer

## app registration
create an entra app with at least following **app** permissions:  
- Graph: sites.read.all
- sharepoint: sites.read.all  
And give consent
## certificate
pnp powershell only works with a certificate, client secrets are not supported.  
- Generate a certificate
openssl req -x509 -newkey rsa:2048 -keyout private.key -out certificate.cer -days 730 -nodes -subj "/CN=MyPnPCert"  
openssl pkcs12 -export -out mycert.pfx -inkey private.key -in certificate.cer -passout pass:astrongpassword
- upload certificate to entra portal in app
## test
run the pnp powershell in a browser with ?url parameter
## important
Acces the results explicit. This works:
$web = Get-PnPWeb  
$body= $web | select Title, Url, Id, ServerRelativeUrl | ConvertTo-Json -Depth 10  

This does not work  
$body=get-pnpweb
