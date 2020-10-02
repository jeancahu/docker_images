FROM ubuntu:18.04
## GTFS Editor

## Docker image maintainer:
MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

# ENV VERSION=0.9.4

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y tzdata << "$( printf 'America\nCosta_Rica' )" \
    && apt-get install -y composer \
    && apt-get install -y apache2 \
    && apt-get install -y php-{intl,mbstring,dom,simplexml} \
    && apt-get install -y libapache2-mod-php \
    && apt-get install -y zip unzip \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

ADD https://php-download.com/package/opentransport/editor /tmp/dependencies.html
ADD https://github.com/sebastianknopf/opentransport-editor/archive/0.9.4.tar.gz /tmp/

RUN echo 'gtfs-editor:x:1000:1000::/var/www:/bin/bash' >> /etc/passwd \
   ; chown 1000:1000 /tmp/0.9.4.tar.gz /tmp/dependencies.html \
   ; chown 1000:1000 -R /var/www/html/

# COPY src/ /var/www/html/

EXPOSE 80

USER 1000
RUN cd /tmp && \
    tar xzvf 0.9.4.tar.gz && cd opentransport-editor-0.9.4 && \
    composer create-project --prefer-dist opentransport/editor



# USER 0

# CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
CMD ["/bin/bash"]
