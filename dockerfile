FROM odoo:16

# Cambiar a root para instalar dependencias del sistema
USER root

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Regresar al usuario odoo
USER odoo

# Copiar los addons personalizados
COPY ./custom_addons /mnt/extra-addons

# Copiar el archivo de configuración
COPY ./odoo.conf /etc/odoo/odoo.conf

# Instalar dependencias Python si tienes requirements.txt
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
