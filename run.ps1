
# curl -useb https://raw.githubusercontent.com/HealthCatalyst/fabric.machinelearning.rserve/master/run.ps1 | iex;

docker stop fabric.machinelearning.rserve
docker rm fabric.machinelearning.rserve
docker pull healthcatalyst/fabric.machinelearning.r:latest
docker build -t healthcatalyst/fabric.machinelearning.rserve .

$USERNAME=$($env:USERNAME)
$AD_DOMAIN=$env:USERDNSDOMAIN
$AD_DOMAIN_SERVER=$($env:LOGONSERVER).Replace("\\","")
$TEST_SQL_SERVER="$env:computername.$env:userdnsdomain"

$password = Read-Host -assecurestring "Please enter your password for ${USERNAME}@${AD_DOMAIN}"
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

Write-Host "user: $USERNAME"
Write-Host "domain: $AD_DOMAIN"
Write-Host "domain server: $AD_DOMAIN_SERVER"


docker run -p 6311:6311 --rm -e DEBUG=1 -e SERVICE_USER=$USERNAME -e SERVICE_PASSWORD=$password -e AD_DOMAIN=$AD_DOMAIN -e AD_DOMAIN_SERVER=$AD_DOMAIN_SERVER -e TEST_SQL_SERVER=$TEST_SQL_SERVER --name fabric.machinelearning.rserve -t healthcatalyst/fabric.machinelearning.rserve