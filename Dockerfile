FROM docker.io/armv7/armhf-ubuntu:15.10

#
# Install Gogs, cf. https://gogs.io/docs/installation
#


RUN apt-get update && apt-get -y install \
    git \
    sqlite3 \
    wget \
    unzip

RUN addgroup git && \
    adduser git --shell /bin/bash --ingroup git

RUN  cd / && \
     wget https://dl.gogs.io/gogs_v0.9.13_raspi2.zip && \
     unzip gogs_v0.9.13_raspi2.zip && \
     mkdir -p /gogs/custom/conf

WORKDIR /gogs

COPY ./start.sh /gogs/
COPY ./app.ini /gogs/custom/conf/

RUN chmod a+x start.sh

EXPOSE 3000

CMD ["./start.sh"]
