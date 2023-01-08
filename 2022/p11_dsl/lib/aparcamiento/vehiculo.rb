module Aparcamiento
  class Vehiculo
    include Comparable, Enumerable

    attr_reader :id, :altura, :ancho, :largo, :peso

    def initialize(id, altura, ancho, largo, peso)
      if defined?(@@numero_vehiculos)
        @@numero_vehiculos += 1
      else
        @@numero_vehiculos = 1
      end
     
      def self.count
        @@numero_vehiculos
      end
     
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
      # altura
      if altura.is_a? Float
        if altura > 0
          @altura = altura.round(2)
        else
          "Error: la altura no puede ser negativa o 0"
        end
      elsif altura.is_a? Integer
        if altura > 0
          @altura = altura.to_f
        else
          "Error: la altura no puede ser negativa o 0"
        end
      else
        "Error: tipo de altura incorrecta"
      end

      # ancho
      if ancho.is_a? Float
        if ancho > 0
          @ancho = ancho.round(2)
        else
          "Error: el ancho no puede ser negativo o 0"
        end
      elsif ancho.is_a? Integer
        if ancho > 0
          @ancho = ancho.to_f
        else
          "Error: el ancho no puede ser negativo o 0"
        end
      else
        "Error: tipo de ancho incorrecta"
      end

      # largo
      if largo.is_a? Float
        if largo > 0
          @largo = largo.round(2)
        else
          "Error: el largo no puede ser negativo o 0"
        end
      elsif largo.is_a? Integer
        if largo > 0
          @largo = largo.to_f
        else
           "Error: el largo no puede ser negativo o 0"
        end
      else
         "Error: tipo de largo incorrecta"
      end
      # peso
      if peso.is_a? Float
        if peso > 0
          @peso = peso.round(3)
        else
           "Error: el peso no puede ser negativo o 0"
        end
      elsif peso.is_a? Integer
        if peso > 0
          @peso = peso.to_f
        else
           "Error: el peso no puede ser negativo o 0"
        end
      else
        "Error: tipo de peso incorrecta"
      end
    end

    def to_s
      return "Vehiculo{id: #{id}, altura: #{altura}m, ancho: #{ancho}m, largo: #{largo}m, peso: #{peso}t}"
    end

    def <=> (other)
      return nil unless other.is_a? Vehiculo
      volumen <=> other.volumen
    end

    def volumen ()
      largo * ancho * altura
    end

    def each
      yield @id
      yield @altura
      yield @ancho
      yield @largo
      yield @peso
    end

  end
  class Motor < Vehiculo
    attr_reader :n_ruedas, :n_plazas, :cilindrada, :velocidad
    def initialize(id, altura, ancho, largo, peso, n_ruedas, n_plazas, cilindrada, velocidad)
      super(id, altura, ancho, largo, peso)
      # n_ruedas
      if n_ruedas.is_a? Integer
        if n_ruedas > 1
          @n_ruedas = n_ruedas
        else
          "Error: el n_ruedas no puede ser negativo y tiene que ser mayor a 1"
        end
      else
        "Error: tipo de n_ruedas incorrecto"
      end
      # n_plazas
      if n_plazas.is_a? Integer
        if n_plazas > 1
          @n_plazas = n_plazas
        else
          "Error: el n_plazas no puede ser negativo y tiene que ser mayor a 1"
        end
      else
        "Error: tipo de n_plazas incorrecto"
      end
      # cilindrada
      if cilindrada.is_a? Integer
        if cilindrada >= 50
          @cilindrada = cilindrada
        else
          "Error: la cilindrada no puede ser negativa y tiene que ser mayor o igual a 50"
        end
      else
        "Error: tipo de cilindrada incorrecto"
      end
      # velocidad
      if velocidad.is_a? Integer
        if velocidad >= 30
          @velocidad = velocidad
        else
            "Error: la velocidad no puede ser negativa y tiene que ser mayor o igual a 30"
        end
      else
          "Error: tipo de velocidad incorrecto"
      end
    end
    
    def to_s
      return "Vehiculo a motor{id: #{id}, altura: #{altura}m, ancho: #{ancho}m, largo: #{largo}m, peso: #{peso}t, n_ruedas: #{n_ruedas}, n_plazas: #{n_plazas}, cilindrada: #{cilindrada}cc, velocidad: #{velocidad}km/h}"
    end

    def <=> (other)
      return nil unless other.is_a? Motor
      @n_plazas <=> other.n_plazas
    end
  end
end
