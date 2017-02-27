# Ghost & MySQL with Docker Compose

Ghost is an open source publishing platform which is beautifully designed, easy to use, and free for everyone.
In this project we will connect a ghost container with a persistent MySQL container.

Prerequisition: Docker version 1.11.x <


```
cd nginx/ssl/
openssl req  -nodes -new -x509  -keyout server.key -out server.cert
cd ../../
docker-compose up --build
```
