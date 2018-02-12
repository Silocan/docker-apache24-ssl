FROM httpd:latest

# COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# MOUNT VHOSTS FOLDER


# ENABLE REWRITE, PROXY, ...

# INSTALL LETS ENCRYPT
RUN add-apt-repository ppa:certbot/certbot && apt-get update && apt-get install -y python-certbot-apache

# GENERATE CERTIFICATS

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]