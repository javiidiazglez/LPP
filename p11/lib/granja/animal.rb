module Granja

  class Animal

    #Módulo comparable que se incluye para hacer uso de sus utilidades
    include Comparable
  
    # @return [Numeric] identificación del animal
    # @return [Numeric] edad del animal
    # @return [String] sexo del animal
    # @return [Numeric] peso del animal
    attr_accessor :identificacion, :edad, :peso, :precio_compra, :precio_venta
    attr_writer :edad
  
    # Método para inicializar el objeto
    # @param identificacion edad sexo peso
    def initialize (identificacion, edad, peso, precio_compra, precio_venta)
      @identificacion =  identificacion
      @edad = edad
      @peso = peso
      @precio_compra = precio_compra
      @precio_venta = precio_venta
  
      if defined?(@@count)
        @@count += 1
      else
        @@count = 1
      end
    end
  
    # Metodo de clase
    # Getter de atributo count
    # @return count
    def get_count
      @@count
    end
    
    # Método <=> para Mixin de Comparable 
    # @param other, recibe la edad para compararse
    def <=> (other)
      @edad <=> other.edad
    end

    # Sobrecarga / de Comparable
    # @param other, recibe la edad para compararse
    def / (other)
      @edad / other
    end

    # Sobrecarga + de Comparable 
    # @param other, recibe la edad para compararse
    def + (other)
      @edad + other
    end

    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "Identificación: #{@identificacion}, Edad: #{@edad} días, Peso: #{@peso} gramos, Precio de compra: #{@precio_compra}, Precio de venta: #{@precio_venta}"
    end
  end
end