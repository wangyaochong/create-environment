

firewall-cmd --list-all
firewall-cmd --add-port=8858/tcp --permanent
firewall-cmd --reload


docker pull bladex/sentinel-dashboard:1.7.1
docker run --name sentinel -d --restart always -p 8858:8858  bladex/sentinel-dashboard:1.7.1