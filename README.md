# Ghost & MySQL with Docker Compose

Ghost is an open source publishing platform which is beautifully designed, easy to use, and free for everyone.
In this project we will connect a ghost container with a persistent MySQL container.

Prerequisition: Docker version 1.11.x <


#### Start with Docker Compose
Check the docker-compose file for more documentation
```
$ docker-compose up --build -d
```

#### Check the running containers
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
032189218b2e        my-ghost:1.0.0      "/entrypoint.sh npm s"   13 seconds ago      Up 4 seconds        0.0.0.0:2368->2368/tcp    ghost
95ede415d92e        mysql:5.7.12        "docker-entrypoint.sh"   13 seconds ago      Up 12 seconds       0.0.0.0:32768->3306/tcp   mysql
```

#### Explanation wait-for-it.sh
It's possible that you see the following error log in the ghost container.
```
ERROR 2003 (HY000): Can't connect to MySQL server on 'mysql' (111)
MySQL is unavailable - sleeping
```
This means that the mysql service inside the mysql container isn't ready.
The wait-for-it.sh script is checking the mysql service and when it's up it will start the ghost service.
You can check it in the logs of your ghost container
```
ERROR 2003 (HY000): Can't connect to MySQL server on 'mysql' (111)
MySQL is unavailable - sleeping
MySQL is up - executing command
npm info it worked if it ends with ok
npm info using npm@2.15.9
npm info using node@v4.6.0
npm info prestart ghost@0.11.0

> ghost@0.11.0 start /usr/src/ghost
> node index

npm info start ghost@0.11.0
WARNING: Ghost is attempting to use a direct method to send email.
It is recommended that you explicitly configure an email service.
Help and documentation can be found at http://support.ghost.org/mail.

Migrations: Creating tables...
...
Migrations: Creating owner
Ghost is running in development...
Listening on 0.0.0.0:2368
Url configured as: http://localhost:2368
Ctrl+C to shut down
```

You're able to create your users, blogs, etc on http://IP:2368/ghost/setup

#### Check the mysql container
```
$ docker exec -it 95ede415d92e bash
root@95ede415d92e:/# mysql -ublog-user -psupersecret -hmysql
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 5.7.12 MySQL Community Server (GPL)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------+
| Tables_in_db           |
+------------------------+
| accesstokens           |
| app_fields             |
| app_settings           |
| apps                   |
| client_trusted_domains |
| clients                |
| permissions            |
| permissions_apps       |
| permissions_roles      |
| permissions_users      |
| posts                  |
| posts_tags             |
| refreshtokens          |
| roles                  |
| roles_users            |
| settings               |
| subscribers            |
| tags                   |
| users                  |
+------------------------+
19 rows in set (0.00 sec)
```
