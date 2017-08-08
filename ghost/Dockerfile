FROM ghost:1.5.0
RUN apt-get update -y && \
    apt-get install -y mysql-client
    #just for CI test
COPY ./wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY ./config.js /var/lib/ghost/content/config.js
