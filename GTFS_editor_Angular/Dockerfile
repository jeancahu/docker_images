FROM ubuntu:18.04

# GTFS Editor Angular
## Docker image maintainer:
MAINTAINER Jeancarlo Hidalgo <jeancahu@gmail.com>

# LABEL version=0.1
# LABEL nodejs=12.0.0

#ENV versiones=

RUN apt update 2>/dev/null
RUN apt install -y lighttpd nodejs npm
RUN apt install -y curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

## Adduser gtfs-editor
RUN echo 'gtfs-editor:x:1000:1000::/home/gtfs_editor:/bin/bash' >> /etc/passwd
RUN mkdir -p /home/gtfs_editor && chown 1000:1000 /home/gtfs_editor

# ADD https://github.com/windsound3482/timetable/archive/master.zip /home/gtfs_editor/master.zip
# RUN chown 1000:1000 /home/gtfs_editor/master.zip

USER 1000
RUN touch $HOME/.bashrc && \
    curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# FIXME quitar::
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

RUN  ln -s /home/gtfs_editor/.nvm/versions/node/v12.0.0/lib/node_modules/ /home/gtfs_editor/timetable-master/
RUN  cd $HOME/timetable-master && { . $HOME/.bashrc; nvm use 12.0.0; npm install npm@latest; }
RUN  cd $HOME/timetable-master && { . $HOME/.bashrc; nvm use 12.0.0; /home/gtfs_editor/.nvm/versions/node/v12.0.0/bin/npm install @angular/cli; }
RUN  cd $HOME/timetable-master && { . $HOME/.bashrc; nvm use 12.0.0; /home/gtfs_editor/.nvm/versions/node/v12.0.0/bin/npm install typescript; }
RUN  cd $HOME/timetable-master && { . $HOME/.bashrc; nvm use 12.0.0; /home/gtfs_editor/.nvm/versions/node/v12.0.0/bin/npm install @angular-devkit/build-angular; }
RUN  cd $HOME/timetable-master && { . $HOME/.bashrc; nvm use 12.0.0; node_modules/\@angular/cli/bin/ng --version ; }

# RUN sed 's/node --max_old_space_size=6144/node --max_old_space_size=512/' package.json -i

# temporal FIXME
USER 0

WORKDIR /home/gtfs_editor/timetable-master
# CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
CMD ["source ~/.bashrc"]
CMD ["/bin/bash"]
