#!/bin/bash

# Clone fireintranet
cd /srv
git clone ${GIT_URI:-https://github.com/samuscherer/fireintranet} fireintranet || true

# Pull fireintranet
cd /srv/fireintranet
git pull

# Initiate config
if [ ! -f config.json ]; then
echo "{" > config.json
echo "    \"user\": \"${DB_USER:-root}\"," >> config.json
echo "    \"password\": \"${DB_PASSWORD:-password}\"," >> config.json
echo "    \"database\": \"${DB_DB:-db}\"," >> config.json
echo "    \"host\": \"${DB_HOST:-db}\"" >> config.json
echo "}" >> config.json
fi

# Initiate database
if [ -z $KEEP_DB_UNTOUCHED ]; then
  for i in `seq 1 15`; do
    sleep 1
    echo "Trying($i/15) to connect to mysql database an initiate"
    mysql -h "${DB_HOST:-db}" -u "${DB_USER:-root}" -p"${DB_PASSWORD:-password}" -e "" || continue
    db_initialized = $(mysql -h "${DB_HOST:-db}" -u "${DB_USER:-root}" -p"${DB_PASSWORD:-password}" "${DB_DB:-db}" -s -N -e "SELECT 1 FROM members LIMIT 1;")
    if [ -z $KEEP_DB_UNTOUCHED ] && [ -z $db_initialized ]; then
      mysql -u "${DB_USER:-root}" -p"${DB_PASSWORD:-password}" -h "${DB_HOST:-db}" "${DB_DB:-db}" < /srv/base_db.sql
    fi
    break
  done
fi

# Start fireintranet
gunicorn -w ${THREADS:-4} -b 0.0.0.0:${PORT:-4000} ${STARTFILE:-fireintranet}:app
