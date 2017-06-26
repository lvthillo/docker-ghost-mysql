FROM nginx:1.13

MAINTAINER Lorenz Vanthillo <lorenz.vanthillo@outlook.com>

# Install wget and install/updates certificates
RUN apt-get update \  
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
    openssl \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# Add cert + key
ADD config/openssl.cnf /etc/ssl/openssl.cnf
RUN openssl genrsa -out /etc/ssl/private/server.key 1024
RUN openssl req -config /etc/ssl/openssl.cnf -new -key /etc/ssl/private/server.key -out /etc/ssl/server.csr
RUN openssl x509 -req -days 1024 -in /etc/ssl/server.csr -signkey /etc/ssl/private/server.key -out /etc/ssl/private/server.crt
