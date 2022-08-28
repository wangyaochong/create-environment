name="mysql"
version="5.7"
image=${name}:${version}
finalName=${name}-${version}
rootDir=data

docker pull ${image}
docker run -p 3306:3306 \
  --name ${finalName} \
  -v /${rootDir}/${finalName}/data:/var/lib/mysql \
  -v /${rootDir}/${finalName}/log:/var/log/mysql \
  -v /${rootDir}/${finalName}/conf:/etc/mysql \
  -e MYSQL_ROOT_PASSWORD=root  \
  -d ${image}
# 需要注意，远程连接的url需要完整，需要添加参数
# jdbc:mysql://192.168.175.130:3306?useSSL=false&allowMultiQueries=true&serverTimezone=Asia/Shanghai


# 添加ipv4的ip_forward参数
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
systemctl restart network

# 为mysql开启防火墙
firewall-cmd --list-all
firewall-cmd --add-port=3306/tcp --permanent
firewall-cmd --reload


# 创建初始配置文件
echo "[client]
default-character-set=utf8
[mysql]
default-character-set=utf8
[mysqld]
init_connect='SET collation_connection = utf8_unicode_ci'
init_connect='SET NAMES utf8'
character-set-server=utf8
collation-server=utf8_unicode_ci
skip-character-set-client-handshake
skip-name-resolve" > /${rootDir}/${finalName}/conf/my.cnf

docker restart ${finalName}
