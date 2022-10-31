# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #5. Pruebas Unitarias.

# Documentación:
## Costo Total Vehiculo
- ### Se crea función coste_total_vehiculo con 3 parámetros (dias, precio diario y tipo), en la que devuelve "turismo" o "motos" la multiplicación dias * precio diario, en caso contrario se devuelve "No es un vehiculo".
```rb
def coste_total_vehiculo(dias, precio_diario, tipo)
  if (tipo == "turismos")
    dias * precio_diario
  elsif (tipo == "motos")
    dias * precio_diario
  else
    "No es un Vehiculo"
  end
end
```
- ## Se crea Test para coste_total_vehiculo, en la que comprueba con assert_equal, assert_not_nil y assert_not_equal, también comprobando tanto para Integrer como Float y pasan las pruebas correctamente.
```rb
require 'test/unit'
require 'lib/vehiculo'

class TestVehiculo < Test::Unit::TestCase
  def test_simple
  end

  def test_coste_total_vehiculo
    assert_equal(450, coste_total_vehiculo(30, 15, "turismos"))          # integrer turismos
    assert_equal(450.0, coste_total_vehiculo(30.0, 15.0, "turismos"))    # float turismos
    assert_equal(200, coste_total_vehiculo(20, 10, "motos"))             # integrer motos
    assert_equal(200.0, coste_total_vehiculo(20.0, 10.0, "motos"))       # float motos
    assert_not_nil(200.0, coste_total_vehiculo(20.0, 10.0, "motos"))     # assert_not_nil
    assert_not_equal(100.0, coste_total_vehiculo(20.0, 10.0,"turismos")) # assert_not_equal
    puts "-> Funciona correctamente coste_total_vehiculo (Turismos y Motos)\n"
  end
end
```

## Costo Descuento Vehiculo
- ### Se crea función coste_descuento_vehiculo con 3 parámetros (coste_total, porcentaje diario y tipo), en la que devuelve "turismo" o "motos" el costo del porcentaje de un número, en caso contrario se devuelve "No es un vehiculo".
```rb
def coste_descuento_vehiculo(coste_total, porcentaje, tipo)
  if (tipo == "turismos")
    (1 - (porcentaje / 100)) * coste_total
  elsif (tipo == "motos")
    (1 - (porcentaje / 100)) * coste_total
  else
    "No es un Vehiculo"
  end
end
```
- ### Se crea Test para coste_descuento_vehiculo, en la que comprueba con assert_equal, assert_not_nil y assert_not_equal, también comprobando tanto para Integrer como Float y pasan las pruebas correctamente.
```rb
def test_coste_descuento_vehiculo
  assert_equal(0, coste_descuento_vehiculo(450, 100, "turismos"))            # integrer turismos
  assert_equal(405.0, coste_descuento_vehiculo(450, 10.0, "turismos"))       # float turismos
  assert_equal(0, coste_descuento_vehiculo(200, 100, "motos"))               # integrer motos
  assert_equal(180.0, coste_descuento_vehiculo(200, 10.0, "motos"))          # float motos
  assert_not_nil(200.0, coste_descuento_vehiculo(200.0, 100.0, "motos"))     # assert_not_nil
  assert_not_equal(100.0, coste_descuento_vehiculo(200.0, 100.0,"turismos")) # assert_not_equal
  puts "-> Funciona correctamente coste_descuento_vehiculo (Turismos y Motos)\n"
end
```
## Total Kilómetros Vehiculo
- ### Se crea función total_km_vehiculo con 3 parámetros (alquiler, entrega y tipo), en la que devuelve "turismo" o "motos" la resta alquiler menos entrega, en caso contrario se devuelve "No es un vehiculo".
```rb
def total_km_vehiculo(alquiler, entrega, tipo)
  if (tipo == "turismos")
    alquiler - entrega
  elsif (tipo == "motos")
    alquiler - entrega
  else
    "No es un Vehiculo"
  end
end
```
- ### Se crea Test para total_km_vehiculo, en la que comprueba con assert_equal, assert_not_nil y assert_not_equal, también comprobando tanto para Integrer como Float y pasan las pruebas correctamente.
```rb
def test_total_km_vehiculo
  assert_equal(100, total_km_vehiculo(200, 100, "turismos"))                  # integrer turismos
  assert_equal(100.0, total_km_vehiculo(200.0, 100.0, "turismos"))            # float turismos
  assert_equal(200, total_km_vehiculo(300, 100, "motos"))                     # integrer motos
  assert_equal(200.0, total_km_vehiculo(300.0, 100.0, "motos"))               # float motos
  assert_not_nil(200.0, total_km_vehiculo(300.0, 100.0, "motos"))       # assert_not_nil
  assert_not_equal(100.0, total_km_vehiculo(300.0, 100.0,"turismos")) # assert_not_equal
  puts "-> Funciona correctamente total_km_vehiculo (Turismos y Motos)\n"
end
```
## Test Failure
- ### Se crea Test para test_failure, en la que comprueba con assert_equal, assert_not_nil y assert_not_equal, también comprobando tanto para Integrer como Float y pasan las pruebas correctamente.
```rb
def test_failure
    assert_not_equal(5400, coste_total_vehiculo(-12,450, "motos"))
    assert_equal(-5400, coste_total_vehiculo(-12,450, "motos"))
    assert_equal(2.400000000000002, coste_descuento_vehiculo(-120,102.0, "turismos"))
    assert_equal(-3, total_km_vehiculo(6,9, "motos"))
    assert_equal("No es un Vehiculo", coste_total_vehiculo(30, 15, "camion"))
    assert_not_nil("No es un Vehiculo", coste_total_vehiculo(30, 15, "camion"))
    assert_equal("No es un Vehiculo", coste_descuento_vehiculo(200, 10.0, "bicicleta"))
    assert_equal("No es un Vehiculo", total_km_vehiculo(300, 100, "camion"))
    assert_equal("No es un Vehiculo", total_km_vehiculo(300.0, 100.0, "camion"))
    puts "-> Funciona correctamente test_failure (Turismos y Motos)\n"
end
```
## Test Type Check
- ### Se crea Test para type_check, en la que comprueba con assert_raise con ZeroDivisionError, TypeError y NoMethodError y pasan las pruebas correctamente.
```rb
 def test_type_check
  assert_raise(ZeroDivisionError) {coste_total_vehiculo(1/0)}
  assert_raise(ZeroDivisionError) {coste_descuento_vehiculo(1/0)}
  assert_raise(ZeroDivisionError) {total_km_vehiculo(1/0)}
  assert_raise(TypeError) {coste_total_vehiculo("30","15","turismos")}
  assert_raise(NoMethodError) {coste_descuento_vehiculo("90","450","turismos")}
  assert_raise(NoMethodError) {total_km_vehiculo('200','100','motos')}
  puts "-> Funciona correctamente Test_type_check (Turismos y Motos)"
end
```