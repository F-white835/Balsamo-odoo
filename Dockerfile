FROM odoo:16

# (Opcional) copiar tus módulos personalizados si los tienes
COPY ./addons /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons

# CMD debe ir en una sola línea como JSON array
CMD ["odoo", "--db_host=${ODOO_DB_HOST}", "--db_port=${ODOO_DB_PORT}", "--db_user=${ODOO_DB_USER}", "--db_password=${ODOO_DB_PASSWORD}", "--db_name=${ODOO_DB_NAME}", "--admin_passwd=${ODOO_ADMIN_PASSWD}", "--addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons"]
