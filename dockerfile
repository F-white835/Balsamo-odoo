FROM odoo:16

USER root

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar addons personalizados
COPY ./custom_addons /mnt/extra-addons

# Copiar archivo de configuración como template
COPY ./odoo.conf.template /etc/odoo/odoo.conf.template

# Copiar entrypoint que sustituye las variables
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copiar requirements si tienes dependencias
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Usar el entrypoint personalizado
ENTRYPOINT ["/entrypoint.sh"]

# Comando por defecto para lanzar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]

USER odoo
