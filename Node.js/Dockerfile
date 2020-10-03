FROM ubuntu:18.04

## GTFS Editor on Angular

## Docker image maintainer:

MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

RUN apt update 2>/dev/null && apt upgrade -y
RUN apt install -y lighttpd nodejs npm

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN npm install -g npm@latest

#    npm cache clean --force && \
#    npm set audit false && \
#    npm uninstall -g @angular-cli && \
#    npm uninstall -g angular/cli && \
#    npm cache clean --force && \
#    npm install -g @angular/cli@latest


ENV LIGHTTPD_RUN_DIR   /var/www/html
ENV LIGHTTPD_LOG_DIR   /var/log/lighttpd

RUN mkdir -p $LIGHTTPD_RUN_DIR
RUN mkdir -p $LIGHTTPD_LOG_DIR

COPY index.html /var/www/html
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

COPY timetable-master /opt/GTFS-editor
COPY run_server.sh /bin/run_server.sh

EXPOSE 80

# CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
CMD ["/bin/bash"]




# ENV VERSION=0.9.4


# ADD https://php-download.com/package/opentransport/editor /tmp/dependencies.html
# ADD https://github.com/sebastianknopf/opentransport-editor/archive/0.9.4.tar.gz /tmp/

# RUN echo 'gtfs-editor:x:1000:1000::/var/www:/bin/bash' >> /etc/passwd \
#    ; chown 1000:1000 /tmp/0.9.4.tar.gz /tmp/dependencies.html \
#    ; chown 1000:1000 -R /var/www/html/

# COPY src/ /var/www/html/

# EXPOSE 80

# USER 1000
# RUN cd /tmp && \
#     tar xzvf 0.9.4.tar.gz && cd opentransport-editor-0.9.4 && \
#     composer create-project --prefer-dist opentransport/editor



# # USER 0

# # CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
# 
