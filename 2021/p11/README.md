# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #11. Programación Funcional. DSL.
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación RDoc.
- DSL

# Lenguaje de Dominio específo - DSL para los datos de la granja

## Atributos de la clase DSLGranja

- Expectativa 1: Tiene una clase para almacenar los datos de la granja
``` ruby
      expect(@granja_1).not_to be(nil)
```

- Expectativa 2: Tiene un metodo para los datos
``` ruby
      expect(@granja_1.respond_to?(:datos)).to be(true)
```

- Expectativa 3: Tiene un metodo para los datos
``` ruby
      expect(@granja_1.respond_to?(:ejemplar)).to be(true)
```

- Expectativa 4: "Se obtiene una cadena con la información de la granja correctamente formateada
``` ruby
      expect(@granja_1.to_s).to eq("DSLGranja: Identificación: 12345678, Nombre: Pollos muertos, Tipo: pollos, Descripción: PyME - Pequeña y mediana empresa\n\n1) Identificación: 12345678-00000001, Edad: 365 días, Peso: 700.2 gramos, Precio de compra: 4.25, Precio de venta: 4.75\n2) Identificación: 12345678-00000002, Edad: 465 días, Peso: 1200.2 gramos, Precio de compra: 1.25, Precio de venta: 2.75\n")
```
# Lenguaje de Dominio especifo - DSL para las funcionalidades de la granja

## Atributos de la clase DSLFuncionalidad

- Expectativa 5: Tiene una clase para almacenar las funcionalidades de la granj
``` ruby
      expect(@funcionalidad).not_to be(nil)
```

- Expectativa 6: Tiene un metodo para calcular el beneficio de una granja
``` ruby
      expect(@funcionalidad.respond_to?(:beneficio)).to be(true)
```

- Expectativa 7: Tiene un metodo para calcular el bienestar de una granja
``` ruby
      expect(@funcionalidad.respond_to?(:bienestar)).to be(true)
```

- Expectativa 8: Tiene un metodo para calcular la productividad de una granja
``` ruby
      expect(@funcionalidad.respond_to?(:productividad)).to be(true)
```

- Expectativa 9: Se obtiene una cadena con la informacion de las funcionalidades correctamente formateada
``` ruby
      expect(@funcionalidad.to_s).to eq("Funcionalidad:\nIdentificacion: 12345678\nBeneficio: 0.009036144578313253\nBienestar: 1.2905376344086021\nProductividad: 1\n")
```

# Representacion de los Datos de una datos - datos::Datos

## Atributos de la clase Datos

- Expectativa 10: Tiene una clase para representar Datos
``` ruby
      expect(@datos).not_to be(nil)
```

- Expectativa 11: Tiene un atributo para la identificacion la datos
``` ruby
      expect(@datos.identificacion).to eq("Granja 1212")
```

- Expectativa 12: Tiene un atributo para el nombre de la datos
``` ruby
      expect(@datos.nombre).to eq("Pepito")
```

- Expectativa 13: Tiene un atributo para el tipo de la datos
``` ruby
      expect(@datos.tipo).to eq("avícola")
```

- Expectativa 14: Tiene un atributo para la descripcion de la datos
``` ruby
      expect(@datos.descripcion).to eq("Granja alta")
```

- Expectativa 15: Se obtiene una cadena con la informacion del animal correctamente formateada
``` ruby
      expect(@datos.to_s).to eq("Identificación: Granja 1212, Nombre: Pepito, Tipo: avícola, Descripción: Granja alta")
```
## Herencia de la clase Datos

- Expectativa 16: Se espera que una instancia de la clase Datos sea un Datos
``` ruby
      expect(@datos.is_a? Granja::Datos).to eq(true)
```

- Expectativa 17: Se espera que una instancia de la clase Datos sea un objeto (Object)
``` ruby
      expect(@datos.is_a? Object).to eq(true)
```

- Expectativa 18: Se espera que una instancia de la clase Datos sea un objeto basico (BasicObject)
``` ruby
      expect(@datos.is_a? BasicObject).to eq(true)
```

- Expectativa 19: No se espera que una instancia de la clase Datos sea una cadena (String)
``` ruby
      expect(@datos.is_a? String).to eq(false)
```

- Expectativa 20: No se espera que una instancia de la clase Datos sea un numero (Numeric)
``` ruby
      expect(@datos.is_a? Numeric).to eq(false)
```