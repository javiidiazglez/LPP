# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #10. Programación Funcional.
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación RDoc.

## Funcionalidad para calcular el bienestar animal y unas condiciones de vida

- Expectativa 1: Existe la media del peso y la edad de los animales con condicion (CAMPO ABIERTO)
``` ruby
      expect(Granja::Funcion::set_BienestarAnimal(@granja_1, Granja::Funcion::CAMPO_ABIERTO)).to eq(59.090909090909086)
      expect(Granja::Funcion::set_BienestarAnimal(@granja_2, Granja::Funcion::CAMPO_ABIERTO)).to eq(89.44279595015577)
      expect(Granja::Funcion::set_BienestarAnimal(@granja_3, Granja::Funcion::CAMPO_ABIERTO)).to eq(59.74031392279947)
```

- Expectativa 2: Existe la media del peso y la edad de los animales con condicion (JAULAS)
``` ruby
      expect(Granja::Funcion::set_BienestarAnimal(@granja_1, Granja::Funcion::JAULAS)).to eq(29.545454545454543)
      expect(Granja::Funcion::set_BienestarAnimal(@granja_2, Granja::Funcion::JAULAS)).to eq(44.721397975077885)
      expect(Granja::Funcion::set_BienestarAnimal(@granja_3, Granja::Funcion::JAULAS)).to eq(29.870156961399736)
```

## Funcionalidad para calcular el beneficio neto de una granja

- Expectativa 3: Existe función del precio de venta con destino (SACRIFICIO)
``` ruby
      expect(Granja::Funcion::set_BeneficioNeto(@granja_1)).to eq(3.25)
```

- Expectativa 4: Existe función del precio de venta con destino (HUEVOS)
``` ruby
      expect(Granja::Funcion::set_BeneficioNeto(@granja_2)).to eq(30.25)
```

## Funcionalidad para calcular el indicador de productividad

- Expectativa 5: Existe una funcionalidad para calcular el índice de productividad = 1
``` ruby
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_1, Granja::Funcion::CAMPO_ABIERTO)).to eq(1)
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_1, Granja::Funcion::JAULAS)).to eq(1)
```

- Expectativa 6: Existe una funcionalidad para calcular el índice de productividad = 2
``` ruby
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_2, Granja::Funcion::CAMPO_ABIERTO)).to eq(2)
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_2, Granja::Funcion::JAULAS)).to eq(2) 
```

- Expectativa 7: Existe una funcionalidad para calcular el índice de productividad = 3
``` ruby
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_3, Granja::Funcion::CAMPO_ABIERTO)).to eq(3)
      expect(Granja::Funcion::set_IndicadorProductividad(@granja_3, Granja::Funcion::JAULAS)).to eq(3)
```

## Cooperativas Conjuntos de Granjas

- Expectativa 8: Existe una granja con máximo indicador de productividad
``` ruby
      expect(@cooperativa.max_by{ |n| Granja::Funcion::set_IndicadorProductividad(n[0], n[1])}).to eq([@granja_2, Granja::Funcion::JAULAS])
```

- Expectativa 9: Existe un incremento del precio de venta de las granjas
``` ruby
      expect(@conjunto_granja.collect { |n| n.precio_venta + @operacion}).to eq([145.0, 135.0, 155.0])
```