
docker pull seataio/seata-server:1.4.0

docker run -d --restart always  --name  seata-server -p 8091:8091 \
  -v f:/dockerdata/seata:/seata-server -e SEATA_IP=192.168.175.130 -e SEATA_PORT=8091 seataio/seata-server:1.4.0


  docker run --name seata-server \
  --restart always \
-p 8091:8091 \
-e SEATA_IP=192.168.175.130 \
-e SEATA_PORT=8091 \
-e SEATA_CONFIG_NAME=file:/root/seata-config/registry \
-v /data/seata/config:/root/seata-config  \
-d seataio/seata-server:1.4.0
