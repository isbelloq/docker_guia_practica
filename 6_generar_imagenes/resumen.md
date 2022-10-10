# Generar imagenes

## Dockerfile

Para automatizar y simplificar el proceso de creacion de imagnes se utiliz el archvo __Dockerfile__, en el cual se especifican las instrucciones de creacion.

Un ejemplo ejemplo basico del archivo __Dockerfile__ se muestra a continuacion

```
FROM debian:latest
RUN apt-get update && apt-get install -y vim
CMD /bin/bash
```

Donde

* `FROM` indica cual es la imagen base para crear la nueva.
* `RUN` los comando a ejecutar drentro del contenedor con la imagen vase para generar la imagen final.
* `CDM` el comando por defecto a ejecutar cuando se utilice la imagen.

Para 