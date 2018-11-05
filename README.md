# docker-fireintranet
## Description
Docker image for the samuscherer/fireintranet from github.com

### Environments
**DB_USER** - Database Username (Default: db) <br />
**DB_PASSWORD** - Password of the database user (Default: password)<br />
**DB_DB** - Database name (Default: db)<br />
**DB_HOST** - Hostname or IP to the mysql databse (Default: db) <br />
**THREADS** - Count of threads to use to provide web service (Default: 4) <br />
**GIT_URI** - Uri to the git repository of the fireintranet (Default: )

## Quick start
```
wget https://raw.githubusercontent.com/granlem/docker-fireintranet/master/image/docker-compose.yml -O docker-compose.yml
docker-compose up
```
Afterwards you should be able to access the intranet via http://$HOSTNAME:4000 and the phpmyadmin via http://$HOSTNAME:8080 .<br />
### Defaults
**Default username:** john.doe<br />
**Default password:** password<br />
**Default mysql user:** root<br />
**Default mysql password:** rootpassword
