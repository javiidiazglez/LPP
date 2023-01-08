# Polimorfismo - Aparcamiento

[![Ruby](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml/badge.svg)](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml)

## Práctica 9. Programación Orientada a Objetos. Polimorfismo
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
- ### Agregado clase hija Aeropuerto y Estación y pasan las pruebas correctamente
- ### Expectativas de datos_spec y pasan las pruebas correctamente
- ### Agregado funcion aparcar, duracion, hora_a_segundos e importe y pasan las pruebas correctamente
- ### Agregado each yield, enumerable en clase vehiculo
- ### Expectativas de vehiculo_spec pasan las pruebas correctamente
- ### Agregado función reserva_minusvalido, libre_minusvalido y vehiculo_estacionados, en el modulo funcionalidades
- ### Expectativas de spec aparcamiento_funcionalidades pasan las pruebas correctamente

## Rdoc
Generado la documentación automatica en /doc/.