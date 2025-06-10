# Basic azure functions devcontainer with powershell worker 7.4.7.
This container installs azure functions core tools and upgrades the powershell worker to use 7.4.7. The same version used in the current Function app on Azure.  
Workers are found here: https://github.com/Azure/azure-functions-powershell-worker, at this point version 4.0.4206 is used.
The funnctionapp is optimized for the Flex consumption plan.

## Instructions
- Make sure "FUNCTIONS_WORKER_RUNTIME_VERSION": "7.4" is specified in local.settigs.json
- There is an example function psinfo that shows a lot of info. This also dumps environment variables at runtime. Make sure that it is protected on azure, by not usig anonymous.  
This function shows the used version.


## Structure

. root  
.\function: put everything that needs to be published to the function app later on here  
"azureFunctions.deploySubpath": "function" must be set in settings.json

## Authentication
### pnp.powershell
1. register an app with Register-PnPEntraIDAppForInteractiveLogin