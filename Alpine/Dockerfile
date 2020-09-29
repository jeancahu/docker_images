FROM alpine:3.7

MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

RUN apk add --no-cache lighttpd

ENV LIGHTTPD_RUN_DIR   /var/www/html
ENV LIGHTTPD_LOG_DIR   /var/log/lighttpd

RUN mkdir -p $LIGHTTPD_RUN_DIR
RUN mkdir -p $LIGHTTPD_LOG_DIR

COPY index.html /var/www/html
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

# COPY run_server.sh /bin/run_server.sh

EXPOSE 80

CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
