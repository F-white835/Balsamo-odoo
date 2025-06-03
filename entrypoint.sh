#!/bin/bash
# Reemplazar variables en el template y crear odoo.conf
envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf

# Ejecutar el comando pasado al entrypoint (odoo)
exec "$@"
