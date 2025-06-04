FROM odoo:16

# Copiar tus módulos personalizados a la ruta donde Odoo los puede encontrar
COPY ./custom_addons /mnt/custom-addons

# Asegurar que el usuario odoo tiene permisos
RUN chown -R odoo:odoo /mnt/custom-addons

# Comando para ejecutar Odoo con tu ruta de addons
CMD ["odoo", "--db_host=${ODOO_DB_HOST}", "--db_port=${ODOO_DB_PORT}", "--db_user=${ODOO_DB_USER}", "--db_password=${ODOO_DB_PASSWORD}", "--db_name=${ODOO_DB_NAME}", "--admin_passwd=${ODOO_ADMIN_PASSWD}", "--addons-path=/mnt/custom-addons,/usr/lib/python3/dist-packages/odoo/addons"]
