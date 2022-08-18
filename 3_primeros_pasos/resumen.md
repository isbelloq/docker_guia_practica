# Resumen Capitulo 3: Primeros pasos

## Ejecutar container

Los contenedores ejecutan con el siguiente comando

```bash
docker run [flags] {imagen} [comando]
```

Las opciones de `flags` pueden ser:
* `-t` Se permite acceder a la terminal.
* `-i` *interactive* Inicia el contendor en modo interactivo.
* `-d` *Detach* Se inicial el contenedor en segundo plano.
* `-P` Se asigna un puerto de salida con disponibilidad aleatoria.
* `-p [puerto_servidor:puerdt_contenedor]` Se asigna un puerto de salida.

## Listar contenedores

Se puede revisar una lista de los contenedores con el siguente comando

```bash
docker ps [flags]
```
Por defecto, solo se muestran los contenedores activos.

Las opciones de `flags` pueden ser:
* `-l` Muestra el ultimo contenedor.
* `-a` Muestra todos los contenedores incluyendo los activos e inactivos.

## Logs de ejecucion

Se pueden revisar los logs de la ejecucion de los contenedores mediante el comando

```bash
docker logs [flags] {identificador_contenedor}
```

El `identificador_contenedor` puede ser:
* *Nombre del contenedor*
* *ID corto* que es una cadena de 12 caracteres
* *ID largo* que es una cadena de 64 caracteres

Las opciones de `flags` pueden ser:
* `-f` Muestra el flujo de logs en tiempo real.

## Inspeccion de contenedores

La inspeccion de un contenedor tiene se ve en un JSON con los diferentes atributos del contenedor, el comando que se usa es

```bash
docker inspect {identificador_contenedor}
```

El `identificador_contenedor` puede ser:
* *Nombre del contenedor*
* *ID corto* que es una cadena de 12 caracteres
* *ID largo* que es una cadena de 64 caracteres

## Iniciar contenedores

Si un contenedor se encuentra pausado, se puede iniciar usando el comando

```bash
docker start {identificador_contenedor}
```

El `identificador_contenedor` puede ser:
* *Nombre del contenedor*
* *ID corto* que es una cadena de 12 caracteres
* *ID largo* que es una cadena de 64 caracteres

## Pausar contenedores

Si se quiere pausar un contenedor que se encuentra activo se usa el comando

```bash
docker stop {identificador_contenedor}
```

El `identificador_contenedor` puede ser:
* *Nombre del contenedor*
* *ID corto* que es una cadena de 12 caracteres
* *ID largo* que es una cadena de 64 caracteres