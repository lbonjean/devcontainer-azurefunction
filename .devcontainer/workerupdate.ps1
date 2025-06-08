mkdir /tmp/workerupdate
cd /tmp/workerupdate
wget https://github.com/Azure/azure-functions-powershell-worker/archive/refs/tags/v4.0.4134.tar.gz
tar zxf v4.0.4134.tar.gz
cd azure-functions-powershell-worker-4.0.4134
./build.ps1 -bootstrap -deploy -coretoolsdir /usr/lib/azure-functions-core-tools

