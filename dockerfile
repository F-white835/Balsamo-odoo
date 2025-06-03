# Usa la imagen oficial de Odoo 16
FROM odoo:16

# Usa root para instalar dependencias del sistema
USER root

# Instala dependencias del sistema necesarias para python-ldap y otros paquetes
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Cambiar de nuevo a odoo
USER odoo

# Copiar módulos personalizados
COPY ./custom_addons /mnt/extra-addons

# Copiar archivo de configuración
COPY ./odoo.conf /etc/odoo/odoo.conf

# Instalar paquetes Python adicionales si existe requirements.txt
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Exponer el puerto por si hace falta
EXPOSE 8069

# El CMD por defecto de la imagen oficial ya ejecuta odoo
