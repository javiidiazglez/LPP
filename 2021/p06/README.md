# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #6. Desarrollo Dirigido por Pruebas - TDD.

## Desarrollo Dirigido por Pruebas
  * Instalado gema Rspec (gem install rspec)
  * Ejecutado rspec --init (directorio spec y fichero "spec_helper.tb") 

  * Primera prueba:
	- $cat spec/matriz_spec.rb
	- require 'matriz' 

  * Arreglando el fallo: $touch lib/matriz.rb	
	- $rspec spec/matriz_spec.rb
	- Finished in 0.00054 seconds (files took 0.2278 seconds to load)
	- 0 examples, 0 failures

  * Agregando clase Matriz
	- $cat spec/matriz_spec.rb
	- require 'matriz'
	- describe Matriz do end
	- Error:  uninitialized constant Matriz

  * Arreglado fallo clase Matriz
	- $cat lib/matriz.rb
	- class Matriz end
	- $rspec spec/matriz_spec.rb
	- No examples found.

  * Agregando initialize y los getters   
  
  * Agregado to_s

  * Agregado función suma y se prueba correctamente

  * Agregado función producto escalar y se prueba correctamente

  * Agregado funcion traspuesta y se prueba correctamente
  
  * Agregado extra:
	- Funcion Multiplicacion => se prueba correctamente
	- Funcion Resta => se prueba correctamente
	- Funcion Diagonal => se prueba correctamente 
