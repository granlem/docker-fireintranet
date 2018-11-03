#!/bin/bash

# Clone fireintranet
cd /srv
git clone ${GIT_URI:-https://github.com/samuscherer/fireintranet fireintranet} || true

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

# Start fireintranet
gunicorn -w ${THREADS:-4} -b 0.0.0.0:${PORT:-4000} ${STARTFILE:-fireintranet}:app
