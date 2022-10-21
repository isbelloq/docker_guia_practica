# Generar imagenes

## Dockerfile

Para automatizar y simplificar el proceso de creacion de imagnes se utiliz el archvo `Dockerfile`, en el cual se especifican las instrucciones de creacion.

Un ejemplo ejemplo basico del archivo `Dockerfile` se muestra a continuacion

```
FROM debian:latest
RUN apt-get update && apt-get install -y vim
CMD /bin/bash
```

Donde

* `FROM` indica cual es la imagen base para crear la nueva.
* `RUN` los comando a ejecutar drentro del contenedor con la imagen vase para generar la imagen final.
* `CDM` el comando por defecto a ejecutar cuando se utilice la imagen.

Luego de crear el archivo `Dockerfile` se debe ejecutar el comando

```sh
docker build [flags] {directorio}
```

Las opciones de `flags` pueden ser:
* `-t {nombre}[:etiqueta]` Pone nombre y etiqueta a la imagen.
* `--no-cache` Por defecto Docker guarda un cache las opciones realizada. Esta opcion se usa cuando el se quiere hacer siempre una imagen nueva.
* `--pull` Fuerza descargar la imagen que esta en `FROM`.
* `--quiet` Se silencia la infomacion a la hora de crear y solo se imprime el identificador de la imagen creada.

## Expresiones de _Dockerfile_

### FROM
```
FROM {imagen}[:etiqueta]
```

Indica la imagen a usar, por defecto trae la ultima pero se puede especificar la version
__Ejemplo__

```
FROM debian:whezzy
```

### RUN
```
RUN {comando}
```
o

```
RUN ["{comando}", "{parametro 1}", ..., "{parametro n}"]
```
 
Ejecucion de comandos a la hora de construir una imagen, este comando puede aparecer tantas veces como sea necesario en el `Dockerfile`, pero se recomenda agrupar los comandos en la menor cantidad de `RUN` posibles, ya que por cada aparicion se crea un contenedor intermedio.

__Ejemplo__

```
RUN apt-get update && apt-get install -y apache2
```

```
RUN ["apt-get", "install", "-y", "vim"]
```

### CMD

```
CMD {comando} {parametro 1}... {parametro n} 
```
o

```
CMD ["{comando}", "{parametro 1}", ..., "{parametro n}"]
```

Define el comando por defecto al crear el contenedor.

__Ejemplo__

```
FROM debian
CMD cat /etc/debian_version
```

```
FROM debian
CMD ["cat", "/etc/debian_version"]
```

Al hacer `docker run -ti debiancmd` se imprime en la consola

```
11.5
```

Pero se pueden poner otros comando, como por ejemplo `docker run -ti debiancmd ped` se imprime en la consola

```
/
```

### ENTRYPOINT

```
ENTRYPOINT {comando} {parametro 1}... {parametro n} 
```
o

```
ENTRYPOINT ["{comando}", "{parametro 1}", ..., "{parametro n}"]
```

Cambia el comando `/bin/sh` que es el comando por defecto a otro a la hora de ejecutar la imagen. ¿Cuál es la diferencia entre `CMD` y `ENTRYPOINT`? __No puede anular la instrucción ENTRYPOINT__ añadiendo parámetros de línea de comandos al comando `docker run`. Al optar por esta instrucción, implica que el contenedor está construido específicamente para ese uso.

El comando `ENTRYPOINT` se puede usar en conjunto con `CMD` de la siguiente forma:

```
ENTRYPOINT {comando}
CDM {parametro 1}... {parametro n}
```

o

```
ENTRYPOINT ["{comando}"]
CDM ["{parametro 1}",... "{parametro n}"]
```


__Ejemplo__
1. 
```
FROM debian
ENTRYPOINT ["cat", "/etc/debian_version"]
```

Al hacer `docker run -ti debianentrypoint` se imprime en la consola

```
11.5
```

2. 
```
FROM debian
ENTRYPOINT ["cat", "/etc/debian_version"]
```

Al hacer `docker run -ti debianentrypoint /etc/hostname` se imprime en la consola
```
11.5
bc210766c799
```


3. 
```
FROM debian
ENTRYPOINT ["cat"]
CMD ["/etc/hostname"]
```

Al hacer `docker run -ti debianentrypoint` se imprime en la consola
```
11.5
```


4. 
```
FROM debian
ENTRYPOINT ["cat"]
CMD ['/etc/hostname']
```

Al hacer `docker run -ti debianentrypoint /etc/hostname` se imprime en la consola
```
bc210766c799
```

### WORKDIR

```
WORKDIR {directorio}
```

Se cambia el directorio de trabajo del contenedor, por defecto es `/`. Esta sentencia se puede utilizar tantas veces como sea necesario.

__Ejemplo__

```
FROM debian
WORKDIR /tmp
RUN echo "test" > test.txt
WORKDIR /var/tmp
RUN echo "test2" > test2.txt
CMD ls -l /tmp/test.txt /var/temp/test2.txt
```

En el ejemplo queda el directorio `/var/tmp` como directorio de trabajo ya que es el ultmo en la ejecucion

### SHELL

```
SHELL ["{comando}", "{argumento_1}", ..., "{argumento_n}"]
```

Por defecto el comando de ejecucion de una terminal es `/bin/sh -c`, con `SHELL` se puede cambiar este comando y poner mas parametros. Lo especificado en `SHELL` es ejecutado con `CMD`

__Ejemplo__

```
FROM debian
SHELL ["/bin/sh", "-x", "-c"]
CMD date
```

### EXPOSE

```
EXPOSE {puerto1} [puerto2 ...]
```

Funciona para especificar los puertos de salida del contenedor. Al crear en contenedor, ninguno de los puertos se expone automaticamente.

__Ejemplo__

```
EXPOSE 80 443 8080
```

### COPY

```
COPY {origen1} [origen2 ...] {destino}
```

o

```
COPY ["{origen1}", "{origen2}", ... "{destino}"]
```

Copia los archivos especificados en el origen, esta es la opcion recomendada, a menos que se quiera descomprimir un fichero. A diferencia de `ADD`, `COPY` no permite el uso de rutas en la web.

__Ejemplo__

```
COPY *.conf /etc/apache2/
```

o

```
COPY ["miweb/", "/var/www/html"]
```

### ADD

```
ADD {origen1} [origen2 ...] {destino}
```

o

```
ADD ["{origen1}", "{origen2}", ... "{destino}"]
```

Copia los archivos especificados en el origen. Si se copia un directorio se copiara el contenido y no la raiz.
Si se copia un archivo comprimido (`.tar`, `.gzip`, `.xz` o `.bzip2`), el fichero sera extraido. Esta descompresion no se aplica si se copia desde un fichero web.

__Ejemplo__

```
ADD *.conf /etc/apache2/
```

o

```
ADD ["https://foo.com/bar.zip", "/foo/bar.zip"]
```

### VOLUME

```
VOLUMEN {dir1}... {dirn}
```

o

```
VOLUMEN ["{dir1}",..., "{dirn}"]
```

Crea un punto de montaje que podra ser accesible por otros contenedores o enlazar un directorio del servidor al contenedor basado en esta imagen.

__Ejemplo__
```
FROM debian
RUN mkdir /datos && date > /datos/fecha.txt
VOLUMEN /datos
```

### USER

```
USER {usuario|uid}
```

Por defecto los comando son ejecutados como administrador, `USER root` o `USER 0`, pero eso se puede cambiar con `USER`

__Ejemplo__

```
FROM debian
USER nobody
CDM id
```

o

```
FROM debian
USER 65534
CDM id
```

Al crear el contenedor con `docker run debianuser` se imprime
```
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
```

### LABEL

```
LABEL {llave_1}={valor_1} ... {llave_n}={valor_n}
```

Se agregan metadatos a la imagen generada. Son buena practica para identificar caracteristicas de una imagen.

__Ejemplo__

```
LABEL version="1.0" descripcion="Ejemplo de metadato"
```

### ENV

```
ENV {llave_1}={valor_1} ... {llave_n}={valor_n}
```

Creacion o modificacion de variables de entorno del sistema.


__Ejemplo__

1. 
```
FROM debian
ENV MIVARIABLE="Hola variable"
CMD echo $MIVARIABLE
```

2. 
```
FROM debian
RUN apt-get update && apt-get install -y locales locales-all
ENV LC_ALL="es_ES.UTF-8" LANG="es_ES.UTF-8"
CMD date
```

### ARG

```
ARG {nombre}[={valor_por_defecto}]
```

Con el parametro `ARG` es posible pasarle argumentos a la hora de construir una imagen

__Ejemplo__

```
FROM debian
ARG mivariable="Hola mundo"
ENV VARIABLE=$mivariable
CMD echo $VARIABLE
```
* Al correr el comando `docker build -t debianarg .\6_generar_imagenes\arg\` y luego `docker run --rm debianarg` se retorna `Hola mundo`
* Al correr el comando `docker build --build-arg mivariable="Holita mundito" -t debianarg .\6_generar_imagenes\arg\` y luego `docker run --rm debianarg` se retorna `Holita mundito`