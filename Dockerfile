FROM httpd:2.4.29-alpine

# COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# COPY VHOSTS

# ENABLE REWRITE, PROXY, ...

# INSTALL LETS ENCRYPT

# GENERATE CERTIFICATS

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]