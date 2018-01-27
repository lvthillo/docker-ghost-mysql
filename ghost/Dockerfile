FROM ghost:1.20.0
RUN apt-get update -y && \
    apt-get install -y mysql-client
COPY ./wait-for-it.sh /usr/local/bin/wait-for-it.sh
