docker stop fabric.machinelearning.rserve
docker rm fabric.machinelearning.rserve
docker pull healthcatalyst/fabric.machinelearning.r:latest
docker build -t healthcatalyst/fabric.machinelearning.rserve .
