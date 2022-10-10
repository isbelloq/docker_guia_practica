# Docker - Guia practica
Repositorio con los comandos del libro Docker - Guia practica de Alberto Gonzalez

1. __3_primeros_pasos__
    * __cap3-scripts.ps1__ Comandos introductorios de docker, se dan ejemplos los comandos `run`, `ps`, `logs`, `inspect`, `start` y `stop`.
    * __resumen.md__ Archivo markdown con anotaciones de uso de los comandos en `cap3-scripts.ps1`
2. __4_contenedores__
    * __cap4-scripts.ps1__ Se profundiza en los comandos introductorios del capitulo 3 y se agregan mas.
    * __resumen.md__ Archivo markdown con anotaciones de uso de los comandos en `cap4-scripts.ps1`
3. __5_imagenes__
    * __cap5-scripts.ps1__ Comandos para manipulacion de imagenes (listado, descarga, eliminado, entre otros).
    * __resumen.md__ Archivo markdown con anotaciones de uso de los comandos en `cap5-scripts.ps1`

3. __6_generar_imagenes__
    * __cap6-scripts.ps1__ Comando de creacion de imagen en base a `Dockerfile`.
    * __resumen.md__ Archivo markdown con anotaciones de uso de los comandos en `cap6-scripts.ps1` y generacion de archivos `Dockerfile`
    * __debianvim__ Directorio con `Dockerfile` para crear la imagen `debianvim`


```bash
docker_guia_practica
├── 3_primeros_pasos
│   ├── cap3-scripts.ps1
│   └── resumen.md
├── 4_contenedores
│   ├── cap4-scripts.ps1
│   └── resumen.md
├── 5_imagenes
│   ├── cap5-scripts.ps1
│   └── resumen.md
├── 6_generar_imagenes
│   ├── cap6-scripts.ps1
│   ├── resumen.md
|   └── debianvim
|       └── Dockerfile
└── README.md
```