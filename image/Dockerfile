FROM debian:latest
LABEL maintainer="kontakt@maximeveit.de"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -yq --no-install-recommends python3 \
    python3-pip python3-setuptools git libmariadbclient-dev \
    python3-dev build-essential mysql-client
RUN pip3 install --upgrade pip wheel
RUN pip3 install gunicorn
RUN pip3 install flask
RUN pip3 install flask-mysqldb
RUN pip3 install passlib

# Cleanup
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set entrypoint
ADD scripts/* /srv/
ENTRYPOINT ["/srv/startup.sh"]


