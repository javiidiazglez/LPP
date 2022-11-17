# Herencia - Aparcamiento

[![Ruby](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml/badge.svg)](https://github.com/ULL-ESIT-LPP-2223/gema-jose-javier-diaz-glez-alu0101128894/actions/workflows/main.yml)

## Práctica 8. Programación Orientada a Objetos. Herencia
- Desarrollo Dirigido por Pruebas - TDD
- Herramienta RSpec.
- Herramienta de gestión de dependencias Bundler. 
- Herramienta de comprobación continua Guard.
- Herramientas de generación de documentación rdoc

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
- ### Versión de Aparcamiento
  ```rb
  module Aparcamiento
    VERSION = "2.1.0"
  end
  ```
- ### Clase Vehiculo en module Aparcamiento
  ```rb
  module Aparcamiento
    class Vehiculo
      include Comparable
      attr_reader :id, :alto, :ancho, :largo, :peso
      def initialize(id, alto, ancho, largo, peso)     
        # identificacion
        if id.is_a? Numeric
          if id >= 0
            @id = id
          else
            @id = "Identificación no valido, deben ser numeros positivos"
          end
        else
          @id = "Error: Tipo de identificacion no válido"
        end
        # alto
        if alto.is_a? Numeric
          if alto >= 0
            @alto = alto
          else
            @alto = "Alto no valido, deben ser numeros positivos"
          end
        else
          @alto = "Error: Tipo de alto no válido"
        end
        # ancho
        if ancho.is_a? Numeric
          if ancho >= 0
            @ancho = ancho
          else
            @ancho = "Ancho no valido, deben ser numeros positivos"
          end
        else
          @ancho = "Error: Tipo de ancho no válido"
        end
        # largo
        if largo.is_a? Numeric
          if largo >= 0
            @largo = largo
          else
            @largo = "Largo no valido, deben ser numeros positivos"
          end
        else
          @largo = "Error: Tipo de largo no válido"
        end
        # peso
        if peso.is_a? Numeric
          if peso >= 0
            @peso = peso
          else
            @peso = "Peso no valido, deben ser numeros positivos"
          end
        else
          @peso = "Error: Tipo de peso no válido"
        end
      end
      def to_s
        "#{self.class}: => (#{@id}) - (#{@alto}) - (#{@ancho}) - (#{@largo}) - (#{@peso})"
      end
    end
  end
  ```
- ### Expectativas de la Clase Vehiculo + Herencia
  ```rb
  RSpec.describe Aparcamiento do
  before :all do
    #id, alto, ancho, largo, peso
    @vehiculo_1 = Aparcamiento::Vehiculo.new(5, 5, 1, 10, 500)
    @vehiculo_2 = Aparcamiento::Vehiculo.new(10, 10, 2, 20, 1000)
    @vehiculo_3 = Aparcamiento::Vehiculo.new(10, 10, 2, 20, 1000)
    @vehiculo_error = Aparcamiento::Vehiculo.new(-1, "5", -1, "10", -500)
    # id, alto, ancho, largo, peso, plazas, ruedas, centimetro, velocidad
    @motor_1 = Aparcamiento::Motor.new(5, 5, 1, 10, 500, 100, 4, 200, 120)
    @motor_2 = Aparcamiento::Motor.new(6, 6, 2, 20, 600, 200, 5, 400, 240)
    @motor_3 = Aparcamiento::Motor.new(6, 6, 2, 20, 600, 200, 5, 400, 240)
    @motor_error = Aparcamiento::Motor.new(-5, -5, "1", -10, "500", -100, -4, "200", -120)
    @motor_error_2 = Aparcamiento::Motor.new(-5, -5, "1", -10, "500", -100, -4, "200", -120)
  end
  context "Atributos de la clase Vehículo" do
    it "Tiene una clase para representar vehículos" do
      expect(Aparcamiento::Vehiculo).not_to eq(nil)
      expect(Aparcamiento::Vehiculo).not_to be_nil
      expect(Aparcamiento::Vehiculo).not_to be(nil)
      expect(@vehiculo_1.class).to eq(Aparcamiento::Vehiculo)
    end
    it "Tiene un atributo para identificar al vehículo" do
      expect(@vehiculo_1.id).not_to be_nil
      expect(@vehiculo_1.id).to eq(5)
    end
    it "Tiene un atributo con la altura en metros" do
      expect(@vehiculo_1.alto).not_to be_nil
      expect(@vehiculo_1.alto).to eq(5)
    end
    it "Tiene un atributo con el ancho en metros" do
      expect(@vehiculo_1.ancho).not_to be_nil
      expect(@vehiculo_1.ancho).to eq(1)
    end
    it "Tiene un atributo con el largo en metros" do
      expect(@vehiculo_1.largo).not_to be_nil
      expect(@vehiculo_1.largo).to eq(10)
    end
    it "Tiene un atributo con el peso en toneladas" do
      expect(@vehiculo_1.peso).not_to be_nil
      expect(@vehiculo_1.peso).to eq(500)
    end
    it "Se espera que los atributos de la clase Vehiculo tengan un respond_to" do
      expect(@vehiculo_1).to respond_to(:id, :alto, :ancho, :largo, :peso)
      expect(@vehiculo_1).not_to respond_to(:estado)
    end
    it "Se obtiene una cadena con la información del vehículo correctamente formateada" do
      expect(@vehiculo_1.to_s).to eq("Aparcamiento::Vehiculo: => (5) - (5) - (1) - (10) - (500)")
    end
  end
  context "Herencia de la clase Vehículo" do
    it "Se espera que una instancia de la clase Vehículo sea un Vehículo" do
      expect(@vehiculo_1).to be_a_kind_of(Aparcamiento::Vehiculo)
      expect((@vehiculo_1).is_a?Aparcamiento::Vehiculo).to eq(true)
    end
    it "Se espera que una instancia de la clase Vehículo sea un objeto (Object)" do
      expect((@vehiculo_1).is_a?Object).to eq(true)
      expect(@vehiculo_1).to be_an(Object)
    end
    it "Se espera que una instancia de la clase Vehículo sea un objeto básico (BasicObject)" do
      expect((@vehiculo_1).is_a?BasicObject).to eq(true)
      expect(@vehiculo_1).to be_an(BasicObject)
    end
    it "Se espera que una instancia de la clase Motor sea una cadena (Class)" do
      expect(Aparcamiento::Vehiculo.is_a?Class).to eq(true)
      expect(Aparcamiento::Vehiculo.class).to eq(Class)
    end
    it "Se espera que una instancia de la clase Motor sea un objeto de la clase (Module)" do
      expect(Aparcamiento::Vehiculo.is_a?Module).to eq(true)
      expect(Aparcamiento::Vehiculo.class.superclass).to eq(Module)
      expect((@vehiculo_1).is_a?Object).to eq(true)
    end
    it "No se espera que una instancia de la clase Vehículo sea una cadena (String)" do
      expect((@vehiculo_1).is_a?String).to eq(false)
      expect(@vehiculo_1).not_to be_an(String)
    end
    it "No se espera que una instancia de la clase Vehículo sea un número (Numeric)" do
      expect((@vehiculo_1).is_a?Numeric).to eq(false)
      expect(@vehiculo_1).not_to be_an(Numeric)
    end
  end
  ```
- ### Expectativas de Prevención de errores de la clase Vehiculo
  ```rb
  it "Prevención de errores en la clase Vehiculo" do
    expect(@vehiculo_error.id).to eq("Identificación no valido, deben ser numeros positivos")
    expect(@vehiculo_error.alto).to eq("Error: Tipo de alto no válido")
    expect(@vehiculo_error.ancho).to eq("Ancho no valido, deben ser numeros positivos")
    expect(@vehiculo_error.largo).to eq("Error: Tipo de largo no válido")
    expect(@vehiculo_error.peso).to eq("Peso no valido, deben ser numeros positivos")
  end
  ```
- ### Clase Motor hereda de la clase Vehiculo
  ```rb
  class Motor < Vehiculo
    attr_reader :plazas, :ruedas, :centimetro, :velocidad
    def initialize(id, alto, ancho, largo, peso, plazas, ruedas, centimetro, velocidad)     
      super(id, alto, ancho, largo, peso)
      # plazas
      if plazas.is_a? Numeric
        if plazas >= 0
          @plazas = plazas
        else
          @plazas = "Plazas no valido, deben ser numeros positivos"
        end
      else
        @plazas = "Error: Tipo de plazas no válido"
      end
      # ruedas
      if ruedas.is_a? Numeric
        if ruedas >= 0
          @ruedas = ruedas
        else
          @ruedas = "Ruedas no valido, deben ser numeros positivos"
        end
      else
        @ruedas = "Error: Tipo de ruedas no válido"
      end
      # centimetro
      if centimetro.is_a? Numeric
        if centimetro >= 0
          @centimetro = centimetro
        else
          @centimetro = "Centimetro no valido, deben ser numeros positivos"
        end
      else
        @centimetro = "Error: Tipo de centimetro no válido"
      end
      # velocidad
      if velocidad.is_a? Numeric
        if velocidad >= 0
          @velocidad = velocidad
        else
          @velocidad = "Velocidad no valido, deben ser numeros positivos"
        end
      else
        @velocidad = "Error: Tipo de velocidad no válido"
      end
    end
    def to_s
      super.to_s << " - (#{@plazas}) - (#{@ruedas}) - (#{@centimetro}) - (#{@velocidad})"
    end
  end
  ```
- ### Expectativa de la Clase Motor + Herencia
  ```rb
  context "Atributos de la clase Motor" do
    it "Tiene una clase para representar vehículos de motor" do
      expect(Aparcamiento::Motor).not_to eq(nil)
      expect(Aparcamiento::Motor).not_to be_nil
      expect(Aparcamiento::Motor).not_to be(nil)
      expect(@motor_1.class).to eq(Aparcamiento::Motor)
    end
    it "Tiene un atributo para el número de ruedas" do
      expect(@motor_1.ruedas).not_to be_nil
      expect(@motor_1.ruedas).to eq(4)
    end
    it "Tiene un atributo para el número de plazas" do
      expect(@motor_1.plazas).not_to be_nil
      expect(@motor_1.plazas).to eq(100)
    end
    it "Tiene un atributo para la potencia del motor en centímetros cúbicos" do
      expect(@motor_1.centimetro).not_to be_nil
      expect(@motor_1.centimetro).to eq(200)
    end
    it "Tiene un atributo para la velocidad máxima en kilómetros por hora" do
      expect(@motor_1.velocidad).not_to be_nil
      expect(@motor_1.velocidad).to eq(120)
    end
    it "Se obtiene una cadena con la información del vehículo a motor correctamente formateada" do
      expect(@motor_1.to_s).to eq("Aparcamiento::Motor: => (5) - (5) - (1) - (10) - (500) - (100) - (4) - (200) - (120)")
    end
  end
  context "Herencia de la clase Motor" do
    it "Se espera que una instancia de la clase Motor sea un vehículo de motor" do
      expect(@motor_1).to be_a_kind_of(Aparcamiento::Motor)
      expect((@motor_1).is_a?Aparcamiento::Motor).to eq(true)
    end
    it "Se espera que una instancia de la clase Motor sea un Vehículo" do
      expect(@motor_1).to be_a_kind_of(Aparcamiento::Vehiculo)
      expect((@motor_1).is_a?Aparcamiento::Vehiculo).to eq(true)
    end
    it "Se espera que una instancia de la clase Motor sea un objeto (Object)" do
      expect(Aparcamiento::Motor.is_a?Object).to eq(true)
      expect((@motor_1).is_a?Object).to eq(true)
      expect(@motor_1).to be_an(Object)
    end
    it "Se espera que una instancia de la clase Motor sea un objeto básico (BasicObject)" do
      expect(Aparcamiento::Motor.is_a?BasicObject).to eq(true)
      expect((@motor_1).is_a?BasicObject).to eq(true)
      expect(@motor_1).to be_an(BasicObject)
    end
    it "Se espera que una instancia de la clase Motor sea una cadena (Class)" do
      expect(Aparcamiento::Motor.is_a?Class).to eq(true)
      expect(Aparcamiento::Motor.class).to eq(Class)
    end
    it "Se espera que una instancia de la clase Motor sea un objeto de la clase (Module)" do
      expect(Aparcamiento::Motor.is_a?Module).to eq(true)
      expect(Aparcamiento::Motor.class.superclass).to eq(Module)
      expect((@motor_1).is_a?Object).to eq(true)
    end
    it "No se espera que una instancia de la clase Motor sea una cadena (String)" do
      expect(Aparcamiento::Motor.is_a?String).to eq(false)
      expect((@motor_1).is_a?String).to eq(false)
      expect(@motor_1).not_to be_an(String)
    end
    it "No se espera que una instancia de la clase Motor sea un número (Numeric)" do
      expect(Aparcamiento::Motor.is_a?Numeric).to eq(false)
      expect((@motor_1).is_a?Numeric).to eq(false)
      expect(@motor_1).not_to be_an(Numeric)
    end
  end
  ```
- ### Expectativas de Prevención de errores de la clase Motor
  ```rb
  it "Prevención de errores en la clase Motor" do
    expect(@motor_error.id).to eq("Identificación no valido, deben ser numeros positivos")
    expect(@motor_error.alto).to eq("Alto no valido, deben ser numeros positivos")
    expect(@motor_error.ancho).to eq("Error: Tipo de ancho no válido")
    expect(@motor_error.largo).to eq("Largo no valido, deben ser numeros positivos")
    expect(@motor_error.peso).to eq("Error: Tipo de peso no válido")
    expect(@motor_error.plazas).to eq("Plazas no valido, deben ser numeros positivos")
    expect(@motor_error.ruedas).to eq("Ruedas no valido, deben ser numeros positivos")
    expect(@motor_error.centimetro).to eq("Error: Tipo de centimetro no válido")
    expect(@motor_error.velocidad).to eq("Velocidad no valido, deben ser numeros positivos")
  end
  ```
- ### Función contar numeros de objetos de la clase Vehiculo
  ```rb
  if defined?(@@numero_vehiculos)
    @@numero_vehiculos += 1
  else
    @@numero_vehiculos = 1
  end
  def self.count
    @@numero_vehiculos
  end
  ```
- ### Expectativa contar numeros de objetos de la clase Vehiculo
  ```rb
  it "Se ha de contar el número de objetos que se instancia de la clase Vehículo" do
    expect(@vehiculo_1.count).to eq(9)
    expect(@vehiculo_error.count).to eq(9)
    expect(@motor_1.count).to eq(9)
    expect(@motor_error.count).to eq(9)
  end
  it "Se ha de comparar vehículos por volumen y vehículos de motor por numero de plazas." do
    expect(@vehiculo_1.count).to eq(9)
    expect(@vehiculo_error.count).to eq(9)
    expect(@motor_1.count).to eq(9)
    expect(@motor_error.count).to eq(9)
  end
  ```
- ### Función Modulo Comparable de clase Vehiculo y clase Motor
  ```rb
  class Vehiculo
      def <=> other
      volumen <=> other.volumen
    end
    def volumen
      largo * ancho * alto
    end
  end
  class Motor < Vehiculo
    def <=> other
      @plazas <=> other.plazas
    end
  end
  ```
- ### Expectativa modulo Comparable de clase Vehiculo y clase Motor
  ```rb
  it "Se espera realizan comparaciones de vehiculo usando modulo comparable" do
    expect(@vehiculo_1 < @vehiculo_2).to eq(true) 
    expect(@vehiculo_1 > @vehiculo_2).to be(false)
    expect(@vehiculo_2 == @vehiculo_3).to be(true)
    expect(@vehiculo_2 <= @vehiculo_3).to be(true)
    expect(@vehiculo_2 >= @vehiculo_3).to be(true)
    expect(@vehiculo_1.between?(@vehiculo_1,@vehiculo_2)).to eq(true)
    expect(@vehiculo_1.between?(@vehiculo_2,@vehiculo_3)).to eq(false)
    expect(@vehiculo_2.between?(@vehiculo_2,@vehiculo_1)).to eq(false)
    expect(@vehiculo_2.between?(@vehiculo_3,@vehiculo_2)).to eq(true)
  end
  it "Se espera realizan comparaciones de vehiculo de motor usando modulo comparable" do
    expect(@motor_1 < @motor_2).to eq(true)
    expect(@motor_1 > @motor_2).to eq(false)
    expect(@motor_3 == @motor_2).to eq(true)
    expect(@motor_3 <= @motor_2).to eq(true)
    expect(@motor_3 >= @motor_2).to eq(true)      
    expect(@motor_1.between?(@motor_1,@motor_2)).to eq(true)
    expect(@motor_1.between?(@motor_2,@motor_1)).to eq(false)
    expect(@motor_2.between?(@motor_3,@motor_2)).to eq(true)
    expect(@motor_3.between?(@motor_1,@motor_3)).to eq(true)
  end
  ```
- ### Reutilización de datos.rb y el modulo de funcionalidades con sus dos spec correspondientes.

## Rdoc

Generado la documentación automatica en /doc/.