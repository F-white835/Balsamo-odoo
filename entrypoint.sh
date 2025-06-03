#!/bin/bash

echo "🛠️ Generando /etc/odoo/odoo.conf desde template..."

# Sustituye variables en el template y genera el archivo final
envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf

echo "✅ Config generado:"
cat /etc/odoo/odoo.conf

# Lanza Odoo con el archivo ya generado
exec "$@"
