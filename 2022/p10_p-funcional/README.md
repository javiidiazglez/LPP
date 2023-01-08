# Programación Funcional - Aparcamiento

[![Ruby](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml/badge.svg)](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml)

## Práctica 10. Programación Funcional
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
- ### Agregado funcion indice sostenibilidad
- ### Agregado metodo comparable segun su sostenibilidad
- ### Expectativas de datos_spec segun el indice de sostenibilidad y pasan las pruebas correctamente
- ### Expectativas de datos_spec con plazas libres de mayor índice de sostenibilidad del conjunto de aparcamientos y pasan las pruebas correctamente
- ### Expectativas de datos_spec con plazas libres de minusválidos de mayor índice de sostenibilidad del conjunto de aparcamientos y pasan las pruebas correctamente
- ### Expectativas de datos_spec en la que espera calcular el porcentaje de ocupación de cada uno de ellos del conjunto de aparcamientos y pasan las pruebas correctamente
- ### Expectativas de datos_spec en la que espera calcular el porcentaje de plazas de minusválidos libres de cada uno del conjunto de aparcamientos  y pasan las pruebas correctamente

## Rdoc
Generado la documentación automatica en /doc/.