# Ghost and MySQL in Docker Compose

This project contains a Ghost container which contains a MySQL-client to connect with a persistent MySQL container.
Environment variables are used to create the database and make the connection.

```
$ git clone https://github.com/lvthillo/docker-ghost.git
$ cd docker-ghost-mysql 
$ docker-compose up --build -d
```

Visit http://localhost or http://localhost/admin

<img width="1438" alt="screen shot 2018-01-13 at 16 19 37" src="https://user-images.githubusercontent.com/14105387/34907357-a7979968-f87d-11e7-8423-c8734cbc6fdd.png">

Create a user

<img width="470" alt="screen shot 2018-01-13 at 16 22 13" src="https://user-images.githubusercontent.com/14105387/34907394-29372d12-f87e-11e7-858f-a023d2b67cb9.png">

Verify if the user exists in MySQL
```
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                  NAMES
55e5ccda1a7f        lvthillo/ghost:1.20.0   "wait-for-it.sh mysq…"   3 minutes ago       Up 3 minutes        0.0.0.0:80->2368/tcp   ghost
1e51addc77b6        mysql:5.7               "docker-entrypoint.s…"   9 minutes ago       Up 9 minutes        3306/tcp               mysql

$ docker exec -it mysql bash
root@1e51addc77b6:/# mysql -ublog-user -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 79
Server version: 5.7.20 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db                 |
+--------------------+
2 rows in set (0.00 sec)

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
| brute                  |
| client_trusted_domains |
| clients                |
| invites                |
| migrations             |
| migrations_lock        |
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
| webhooks               |
+------------------------+
24 rows in set (0.00 sec)

mysql> SELECT name from users;
+------------+
| name       |
+------------+
| Tim Cahill |
| Ghost      |
+------------+
2 rows in set (0.00 sec)


