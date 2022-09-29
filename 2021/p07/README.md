# Lenguaje y Paradigma de Programación

José Javier Díaz González

Práctica de Laboratorio #7. 
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación rdoc o yard.

## Bundler

- Herramienta Rspec instalada
- Creado gema: gem install bundler
- Ejecutado comando: bundle gem granja

## Guard

- Añadido guard a la gema .gemspec 
- Instalado Guard a través de Bundle: ./setup
- Generado fichero Guardfile: bundle exec guard init
- Ejecutado Guardfile: bundle exec guard

## Desarrollo Dirigido por Pruebas
- Añadido la clase Granja, con su versión, y pasa la prueba
- Añadido 2 requires: funcion y datos
- Añadido el numero version y pasa la prueba correctamente: granja_spec.rb

### Función
- Añadido la clase funcion: funcion.rb
- Añadido el almacenamiento de las funcionalidades: funcion_spec.rb
- Pasa la pruebas del almacenamiento de las funcionaliades correctamente
- Añadido atributo para las condiciones de vida de los animales y pasa correctamente las pruebas
- Añadido atributo para los cuidados de los animales y pasa correctamente las pruebas
- Añadido atributo para la reproducción de los animales y pasa correctamente las pruebas

### Datos 
- Añadido la clase datos: datos.rb
- Añadido el almacenamiento de los datos de la granja: datos_spec.rb
- Pasa la pruebas del almacenamiento de las funcionaliades correctamente
- Añadido atributo para la identificacion de la granja y pasa correctamente las pruebas
- Añadido atributo para el nombre de la granja y pasa correctamente las pruebas
- Añadido atributo para el tipo de la granja y pasa correctamente las pruebas
- Añadido atributo para el descripcion de la granja y pasa correctamente las pruebas

## Generación automática de documentación
- Añadido rdoc en /doc/

# Granja

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/granja`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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
