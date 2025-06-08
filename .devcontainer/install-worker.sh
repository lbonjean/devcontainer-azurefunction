#!/bin/bash
set -e

mkdir -p /tmp/workerupdate
cd /tmp/workerupdate
sudo wget https://github.com/Azure/azure-functions-powershell-worker/archive/refs/tags/v4.0.4134.tar.gz
sudo tar zxf v4.0.4134.tar.gz
cd azure-functions-powershell-worker-4.0.4134
sudo pwsh ./build.ps1 -bootstrap -deploy -coretoolsdir /usr/lib/azure-functions-core-tools
