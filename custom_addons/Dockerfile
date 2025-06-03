FROM odoo:16

COPY ./custom_addons /mnt/extra-addons

USER root
RUN chown -R odoo:odoo /mnt/extra-addons
USER odoo

CMD ["odoo"]
