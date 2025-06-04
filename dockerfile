FROM odoo:16

USER root

# Instalar dependencias necesarias del sistema
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar tus módulos personalizados si los tienes
COPY ./custom_addons /mnt/extra-addons

# Instalar dependencias de Python si tienes un requirements.txt
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Cambiar al usuario odoo (buenas prácticas)
USER odoo

# No se necesita ENTRYPOINT ni CMD porque Render usará startCommand
