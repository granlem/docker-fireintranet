# docker-fireintranet
## Description
Docker image for the samuels/fireintranet from github.com

### Environments
**DB_USER** - Database Username (Default: db) <br />
**DB_PASSWORD** - Password of the database user (Default: password)<br />
**DB_DB** - Database name (Default: db)<br />
**DB_HOST** - Hostname or IP to the mysql databse (Default: db) <br />
**THREADS** - Count of threads to use to provide web service (Default: 4) <br />
**GIT_URI** - Uri to the git repository of the fireintranet (Default: )

## Quick start
```
wget https://raw.githubusercontent.com/granlem/docker-fireintranet/master/image/examples/docker-compose.yml -O docker-compose.yml
docker-compose up
```
After you set up the database aswell you can access the intranet via http://HOSTNAME:4000 .
