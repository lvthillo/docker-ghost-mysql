FROM ghost:1.5.0
RUN apt-get update -y && \
    apt-get install -y mysql-client
    #just for CI test
ADD ./config.production.json config.production.json
COPY ./wait-for-it.sh /usr/local/bin/wait-for-it.sh
