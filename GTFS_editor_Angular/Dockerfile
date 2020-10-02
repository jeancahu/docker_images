FROM ubuntu:18.04

## GTFS Editor, Angular

## Docker image maintainer:
MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

RUN apt update 2>/dev/null
# RUN apt upgrade -y
RUN apt install -y lighttpd nodejs npm
RUN apt install -y curl
# RUN apt install -y zip unzip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'gtfs-editor:x:1000:1000::/home/gtfs_editor:/bin/bash' >> /etc/passwd
RUN mkdir -p /home/gtfs_editor && chown 1000:1000 /home/gtfs_editor

# ADD https://github.com/windsound3482/timetable/archive/master.zip /home/gtfs_editor/master.zip

# RUN chown 1000:1000 /home/gtfs_editor/master.zip

USER 1000
RUN touch $HOME/.bashrc && \
    curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

RUN . $HOME/.bashrc ; nvm install 12.0.0
# RUN . $HOME/.bashrc ; nvm use 12.0.0 ; npm install -g npm@latest
# RUN . $HOME/.bashrc ; node --version ; sleep 10

# RUN unzip $HOME/master.zip
# RUN ls $HOMe

USER 0

ENV LIGHTTPD_RUN_DIR   /var/www/html
ENV LIGHTTPD_LOG_DIR   /var/log/lighttpd

RUN mkdir -p $LIGHTTPD_RUN_DIR
RUN mkdir -p $LIGHTTPD_LOG_DIR

COPY index.html /var/www/html
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY timetable-master /home/gtfs_editor/timetable-master
COPY run_server.sh /bin/run_server.sh

RUN chown 1000:1000 /home/gtfs_editor/timetable-master

EXPOSE 4200

USER 1000

#FIXME usar work directory WORKDIR
RUN  cd $HOME/timetable-master && \
     {
       . $HOME/.bashrc ; nvm use 12.0.0 ; \
       npm install -g @angular/cli ; \
       npm install -g typescript ; \
     }

RUN cd $HOME/timetable-master && \
    {
      . $HOME/.bashrc ; \
      ng --version ; \
      npm install -g @angular-devkit/build-angular ; \
    }

#
# RUN sed 's/node --max_old_space_size=6144/node --max_old_space_size=512/' package.json -i

# CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
CMD ["/bin/bash"]
