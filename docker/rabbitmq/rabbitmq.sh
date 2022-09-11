

docker pull rabbitmq:3.9.21-management

firewall-cmd --list-all
firewall-cmd --add-port={5671,5672,4369,25672,15671,15672}/tcp --permanent
firewall-cmd --reload

docker run -d --restart always --name rabbitmq -p 5671:5671 -p 5672:5672 -p 4369:4369 -p 25672:25672 -p 15671:15671 -p 15672:15672 rabbitmq:3.9.21-management