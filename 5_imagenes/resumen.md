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