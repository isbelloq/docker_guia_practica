# Creacion de contenedores sin ejecutar
docker create -ti -p 8080:80 debian

# Obtencion de ayudas
docker --help

# Version de Docker
docker --version
docker -v

# Iniciar contenedor
docker start -ai --detach-keys "ctrl-u" f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d # Nota: Como en VSCode esta Reservado ctrl-p, se agrega --detach-keys "ctrl-u" para salir del modo interactivo

# Acceder a la consola
docker attach --detach-keys "ctrl-u" f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d

# Pausar el condenedor
docker stop -t 60 f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d

# Reiniciar un contendor
docker start f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d # Inicio del contenedor pausado
docker restart f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d # Reinicio del contenedor

# Renombrar un contenedor
docker ps -l
docker rename f1f47e7786a16c6d251d4c1a538fd77a3ac7c6c9708667d7d23b1678d331952d imagen_debian
docker rename imagen_debian foo