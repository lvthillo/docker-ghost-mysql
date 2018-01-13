# Nginx, Ghost and MySQL in Docker Compose

This project contains a Ghost container which contains a MySQL-client to connect with a persistent MySQL container.
Nginx is running above our Ghost container and generates a default selfsigned cert to provide SSL.

```
$ git clone https://github.com/lvthillo/docker-ghost.git
$ cd docker-ghost
$ echo "SERVERNAME=example.com" > .env  
$ docker-compose up --build -d
```

Visit http://example.com (default SERVERNAME=localhost)


<img width="1438" alt="screen shot 2018-01-13 at 15 36 40" src="https://user-images.githubusercontent.com/14105387/34906994-e935a8ca-f877-11e7-8731-e1e60f8cb150.png">
