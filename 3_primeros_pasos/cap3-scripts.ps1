# Cap 3 - Primero pasos
## Ejecutar primero contenedor
docker run -ti debian cat /etc/debian_version


## Listado de contenedores
docker ps # Activos
docker ps -a # Todos
docker ps -l # Ultimo

## Registro de contenedores
docker logs festive_swartz #Por nombre
docker logs 03ebc9d1a183 #Por ID corto
docker logs 03ebc9d1a183e3859698f4285f58a8b6abc4455ff28641455b09605584b78264 #Por ID largo


## Inspeccion de contenedor
docker inspect festive_swartz #Por nombre
docker inspect 03ebc9d1a183 #Por ID corto
docker inspect 03ebc9d1a183e3859698f4285f58a8b6abc4455ff28641455b09605584b78264 #Por ID largo

## Ejecutar contenedor en modo interactivo
docker run -ti debian

## Ejecutar contenedor en segundo plano
docker run -dti debian /bin/bash -c "while true; do date; sleep 5; done"
docker logs -f be07476506d03fcb45e70f0400d5718d203aea28e12ce08caa796f6dc1a028c9

## Detener contenedores
docker stop be07476506d03fcb45e70f0400d5718d203aea28e12ce08caa796f6dc1a028c9

## Iniciar contenedores
docker start be07476506d03fcb45e70f0400d5718d203aea28e12ce08caa796f6dc1a028c9

## Exponer puertos
### Puertos sin exponer
docker run -dti httpd
docker inspect 279d4edcb473ba095fd3fcbaa5695cea03b3c11291a302ca70de567748b4824c | Select-String -Pattern '"IPAddress"' # Para Windows
docker inspect 279d4edcb473ba095fd3fcbaa5695cea03b3c11291a302ca70de567748b4824c | fgrep -m1 '"IPAddress"' # ParaLinux

### Puerto libre aleatorio
docker run -dtiP httpd
docker ps -l
curl.exe http://localhost:49153 # Para Windows
curl http://localhost:49153 # Para Linux

### Puerto seleccionado manual
docker run -dti -p 80:80 httpd
curl.exe http://localhost # Para Windows
curl http://localhost # Para Linux
docker port d5ed9c3fbc08