FROM ubuntu:18.04
# FROM alpine:3.7 # TODO

MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*
# RUN apk add --no-cache apache2 # TODO

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

COPY index.html /var/www/html

# Usage: USER [UID]
# USER 1001

# Usage: VOLUME ["/dir_1", "/dir_2" ..]
# VOLUME ["/my_files"]

EXPOSE 80

# Usage: ENTRYPOINT application "argument", "argument", ..
# Remember: arguments are optional. They can be provided by CMD
#           or during the creation of a container.
#ENTRYPOINT echo# Usage example with CMD:
# Arguments set with CMD can be overridden during *run*
#CMD "Hello docker!"
#ENTRYPOINT echo

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
