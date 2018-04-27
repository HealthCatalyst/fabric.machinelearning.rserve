docker stop fabric.machinelearning.rserve
docker rm fabric.machinelearning.rserve
docker build -t healthcatalyst/fabric.machinelearning.rserve . 

docker run -d -p 6311:6311 --rm --name fabric.machinelearning.rserve -t healthcatalyst/fabric.machinelearning.rserve