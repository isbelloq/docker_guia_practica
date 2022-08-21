# Creacion de contenedores sin ejecutar
docker create -ti -p 8080:80 debian

# Obtencion de ayudas
docker --help

# Version de Docker
docker --version
docker -v

# Iniciar contenedor
docker start -ai --detach-keys "ctrl-u" 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460 # Nota: Como en VSCode esta Reservado ctrl-p, se agrega --detach-keys "ctrl-u" para salir del modo interactivo

# Acceder a la consola
docker attach --detach-keys "ctrl-u" 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460

# Pausar el condenedor
docker stop -t 60 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460

# Reiniciar un contendor
docker start 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460 # Inicio del contenedor pausado
docker restart 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460 # Reinicio del contenedor

# Renombrar un contenedor
docker ps -l
docker rename 9dec89627d60d72961763e1f6cc7f82490f0efb64f0905922623c29eb3dc7460 imagen_debian
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