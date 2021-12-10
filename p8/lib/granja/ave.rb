# Clase ave , Plantilla para representar un ave
# con sus respectivo nombre e información sobre aves
# @author José Javier Díaz González

# Clase Ave que hereda de Animal
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

  # Método <=> para Mixin de Comparable 
  # @param other, recibe el edad para compararse
  def <=> other
    @edad <=> other.edad
  end
  
  # Método para mostrar el objeto
  # @return cadena s
  def to_s
    "#{@pico},#{@patas},#{@movilidad}"
  end

end