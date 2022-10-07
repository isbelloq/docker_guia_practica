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

# Convertir un contenedor en una imagen
docker run --name convertir -dti debian
docker exec -ti convertir apt-get -q update
docker exec -ti convertir apt-get -y install vim
docker commit -a "Santiago Bello <isbelloq@gmail.com>" -m "Instalar VIM" convertir debianvim
docker images
docker history debianvim

# Etiquetado de imagenes
docker tag debianvim debianvim:0.1

# Publicacion en Docker hub
docker login
docker tag debianvim:0.1 isbelloq/debianvim:0.1
docker push isbelloq/debianvim:0.1
docker logout

# Publicacion en repositorio local
docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker tag debianvim:0.1 localhost:5000/debianvim:0.1
docker push localhost:5000/debianvim:0.1
