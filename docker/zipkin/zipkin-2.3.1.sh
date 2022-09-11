

firewall-cmd --list-all
firewall-cmd --add-port=9411/tcp --permanent
firewall-cmd --reload

docker pull ibmcom/zipkin:2.3.1


docker run -d --restart always -p 9411:9411 --name zipkin-2.3.1 ibmcom/zipkin:2.3.1