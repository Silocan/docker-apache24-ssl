FROM httpd:latest

# COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# MOUNT VHOSTS FOLDER
VOLUME /etc/apache2/sites-enabled

# MOUNT WWW FOLDER
VOLUME /var/www/html

# ENABLE REWRITE, PROXY, ...
RUN a2enmod rewrite;

# INSTALL LETS ENCRYPT
RUN \
	apt install sudo && echo 'deb http://ftp.debian.org/debian jessie-backports main' | sudo tee /etc/apt/sources.list.d/backports.list \
	 && sudo apt-get update \
	 && sudo apt-get install -y python-certbot-apache

# GENERATE CERTIFICATS

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]