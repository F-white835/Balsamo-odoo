# Usa la imagen oficial de Odoo 16
FROM odoo:16

# Cambiar a root para instalar paquetes del sistema
USER root

# Instalar dependencias para python-ldap y limpiar cache de apt
RUN apt-get update && apt-get install -y \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Volver a usuario odoo para correr Odoo
USER odoo

# Copiar addons personalizados a la ruta extra de addons
COPY ./custom_addons /mnt/extra-addons

# (Opcional) Instalar dependencias de python si usas requirements.txt
# COPY ./custom_addons/requirements.txt /tmp/
# RUN pip3 install -r /tmp/requirements.txt

# Definir el path de addons por defecto (se puede también configurar en odoo.conf)
ENV ODOO_ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

# El contenedor oficial ya inicia Odoo por defecto, no es necesario CMD aquí
