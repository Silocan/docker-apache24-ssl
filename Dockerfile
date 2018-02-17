FROM debian:stretch
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt update

# ENABLE REWRITE, PROXY, ...
# RUN a2enmod rewrite;

# INSTALL LETS ENCRYPT
RUN	apt-get install -q -y curl apache2 && \
    apt-get install -q -y python-certbot-apache && \
	apt-get clean
# GENERATE CERTIFICATS

RUN a2enmod proxy rewrite && service apache2 restart

COPY ./conf/apache2.conf /etc/apache2/apache2.conf

# MOUNT VHOSTS FOLDER
VOLUME /etc/apache2/sites-enabled

# MOUNT WWW FOLDER
VOLUME /var/www/html

CMD ["tail","-f", "/var/log/apache2/access.log"]