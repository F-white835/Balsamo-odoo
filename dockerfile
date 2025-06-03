# Copiar el template y entrypoint
COPY odoo.conf.template /etc/odoo/odoo.conf.template
COPY entrypoint.sh /entrypoint.sh

# Dar permisos de ejecución al entrypoint
RUN chmod +x /entrypoint.sh

# Usar el entrypoint y comando para arrancar Odoo
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
