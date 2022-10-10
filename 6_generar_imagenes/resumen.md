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