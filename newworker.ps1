$version = "7.4.7"
$versionmajor = "7.4"
# Download en uitpakken
wget "https://github.com/PowerShell/PowerShell/releases/download/v$version/powershell-$version-linux-x64.tar.gz"
$targetPath = "/usr/lib/azure-functions-core-tools/workers/powershell/$versionmajor/"
#sudo mkdir -p $targetPath
#sudo cp -rfv /usr/lib/azure-functions-core-tools/workers/powershell/7/ $targetPath
sudo tar --overwrite -xzf "powershell-$version-linux-x64.tar.gz" -C $targetPath
rm "powershell-$version-linux-x64.tar.gz"
# Aanpassen van worker.config.jsonsud
$workerConfigPath = "/usr/lib/azure-functions-core-tools/workers/powershell/worker.config.json"
$json = Get-Content $workerConfigPath -Raw | ConvertFrom-Json

if ($json.description.supportedRuntimeVersions -notcontains $versionmajor) {
    $json.description.supportedRuntimeVersions += $versionmajor
    $tempPath = "/tmp/worker.config.json.updated"
    $json | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $tempPath
    sudo mv $tempPath $workerConfigPath
    Write-Host "Toegevoegd aan supportedRuntimeVersions: $versionmajor"
}
else {
    Write-Host "$versionmajor staat al in supportedRuntimeVersions"
}
