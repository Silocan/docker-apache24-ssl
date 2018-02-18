FROM debian:stretch-slim

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt update && \
	apt-get install -q -y curl apache2 && \
    apt-get install -q -y python-certbot-apache && \
	apt-get clean

RUN a2enmod proxy rewrite


# MOUNT VHOSTS FOLDER
VOLUME /etc/apache2/sites-enabled-mounted

ENV VERSION 0.1.5

COPY ./conf/apache2.conf /etc/apache2/apache2.conf
COPY run.sh /
# ENTRYPOINT
CMD /bin/bash /run.sh