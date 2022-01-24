module Granja

  class Ave < Animal
    #Módulo comparable que se incluye para hacer uso de sus utilidades
    include Comparable

    # @return [String] tipo del pico
    # @return [String] tipo de patas
    # @return [String] tipo de movilidad
    attr_accessor :pico, :patas, :movilidad

    # Método para inicializar el objeto
    # @param pico patas movilidad
    def initialize (pico, patas, movilidad)
      @pico =  pico
      @patas = patas
      @movilidad = movilidad
    end

    #Método <=> para Mixin de Comparable 
    #@param other, recibe el edad para compararse
    def <=> other
      @edad <=> other.edad
    end

    # Metodo == para comparar objetos con igual atributos
    #@param other, recibe peso para igualar
    def == (other)
      @peso == other.peso && @sexo == other.sexo && @edad == other.edad
      rescue
      false
    end
    
    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "Tipo de pico: #{@pico}, Tipo de patas: #{@patas}, Tipo de movilidad: #{@movilidad}"
    end
  end
end