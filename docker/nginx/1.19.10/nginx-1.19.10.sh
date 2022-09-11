
firewall-cmd --list-all
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload

docker pull nginx:1.19.10
docker run -p 80:80 -p 443:443 --name nginx --restart=always -d nginx:1.19.10 #先运行一次

docker cp nginx:/etc/nginx/nginx.conf /data/nginx/
docker cp nginx:/etc/nginx/conf.d /data/nginx/conf/
docker cp nginx:/usr/share/nginx/html/ /data/nginx/html/
docker cp nginx:/var/log/nginx/ /data/nginx/logs/

#
#docker cp nginx:/etc/nginx/nginx.conf /data/nginx/
#docker cp nginx:/etc/nginx/conf.d /data/nginx/
#docker cp nginx:/usr/share/nginx/html/ /data/nginx/

docker run -p 80:80 --name nginx --restart always \
-v /data/nginx/nginx.conf:/etc/nginx/nginx.conf \
-v /data/nginx/html:/usr/share/nginx/html \
-v /data/nginx/logs:/var/log/nginx  \
-v /data/nginx/conf.d:/etc/nginx/conf.d \
-d nginx:1.19.10
