name="redis"
version="7.0"
image=${name}:${version}
finalName=${name}-${version}-standalone
rootDir=data


firewall-cmd --list-all
firewall-cmd --add-port=6379/tcp --permanent
firewall-cmd --reload


mkdir -p /${rootDir}/${finalName}/conf
touch /${rootDir}/${finalName}/conf/redis.conf

docker pull ${image}

docker run -p 6379:6379 --name ${finalName} \
  -v ${rootDir}/${finalName}/data:/data \
  -v /${rootDir}/${finalName}/conf/redis.conf:/etc/redis/redis.conf \
  -d ${image} redis-server /etc/redis/redis.conf


cat ./redis-7.0-standalone.conf > /${rootDir}/${finalName}/conf/redis.conf/redis.conf