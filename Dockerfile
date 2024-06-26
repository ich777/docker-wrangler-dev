FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-wrangler-dev"

RUN apt-get update && \
	apt-get -y install --no-install-recommends wget nano git && \
    wget -qO- https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get -y install nodejs && \
    npm install -g wrangler && \
	rm -rf /var/lib/apt/lists/*

ENV DATA_DIR="/wrangler"
ENV START_WRANGLER="false"
ENV WRANGLER_START_CMD="wrangler dev"
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USER="wrangler"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chown -R $USER $DATA_DIR && \
	ulimit -n 2048

ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]