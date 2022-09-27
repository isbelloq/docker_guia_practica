# Creacion de contenedores sin ejecutar
docker create -ti -p 8080:80 debian

# Obtencion de ayudas
docker --help

# Version de Docker
docker --version
docker -v

# Iniciar contenedor
docker start -ai --detach-keys "ctrl-u" 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163 # Nota: Como en VSCode esta Reservado ctrl-p, se agrega --detach-keys "ctrl-u" para salir del modo interactivo

# Acceder a la consola
docker attach --detach-keys "ctrl-u" 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Pausar el condenedor
docker stop -t 60 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Reiniciar un contendor
docker start 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163 # Inicio del contenedor pausado
docker restart 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163 # Reinicio del contenedor

# Renombrar un contenedor
docker ps -l
docker rename 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163 imagen_debian
docker rename imagen_debian foo

# Listado de contenedores
docker ps -a # Lista todos los contendores
docker ps -a -f name=foo # Listado por filtro
docker ps -n 2 # Listado de los ultimos n contenedores creados, para el ejemplo 2
docker ps -l # Muestra el ultimo contenedor creadoa
docker ps --no-trunc -a # No se limita la cantidad de caracteres en el listado 
docker ps -qa # Muestra unicamente los identificadores 
docker ps -sa # Muestra el tamanho de los contenedores

# Logs de contenedores
docker logs -t --tail 5 968770932b6f
docker logs --since 2022-08-21T01:51:59.975612700Z 968770932b6f
docker logs -f --since 2022-08-21T01:51:59.975612700Z 968770932b6f
docker logs --since 2022-08-21T01:51:59.975612700Z --details 968770932b6f

# Pausado de contenedor
docker pause 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Reanudado de contenedor
docker unpause 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Detener un contenedor a la fuerza
docker kill 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Listado de procesos en el contenedor
docker top 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Eliminado de contenedor
docker stop 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163 # Antes de borrar el contenedor es necesaro detenerlo
docker rm 4484b8f4ed29f8174cb1456a97b6199beeab108336ccf5cf87db85363249a163

# Ejecucion de comandos en un contenedor
docker exec -ti 3d89755482bb301f91e731063965f5e24b774d284ff361914a40d895494b8499 pwd
docker exec -ti 3d89755482bb301f91e731063965f5e24b774d284ff361914a40d895494b8499 ls

# Crear y ejecutar contenedores
docker run --name servidor1 --hostname servidor1 --rm debian uname -a

# Copias de seguridad
docker export -o servidor1.tar 3d89755482bb301f91e731063965f5e24b774d284ff361914a40d895494b8499

# Restauracion
docker import servidor1.tar foo:20220824 # Restauracion del contenido del contenedor como una imagen
docker run -ti --rm foo:20220824 cat /etc/debian_version

# Inspeccion de contenedores
docker inspect -f "{{.Created}}" 07d9246c53a6
docker inspect -f "{{.ContainerConfig.Hostname}}" 07d9246c53a6

# Estadisticas de uso
docker stats --all
docker stats --no-stream f4a7f53327e84b277c6f39f61d77ac22fd05ef26cd84ccde437c6dd11f5662e0

#Eventos desde el servidor
docker events