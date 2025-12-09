# Utilizamos la última imagen de NGINX
FROM nginx:latest

# Copiamos los archivos de nuestro Workspace a la imagen
COPY . /usr/share/nginx/html/

# Copiamos el archivo de configuración personalizado al contenedor
COPY config.conf /etc/nginx/conf.d/default.conf

# Exponemos el puerto 80
EXPOSE 80

# Ejecutamos el comando "nginx" para iniciar el servidor.
# Con "daemon off" se ejecuta en primer plano
CMD ["nginx", "-g", "daemon off;"]