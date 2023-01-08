module Aparcamiento
  class Vehiculo
    include Comparable, Enumerable

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

      if defined?(@@numero_vehiculos)
        @@numero_vehiculos += 1
      else
        @@numero_vehiculos = 1
      end
      
      def self.count
        @@numero_vehiculos
      end
    end

    def to_s
      "#{self.class}: => (#{@id}) - (#{@alto}) - (#{@ancho}) - (#{@largo}) - (#{@peso})"
    end

    def <=> (other)
      return nil unless other.is_a? Vehiculo

      volumen <=> other.volumen
    end

    def volumen ()
      largo * ancho * alto
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

    def <=> (other)
      return nil unless other.is_a? Motor

      @plazas <=> other.plazas
    end
  end
end
