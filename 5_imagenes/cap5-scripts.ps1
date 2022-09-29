# Listado de imagenes
docker images
docker images --digests

# Busqueda de imagenes en Docker hub
docker search --limit 5 httpd

# Descarga de imagenes
docker pull nginx

# Historial de una imagen
docker history nginx

# Copia de seguridad
docker save -o nginx.latest.tar nginx

# Restauracion
docker load -i nginx.latest.tar

# Eliminacion de imagenes
docker rmi -f nginx