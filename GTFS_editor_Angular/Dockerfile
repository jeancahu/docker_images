FROM node:14-alpine3.12

# GTFS Editor Angular
## Docker image maintainer:
MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

# LABEL version=0.1
# LABEL nodejs=12.0.0

#ENV versiones=

## Install lighttpd
RUN apk add --no-cache lighttpd

## Adduser gtfs-editor
RUN echo 'gtfs-editor:x:1000:1000::/home/gtfs_editor:/bin/sh' >> /etc/passwd
RUN mkdir -p /home/gtfs_editor && chown 1000:1000 /home/gtfs_editor

# USER 1000

# USER 0

ENV LIGHTTPD_RUN_DIR   /var/www/html
ENV LIGHTTPD_LOG_DIR   /var/log/lighttpd

RUN mkdir -p $LIGHTTPD_RUN_DIR
RUN mkdir -p $LIGHTTPD_LOG_DIR

# COPY index.html /var/www/html
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

WORKDIR /home/gtfs_editor/timetable-master
COPY timetable-master /home/gtfs_editor/timetable-master
#RUN chown 1000:1000 /home/gtfs_editor/timetable-master

## Instalart todas las dependencias (de manera local):
RUN npm install --save-dev package.json

EXPOSE 4200

# USER 1000

# USER 0

CMD ["/bin/sh"]
