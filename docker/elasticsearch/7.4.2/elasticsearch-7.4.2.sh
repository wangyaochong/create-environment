docker pull elasticsearch:7.4.2

docker pull kibana:7.4.2


mkdir -p /data/elasticsearch/config
mkdir -p /data/elasticsearch/data
chmod -R 777 /data/elasticsearch/


echo "http.host: 0.0.0.0" >> /data/elasticsearch/config/elasticsearch.yml

docker run --name elasticsearch -p 9200:9200 -p 9300:9300 \
--restart always \
-e "discovery.type=single-node" \
-e ES_JAVA_OPTS="-Xms256m -Xmx256m" \
-v /data/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v /data/elasticsearch/data:/usr/share/elasticsearch/data \
-v /data/elasticsearch/plugins:/usr/share/elasticsearch/plugins \
-d elasticsearch:7.4.2


docker run --name kibana -e ELASTICSEARCH_HOSTS=http://192.168.175.130:9200 -p 5601:5601 -d kibana:7.4.2