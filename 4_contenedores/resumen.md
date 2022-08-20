# Resumen Capitulo 4: Contenedores

## Creacion de contenedores sin ejecutar
Para crear contenedores sin ejecutar se usa el comando `create`

```bash
docker create [flags] {imagen} [comando]
```

Las opciones de `flags` pueden ser:
* `-t` Se permite acceder a la terminal.
* `-i` *interactive* Inicia el contendor en modo interactivo.
* `-P` Se asigna un puerto de salida con disponibilidad aleatoria.
* `-p [puerto_servidor:puerdt_contenedor]` Se asigna un puerto de salida.

## Acciones basicas

### Ayuda

Se puede obtener ayuda de Docker usando el comando:

```bash
docker --help
```

Para obtener ayuda de de una accion especifica se usa el comando

```bash
docker {accion} --help
```


### Version
* `docker --version` o `docker -v` se obtiene la version de Docker

## Iniciar un contenedor

Para iniciar un contenedor se usa el comando

```bash
docker start [flags] {identificador_contenedor}
```
Las opciones de `flags` pueden ser:
* `-a` o `--attach` Para acceder a la consola si es posible.
* `-i` *interactive* Inicia el contendor en modo interactivo.

## Acceso a consola

Para acceder a la consola de un contenedor se usa

```bash
docker attach [flags] {identificador_contenedor}
```
Las opciones de `flags` pueden ser:
* `--detach-keys {teclas}` Conbinacion de teclas para salir de la consola.

## Pausar contenedor

Para pausar un contenedor se usa el comando

```bash
docker start [flags] {identificador_contenedor}
```
Las opciones de `flags` pueden ser:
* `-t {tiempo_en_seg}` o `--time {tiempo_en_seg}` Se especifica el tiempo en segundo para pausar el contenedor.

## Reinicio de un contenedor

La accion de reiniciar un contenedor consiste en pausar (`stop`) e iniciar (`start`), se hace mediante el comando

```bash
docker restart {identificador_contenedor}
```

## Renombrar un contenedor

Es posible renombrar un contenedor con el comando

```bash
docker rename {identificador_contenedor} {nuevo_nombre}
```