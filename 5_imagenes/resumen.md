# Resumen Capitulo 5: Imagenes

Las imagenes son la base para crear contenedores, estas guardan configuraciones para ser replicadas en diferenes escenarios. Es posible generar nuevas imagenes a partir de contenedores creados para replicar configuraciones realizadas en un desarrollo.

## Listar imagenes

Para listar imagenes se usa el comando

```sh
docker images [flags] [nombre_imagen]
```

Las opciones de `flags` pueden ser:
* `-a` o `--all` Muestra todas las imagenes.
* `-f {filtro}` o `--filter {filtro}` Se aplica un filtro especifico a la consulta.
* `--format {formato}` Se especifica el formato de salida.
* `--no-trunc` No se trunca el tamanho de las columnas.
* `-q` o `--quiet` Solo se muestran los identificadores.
* `--digests` Muestra la identificacion de la imagen en formato *SHA256*.


## Repositorio de imagenes

La pagina [Docker Hub](https:/hub.docker.com) sirve como repositorio de imagenes de descarga. En la pagina se pueden buscar imagenes predeterminadas creadas por diferentes personas o empresas, tambien, es posible usar el comando 

```sh
docker search [flags] {busqueda}
```

Para buscar la imagenes por linea de comandos. Las opciones de `flags` pueden ser:
* `-f {filtro}` o `--filter {filtro}` Se aplica un filtro especifico a la consulta.
* `--limit {numero}` Limita los resultados, por defecto 25.
* `--no-trunc` No se trunca el tamanho de las columnas.

## Descarga de imagenes

Para descargar o actualizar las imagenes se usa el comando

```sh
docker pull {imagen}[:tag]
```

## Historial de una imagen

Las imagenes (al igual que el codigo) son propensas a tener diferentes etapas antes de llegar a su *imagen definitiva*, para esto se crean *imagen intermedias*. Para ver los cambio que a sufrido una imagen a travez del tiempo se usa el comando

```sh
docker history {imagen}
```

## Copias de seguridad

Para realizar copiad de seguridad de una imagen se pueden utilizar los comandos


```sh
docker save [-o nombre_fichero.tar] {imagen}
```

o 

```sh
docker save {imagen} > nombre_fichero.tar
```

## Restauracion

Para restaurar una imagen almacenada en una copia de seguridad se usa pueden usar los comandos

```sh
docker load [-i nombre_fichero.tar]
```

o 

```sh
docker load < nombre_fichero.tar
```

## Eliminar imagenes

Para eliminar una imagen se usa el comando

```sh
docker rmi [flags] {nombre_imagen}[:version]
```

Las opciones de `flags` pueden ser:
* `-f` o `--force` Se fuerza la eliminacion de la imagen.
* `--no-prune` No elimina las imagenes padre sin etiquetar.

## Convertir un contenedor en una imagen

Para guardar configuraciones realizadas en un contenedor y que se puedan replicar en un futuro se realizan imagenes a partir de un contenedor con el comando

```sh
docker commit [flags] {contenedor} {imagen}[:tag]
```

Las opciones de `flags` pueden ser:
* `-a` o `--author` Autor de la imagen, ejemplo `Santiago Bello <isbelloq@gmail.com>`
* `-m` o `--message` Mensaje de commit de la imagen.

## Etiquetado de imagenes

Para mantener control de versiones en la imagenes es una buena practica usar las etiquetas, la creacion de estas se da usando el comando

```sh
docker tag {imagen} {imagen:tag}
```

## Publicar una imagen un repositorio

### Publicacion en repositorio oficial

En el [repositorio de Docker](https://hub.docker.com/) se pueden publicar las imagenes creadas para compartirlas con otros usuarios. Para hacer eso es necesario:

1. Tener una cuenta en el [repositorio de Docker](https://hub.docker.com/)
2. El nombre de la imagen debe tener la estructura `usuario/imagen[:version]`.
3. Ingresar a la plataforma mediante el comando `docker login`

Si se cumplen estas condiciones se usa el comando

```sh
docker push {usuario/imagen}[:version]
```

Al finalizar el proceso se recomienda usar el comando `docker logout` para terminar la sesion.

### Publicacion en repositorio local

La publicacion en un repositorio local requiere realizar el despliegue de la imagen `registry` con la siguiente configuracion

```sh
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

Una vez desplegado el contenedor `registry` se debe hace el cambio del tag (o hacer el commit) de la imagen de la siguiente forma

```sh
docker tag {imagen} {localhost:5000/imagen}[:version]
```
o

```sh
docker commit {contenedor} {localhost:5000/imagen}[:version]
```

Finalmente se ejecuta el comando `docker push` de la siguiente manera

```sh
docker push {localhost:5000/imagen}[:version]
```