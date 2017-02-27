FROM ghost:0.11.5
RUN apt-get update -y && \
    apt-get install -y mysql-client
    #just for CI test
COPY ./wait-for-it.sh /usr/src/ghost/wait-for-it.sh
COPY ./config.js /var/lib/ghost/config.js

