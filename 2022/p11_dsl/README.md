# Programación funcional. DLS - Aparcamiento

[![Ruby](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml/badge.svg)](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml)

## Práctica 11. Programación funcional. DLS
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación RDoc

## Instalación
- Instalar el Bundler 
    ```rb
    gem install bundler
    ```
- Instalar la gema 
    ```rb
    bundle gem aparcamiento
    ```
- Instalar Guard en /aparcamiento/
    ```rb
    bin/setup
    ```
- Generar un fichero de guard por defecto (Guardfile)
    ```rb
    bundle exec guard init
    ```
- Ejecutar Guard a través de Bundler en una terminal
    ```rb
    bundle exec guard
    ```
- Para ejecutar los test de forma manual
    ```rb
    rake
    ```
## Documentación
- ### Agregado initialize con id y aparcamiento
- ### Agregado bloques para DSL
- ### Agregado funcion añadir_aparcamiento y pasan las pruebas correctamente
- ### Agregado funcion aparcar y pasan las pruebas correctamente
- ### Agregado funcion get_estado y pasan las pruebas correctamente
- ### Agregado funcion get_reserva_minusvalidos y pasan las pruebas correctamente
- ### Agregado funcion get_libre_minusvalidos y pasan las pruebas correctamente
- ### Agregado funcion get_vehiculos_estacionados y pasan las pruebas correctamente
- ### Agregado Herencia de la clase Aparcamiento::DSLProveedor y pasan las pruebas correctamente

## Rdoc
Generado la documentación automatica en /doc/.