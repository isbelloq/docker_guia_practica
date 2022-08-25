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
* `-p {puerto_servidor:puerdt_contenedor}` Se asigna un puerto de salida.

## Ayuda

Se puede obtener ayuda de Docker usando el comando:

```bash
docker --help
```

Para obtener ayuda de de una accion especifica se usa el comando

```bash
docker {accion} --help
```


## Version
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

## Listado de contenedores

Para listas los contenedores creados se usa el comando

```bash
docker ps [flags]
```

Por defecto solo se muestran los contenedores inicializado.

Las opciones de `flags` pueden ser:
* `-a` o `--all` Lista todos los contendores.
* `-f {filtro}` o `--filter` Creacion de filtros para listado de contenedores.
* `-n {numero_de_contenedores}` o `--last {numero_de_contenedores}` Listado de los ultimos n contenedores creados.
* `-l` o `--latest` Muestra el ultimo contenedor creadoa.
* `--no-trunc` No se limita la cantidad de caracteres en el listado de contenedores.
* `-q` o `--quite` Muestra unicamente los identificadores.
* `-s` o `--size` Muestra el tamanho de los contenedores

## Registros

Para mostrar los registros de los contenedores se usa el comando

```bash
docker logs [flags] {identificador_contenedor}
```

Las opciones de `flags` pueden ser:
* `--details` Muestra la informacion detallada.
* `-f` o `--follow` Espera por nuevos registros.
* `--since {fecha}` Muestra los registro a partir de la fecha determinada.
* `--tail {numero_de_registros}` Muestra los ultimos n registros o todos si se usa la palabra `all`.
* `-t` o `--timestamps` Muestra la fecha y la hora del registro.
* `-q` o `--quite` Muestra unicamente los identificadores.
* `-s` o `--size` Muestra el tamanho de los contenedores

## Pausa

Para pausar un contenedor en ejecuccion se usa el comando

```bash
docker pause {identificador_contenedor}
```

## Reaudar

Para reanudar la actividad de un contenedor en ejecuccion se usa el comando

```bash
docker unpause {identificador_contenedor}
```

## Kill

Es posible detener la ejecucion de un contenedor a a la fuerza utilizadon el comando

```bash
docker kill [-s --signal {senhal_de_dentencion}] {identificador_contenedor}
```

La opcion por defecto de `-s` es `SIGKILL`

## Procesos en el contenedor

Se puede revisar los diferentes procesos que se ejecutan en un contenedor usando el comando

```bash
docker top {identificador_contenedor}
```

## Borrado de contenedores

Para eliminar un contenedor se usa el comando

```bash
docker rm [flags] {identificador_contenedor}
```

Las opciones de `flags` pueden ser:
* `-f` o `--force` Elimina el contenedor a la fuerza, es decir, si estan en ejecucion.
* `-v` o `--volumes` Elimina los volumenes asociados al contenedor.

## Ejecucion de comandos

Para ejecutar comandos en un contenedor que se encuentra activo se usa el comando

```bash
docker exec [flags] {identificador_contenedor}
```

Las opciones de `flags` pueden ser:
* `-d` o `--detach` Se ejecuta el comando en segundo plano.
* `--detach-keys {teclas}` Conbinacion de teclas para salir de la consola.
* `-i` o `--interactive` *interactive* Inicia el contendor en modo interactivo.
* `--privileged` Ejecuta permisos con nivel privilegiado __Usar con cuidado__.
* `-t` Adjunta una terminal virtual.
* `-u` o `--user {usuario}` Se ejecuta con un usuario determinado.

## Crear y ejecutar contenedor
A diferencia de `docker create [...]` el comando

```bash
docker run [flags] {imagen} [comando]
```

Crea el contenedor y lo inicia.

Las opciones de `flags` pueden ser:
* `-a {valor}` o `--attach {valor}` Adjunta valores para inicar.
* `-d` o `--detach` Se ejecuta el contenedor en segundo plano.
* `--dns {servidor}` Se establece un servidor DNS.
* `--dns-search {dominios}` Se establecen los dominios de busqueda de DNS.
* `-h {nombre}` o `--hostname {nombre}` Se especifica el nobre de host para el contenedor.
* `-i` o `--interactive` Poermite el modo interactivo para introducir comandos.
* `--mac-address {direccion}` Se especifica la direccion MAC del contenedor.
* `--name {nombre}` Se especifica el nombre del contenedor.
* `-p {puerto_servidor:puerdt_contenedor}` o `--publish {puerto_servidor:puerdt_contenedor}` Se asigna un puerto de salida.
* `-P` o `--publish-all` Se asigna un puerto de salida con disponibilidad aleatoria.
* `--read-only` Se ejecuta el contenedor en modo lectura.
* `--restart {politica}` Se establece una politica de reinicio, estas politicas puede ser:
    - `off` No se inicia el contenedor nunca, solo se inicia manualmente.
    - `on-failure` Se reinicia el contenedor en caso de error.
    - `always` Se reinicia simpre que sea detenido.
    - `unless-stoped` Nunca se reinicia a no ser que sea detenido con `stop`.
* `--rm` El contenedor es eliminado cuando es detenido.
* `-t` o `--tty` Adjunta una terminal virtual.
* `-u` o `--user {usuario}` Se asigna un usuario para ejecutar comandos.
* `-w {directorio}` o `--workdir {directorio}` Se asigna el directorio de trabajo.

## Copias de seguridad

Se puede crear una copia de seguridad de un contenedor usando el comando

```bash
docker export -o {nombre_copia.tar} {identificador_contenedor}
```

## Restairacion de copiad de seguridad

Para restaurar una copia de seguridad se usa el comando

```bash
docker import [-m {mensaje_de_importacion}] {nombre_copia.tar} {nombre}[:etiqueta]
```

> Nota: la importacion de copias crea una imagen!