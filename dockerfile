# Usa la imagen oficial de Odoo 16
FROM odoo:16

# (Opcional) Instala paquetes adicionales si necesitas
# RUN apt-get update && apt-get install -y git nano unzip

# (Opcional) Copia tus addons personalizados si los tienes
COPY ./custom_addons /mnt/extra-addons

# Expone el puerto por donde corre Odoo
EXPOSE 8069

# Render usará el `startCommand` definido en render.yaml, así que no ponemos CMD aquí
