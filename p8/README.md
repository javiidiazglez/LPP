# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #8. - Gema Ruby - POO - Herencia
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación rdoc o yard.

## Bundler

- Herramienta Rspec instalada
- Creado gema: `gem install bundler`
- Ejecutado comando: `bundle gem granja`

## Guard

- Añadido guard a la gema .gemspec 
- Instalado Guard a través de Bundle: `./setup`
- Generado fichero Guardfile: `bundle exec guard init`
- Ejecutado Guardfile: `bundle exec guard`

## Desarrollo Dirigido por Pruebas
- Añadido la clase Granja, con su versión, y pasa la prueba
- Añadido 4 requires: animales, aves, funcion y datos

### Animales
#### Atributos de la clase Animal

- Añadido la clase animales: `animales.rb`
- Añadido la representación de los animales: `animales_spec.rb` y **pasa correctamente las pruebas**
- Añadido un atributo para identificar al animales y **pasa correctamente las pruebas**
- Añadido un atributo con la edad del animal en días y **pasa correctamente las pruebas**
- Añadido un atributo con el sexo del animal y **pasa correctamente las pruebas**
- Añadido un atributo con el peso del animal en gramos y **pasa correctamente las pruebas**
- Añadido una cadena con la información del animal correctamente formateada y **pasa correctamente las pruebas**

#### Herencia de la clase Animal

- Añadido una instancia que se espera de la clase Animal sea un Animal y **pasa correctamente las pruebas**
- Añadido una instancia que se espera de la clase Animal sea un objeto (Object) y **pasa correctamente las pruebas**
- Añadido una instancia que se espera de la clase Animal sea un objeto básico (BasicObject) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase Animal sea una cadena (String) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase Animal sea un número (Numeric) y **pasa correctamente las pruebas**

#### Comparable clase Animal
- Añadido una instancia que espera Animal 1 < Animal 2 (4000 < 5000) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera Animal 1 > Animal 2 (4000 > 5000)y **pasa correctamente las pruebas**
- Añadido una instancia que se espera Animal 1 == Animal 2 (4000 == 5000) y **pasa correctamente las pruebas**
- Añadido una instancia que se espera Animal 1 <= Animal 2 - (4000 <= 5000) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera Animal 1 >= Animal 2 - (4000 >= 5000) y **pasa correctamente las pruebas**

#### Contar clase Animal
- Añadido un contador del número de objetos que se instancia de la clase Animal y **pasa correctamente las pruebas**

### Aves
#### Atributos de la clase Ave

- Añadido la clase aves: `aves.rb`
- Añadido una clase para la representar de los aves: `aves_spec.rb` y **pasa correctamente las pruebas**
- Añadido un atributo para el tipo de pico y **pasa correctamente las pruebas**
- Añadido un atributo para el tipo de las patas y **pasa correctamente las pruebas**
- Añadido un atributo para su tipo de movilidad y **pasa correctamente las pruebas**
- Añadido una cadena con la información del aves correctamente formateada y **pasa correctamente las pruebas**

#### Herencia de la clase Ave

- Añadido una instancia que se espera de la clase Ave sea un Ave y **pasa correctamente las pruebas**
- Añadido una instancia que se espera de la clase Ave sea un Ave sea un Animal y **pasa correctamente las pruebas**
- Añadido una instancia que se espera de la clase Ave sea un objeto (Object) y **pasa correctamente las pruebas**
- Añadido una instancia que se espera de la clase Ave sea un objeto básico (BasicObject) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase Ave sea una cadena (String) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase Ave sea un número (Numeric) y **pasa correctamente las pruebas**

#### Comparable clase Ave
- Añadido una instancia que se espera Ave 1 < Ave 2 (1000 < 2000) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera Ave 1 > Ave 2 (1000 > 2000) y **pasa correctamente las pruebas**
- Añadido una instancia que espera Ave 1 == Ave 2 (1000 == 2000) y **pasa correctamente las pruebas**
- Añadido una instancia que se espera Ave 1 <= Ave 2 - (1000 <= 2000) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera Ave 1 >= Ave 2 - (4100 >= 2000) y **pasa correctamente las pruebas**

### Datos
#### Atributos de la clase Datos
- Añadido la clase datos: `datos.rb`
- Añadido el almacenamiento de los datos de la granja: `datos_spec.rb`y **pasa correctamente las pruebas**
- Añadido atributo para la identificacion de la granja y **pasa correctamente las pruebas**
- Añadido atributo para el nombre de la granja y **pasa correctamente las pruebas**
- Añadido atributo para el tipo de la granja (avícola o ganadera) y **pasa correctamente las pruebas**
- Añadido atributo para el descripción de la granja y **pasa correctamente las pruebas**
- Añadido una cadena con la información del animal correctamente formateada y **pasa correctamente las pruebas**

#### Herencia de la clase Datos

- Añadido una instancia que se espera una instancia de la clase Datos sea un Datos y **pasa correctamente las pruebas**
- Añadido una instancia que se espera una instancia de la clase Datos sea un objeto (Object) y **pasa correctamente las pruebas**
- Añadido una instancia que se espera una instancia de la clase Datos sea un objeto básico (BasicObject) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera instancia de la clase Datos sea una cadena (String) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera una instancia de la clase Datos sea un número (Numeric) y **pasa correctamente las pruebas**

### Función
- Añadido el módulo: `funcion.rb`
- Añadido un módulo para el almacenamiento de las funcionalidades: `funcion_spec.rb` y **pasa correctamente las pruebas**
- Añadido una constante que existe para representar las condiciones de vida y **pasa correctamente las pruebas**
- Añadido atributo para los cuidados de los animales y **pasa correctamente las pruebas**
- Añadido atributo para la reproducción de los animales y **pasa correctamente las pruebas**

#### Herencia de la clase Función
- Añadido un objeto que se espera de la clase Module y **pasa correctamente las pruebas**
- Añadido un objeto (Object) que se espera y **pasa correctamente las pruebas**
- Añadido un objeto básico (BasicObject) que se espera y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase que representa una cadena (String) y **pasa correctamente las pruebas**
- Añadido una instancia que no se espera de la clase que representa un número (Numeric) y **pasa correctamente las pruebas**

## Generación automática de documentación
- Añadido rdoc en /doc/

# Granja

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/granja`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'granja'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install granja

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/granja. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/granja/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Granja project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/granja/blob/master/CODE_OF_CONDUCT.md).
