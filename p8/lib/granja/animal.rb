# Clase animal , Plantilla para representar un animal
# con sus respectivo nombre e información sobre animales
# @author José Javier Díaz González

class Animal

  #Módulo comparable que se incluye para hacer uso de sus utilidades
  include Comparable

  # @return [Numeric] identificación del animal
  # @return [Numeric] edad del animal
  # @return [String] sexo del animal
  # @return [Numeric] peso del animal
  attr_accessor :identificacion, :edad, :sexo, :peso
  attr_writer :edad

  # Método para inicializar el objeto
  # @param identificacion edad sexo peso
  def initialize (identificacion, edad, sexo, peso)
    @identificacion =  identificacion
    @edad = edad
    @sexo = sexo
    @peso = peso

    if defined?(@@count)
      @@count += 1
    else
      @@count = 1
    end

  end

  # Metodo de clase
  # Getter de atributo count
  # @return count
  def selfcount
    @@count
  end
  
  # Método <=> para Mixin de Comparable 
  # @param other, recibe el peso para compararse
  def <=> other
    @peso <=> other.peso
  end

  # Método para mostrar el objeto
  # @return cadena s
  def to_s
    "#{@identificacion},#{@edad},#{@sexo},#{@peso}"
  end

end