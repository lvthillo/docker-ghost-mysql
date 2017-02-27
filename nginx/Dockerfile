FROM nginx:1.11

MAINTAINER Lorenz Vanthillo <lorenz.vanthillo@outlook.com>

# Install wget and install/updates certificates
RUN apt-get update \  
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# Sites available
ADD config/default.conf /etc/nginx/conf.d/default.conf

# Add cert + key
COPY ssl/server.key /etc/ssl/private/
COPY ssl/server.cert /etc/ssl/private/

