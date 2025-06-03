# Usa la imagen oficial de Odoo 16
FROM odoo:16

# Usa root para instalar librerías del sistema
USER root

# Instala las dependencias necesarias para python-ldap
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Regresa al usuario odoo
USER odoo

# Copia tus addons personalizados
COPY ./custom_addons /mnt/extra-addons

# (Opcional) Instala dependencias si tienes requirements.txt
# COPY ./requirements.txt /tmp/
# RUN pip3 install -r /tmp/requirements.txt

# Exporta la ruta de addons como variable de entorno
ENV ODOO_ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons
