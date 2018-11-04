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
wget Path_to_docker_compose -O docker-compose
...
```
After you sst up the databse aswell you can access the intranet via http://HOSTNAME:4000 .
