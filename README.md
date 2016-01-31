# Docker Example with Nginx, 2 tomcats, mongodb with replicaset, postgresql and activemq

### Install Docker and docker-compose

* https://docs.docker.com/installation
* https://docs.docker.com/compose/install/

```bash

git clone https://github.com/jonyfs/docker-nginx-mongodb-postgresql-activemq-2-tomcats.git
cd docker-nginx-mongodb-postgresql-activemq-2-tomcats
docker-compose up -d  # If you skip -d, then the entire clusted will go down when
                      # mongosetup is done.
```

Now you have this example running.

```bash
$ docker ps

CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                                                                     NAMES
c5726308b0bc        nginx                "nginx -g 'daemon off"   5 minutes ago       Up 5 minutes        0.0.0.0:80->80/tcp, 443/tcp                                               nginx
1f538bc568f7        tomcat               "catalina.sh run"        5 minutes ago       Up 5 minutes        0.0.0.0:8080->8080/tcp                                                    tomcat_1
88abd897c8f7        tomcat               "catalina.sh run"        5 minutes ago       Up 5 minutes        8080/tcp, 0.0.0.0:8081->8081/tcp                                          tomcat_2
2e8946d674f3        mongo                "/scripts/query.sh"      30 minutes ago      Up 17 minutes       27017/tcp                                                                 mongoverify
ef7e7f851f55        mongo                "/scripts/setup.sh"      58 minutes ago      Up 17 minutes       27017/tcp                                                                 mongosetup
84e924702e87        webcenter/activemq   "/app/init.py start"     7 hours ago         Up 19 minutes       1883/tcp, 5672/tcp, 8161/tcp, 61613-61614/tcp, 0.0.0.0:61616->61616/tcp   activemq
905329a2f516        mongo                "/entrypoint.sh /usr/"   7 hours ago         Up 19 minutes       0.0.0.0:27017->27017/tcp, 0.0.0.0:28017->28017/tcp                        mongodb-primary
cded7ed6631e        mongo                "/entrypoint.sh /usr/"   7 hours ago         Up 19 minutes       0.0.0.0:27018->27017/tcp, 0.0.0.0:28018->28017/tcp                        mongodb-secondary-1
c35d3e043cca        mongo                "/entrypoint.sh /usr/"   7 hours ago         Up 19 minutes       0.0.0.0:27019->27017/tcp, 0.0.0.0:28019->28017/tcp                        mongodb-secondary-2
6a9cc064e197        postgres             "/docker-entrypoint.s"   7 hours ago         Up 19 minutes       0.0.0.0:5432->5432/tcp                                                    postgresql

```

### Servers

* NGINX - http://192.168.99.100
* Tomcat - http://192.168.99.100:8080
* MongoDB Replicaset:
	* http://192.168.99.100:28017
	* http://192.168.99.100:28018
	* http://192.168.99.100:28019



