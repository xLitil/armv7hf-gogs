#
# Install Gogs, cf. https://gogs.io/docs/installation
#

FROM docker.io/armv7/armhf-ubuntu:15.10

LABEL architecture="ARMv7"

ENV GOGS_BINARY_URL https://dl.gogs.io/gogs_v0.9.13_raspi2.zip

RUN apt-get update && apt-get --assume-yes install \
    git \
    sqlite3 \
    wget \
    unzip

RUN addgroup git && \
    useradd git --shell /bin/bash --gid git --home-dir /home/git --create-home

VOLUME /data

RUN cd / && \
    wget $GOGS_BINARY_URL --output-document gogs.zip && \
    unzip gogs.zip && \
    rm gogs.zip && \
    mkdir --parents /gogs/custom/conf

WORKDIR /gogs

COPY ./app.ini /gogs/custom/conf/
COPY ./start.sh /gogs/

RUN chown git:git --recursive /gogs && \
    chmod a+x /gogs/start.sh

EXPOSE 3000

CMD ["./start.sh"]
