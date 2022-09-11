name="nacos/nacos-server"
version="2.0.3"
image=${name}:${version}
finalName=${name}-${version}-sa
rootDir=data


firewall-cmd --list-all
firewall-cmd --add-port=8848/tcp --permanent
firewall-cmd --reload


mkdir -p /${rootDir}/${finalName}/conf
touch /${rootDir}/${finalName}/conf/redis.conf

docker pull ${image}

docker run -it \
-v /data/nacos/logs/:/home/nacos/logs/ \
-e PREFER_HOST_MODE=ip \
-e MODE=standalone \
-e SPRING_DATASOURCE_PLATFORM=mysql \
-e MYSQL_SERVICE_HOST=192.168.175.130 \
-e MYSQL_SERVICE_PORT=3306 \
-e MYSQL_SERVICE_DB_NAME=nacos \
-e MYSQL_SERVICE_USER=root \
-e MYSQL_SERVICE_PASSWORD=root \
-p 8848:8848 \
--name nacos-server-${version} \
--restart=always \
-d ${image}

