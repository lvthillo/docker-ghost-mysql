#!/bin/bash

set -e

host="$1"
shift
cmd="$@"

until mysql -h"$host" -p"3306" -u"blog-user" -p"supersecret" -D"db" ; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
exec "$@"
#exec ../../../entrypoint.sh npm start
