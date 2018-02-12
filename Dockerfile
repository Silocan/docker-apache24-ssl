FROM httpd:2.4.29-alpine

# COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# MOUNT VHOSTS FOLDER

# ENABLE REWRITE, PROXY, ...

# INSTALL LETS ENCRYPT
RUN sudo add-apt-repository ppa:certbot/certbot && sudo apt-get update && sudo apt-get install python-certbot-apache

# GENERATE CERTIFICATS

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]