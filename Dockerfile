FROM odoo:16

# Comando para ejecutar Odoo, usando variables de entorno de Render
CMD ["odoo", 
     "--db_host=${ODOO_DB_HOST}", 
     "--db_port=${ODOO_DB_PORT}", 
     "--db_user=${ODOO_DB_USER}", 
     "--db_password=${ODOO_DB_PASSWORD}", 
     "--db_name=${ODOO_DB_NAME}", 
     "--admin_passwd=${ODOO_ADMIN_PASSWD}", 
     "--addons-path=/usr/lib/python3/dist-packages/odoo/addons"]

