#!/bin/bash

echo "=> Démarrage du service http"

service apache2 restart

tail -f /var/log/apache2/access.log
