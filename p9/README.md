# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #9. POO: Polimorfismo
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación RDoc.

## Herencia de la clase Avicola

- Expectativa 1: Se espera que una instancia de la clase Avícola sea una granja Avícola **no pasa la prueba**
- Expectativa 1: Se instancia la clase **pasa la prueba**
``` ruby
      expect(@avicola.instance_of?Granja::Avicola).to eq(true)
```

- Expectativa 2: Se espera que una instancia de la clase Avícola sea un Dato **no pasa la prueba**
- Expectativa 2: Se instancia la clase **pasa la prueba**
``` ruby
      expect(@avicola).to be_a_kind_of(Granja::Datos)
```

- Expectativa 3: Se espera que una instancia de la clase Avícola sea un Object **no pasa la prueba**
- Expectativa 3: Se instancia la clase **pasa la prueba**
``` ruby
      expect(@avicola.is_a?Object).to eq(true)
```

- Expectativa 4: Se espera que una instancia de la clase Avícola sea un BasicObject **no pasa la prueba**
- Expectativa 4: Se instancia la clase **pasa la prueba**
``` ruby
      expect(@avicola.is_a?BasicObject).to eq(true)
```

- Expectativa 5: No se espera que una instancia de la clase Avícola sea un Animal **no pasa la prueba**
- Expectativa 5: Se instancia la clase con `not_to be_a` **pasa la prueba**
``` ruby
      expect(@avicola).not_to be_a(Granja::Animal)    
```

- Expectativa 6: No se espera que una instancia de la clase Avícola sea un Ave **no pasa la prueba**
- Expectativa 6: Se instancia la clase con `false` **pasa la prueba**
``` ruby
      expect(@avicola.is_a?Granja::Ave).to eq(false)   
```

## Atributos de la clase Avicola

- Expectativa 7: Tiene una clase para almacenar los datos de la granja **no pasa la prueba**
- Expectativa 7: Se crea la clase **pasa la prueba**
``` ruby
      expect(@avicola).not_to be_nil
```

- Expectativa 8: Tiene un atributo para el tipo de aves (gansos, pollos, patos, pavos) **no pasa la prueba**
- Expectativa 8: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.tipo_aves).to eq("pollo")
```

- Expectativa 9: Tiene un atributo para el destino de los animales (huevos, sacrificio) **no pasa la prueba**
- Expectativa 9: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.destino).to eq("huevos")
```

- Expectativa 10: Tiene un atributo para el número de aves de la granja **no pasa la prueba**
- Expectativa 10: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.numeros_aves).to eq(2)
```

- Expectativa 11: Tiene un atributo para el precio unitario de los animales **no pasa la prueba**
- Expectativa 11: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.precio_compra).to eq(100)
```

- Expectativa 12: Tiene un atributo para el precio de venta unitario de los animales **no pasa la prueba**
- Expectativa 12: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.precio_venta).to eq(200)
```

- Expectativa 13: Tiene un atributo para almacenar las aves de la granja **no pasa la prueba**
- Expectativa 13: Se crea acceso atributo **pasa la prueba**
``` ruby
      expect(@avicola.informacion).to eq("ave macho robusto")
```

- Expectativa 14: Se obtiene una cadena con la información de la granja avicola correctamente formateada **no pasa la prueba**
- Expectativa 14: Se crea función to_s **pasa la prueba**
``` ruby
      expect(@avicola.to_s).to eq("pollo,huevos,2,100,200,ave macho robusto,corto,palmeadas,voladoras, grueso,palmeadas,nadadoras")
```

## Enumerables de la clase Avicola

- Expectativa 15: Se espera clase Avicola sea Enumerable **no pasa la prueba**
- Expectativa 15: Se crea el Enumerable **pasa la prueba**
``` ruby
      expect(@avicola).to be_a(Enumerable)
```

- Expectativa 16: Se espera el método All **no pasa la prueba**
- Expectativa 16: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.all?Numeric).to eq(true) 
```

- Expectativa 17: Se espera el método Min **no pasa la prueba**
- Expectativa 17: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.min).to eq(2) 
```

- Expectativa 18: Se espera el método Max **no pasa la prueba**
- Expectativa 18: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.max).to eq(200)
```

- Expectativa 19: Se espera el método Sort **no pasa la prueba**
- Expectativa 19: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.sort).to eq([2,100,200]) 
```

- Expectativa 20: Se espera el método Each (numero_aves) **no pasa la prueba**
- Expectativa 20: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.each{ |numeros_aves| numeros_aves}).to eq(200)
```

- Expectativa 21: Se espera el método Collect **no pasa la prueba**
- Expectativa 21: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.collect { |i| i * 3 }).to eq([6,300,600])
```

- Expectativa 22: Se espera el método Any **no pasa la prueba**
- Expectativa 22: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.any?).to eq(true)  
```

- Expectativa 23: Se espera el método Count **no pasa la prueba**
- Expectativa 23: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.count).to eq(3)  
```

- Expectativa 24: Se espera el método Drop **no pasa la prueba**
- Expectativa 24: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.drop(1)).to eq([100, 200])
```

- Expectativa 25: Se espera el método Detect (numero_aves) **no pasa la prueba**
- Expectativa 25: Se crea el método **pasa la prueba**
``` ruby
      expect(@avicola.detect { |i| i == @numeros_aves}).to eq(nil)
```

## Gestión de puesta de huevos de Granja Avicola

- Expectativa 26: Existe una constante de Jaulas **no pasa la prueba**
- Expectativa 26: Se crea la constante **pasa la prueba**
``` ruby
      expect(Granja::Funcion::JAULAS).to eq("Condiciones favorables")
```

- Expectativa 27: Existe una constante de Campo Abierto **no pasa la prueba**
- Expectativa 27: Se crea la constante **pasa la prueba**
``` ruby
      expect(Granja::Funcion::CAMPO_ABIERTO).to eq("Circulan libremente")
```

## Productores Avicolas

- Expectativa 28: Existe un procedimiento para establecer los cuidados de los animales **no pasa la prueba**
- Expectativa 28: Se crea los cuidados **pasa la prueba**
``` ruby
      expect(Granja::Funcion::set_cuidado(5.2 , @vector_animales)).to eq([305.2, 405.2, 505.2, 1005.2])
```

## Población de la granja

- Expectativa 29: Existe un procedimiento para establecer la reproduccion de los animales ( > 24 ) **no pasa la prueba**
- Expectativa 29: Se crea la reproduccion con `not_to eq` & `to eq` **pasa la prueba**
``` ruby
      expect(Granja::Funcion::set_reproduccion(@vector_animales)).to eq([@animal_4])
      expect(Granja::Funcion::set_reproduccion(@vector_animales)).not_to eq([@animal_1, @animal_2, @animal_3])
```

## Generación automática de documentación
- Añadido rdoc en /doc/