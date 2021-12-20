# Module m_granja , Plantilla para representar toda la granja
# con sus respectivo nombre e información sobre granja
# @author José Javier Díaz González

module Granja

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
      "#{@identificacion},#{@edad},#{@sexo},#{@peso}"
    end
  end

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
    
    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "#{@pico},#{@patas},#{@movilidad}"
    end
  end

  class Datos

    # @return [Numeric] identificación de la granja
    # @return [String] nombre de la granja
    # @return [String] tipo de la granja
    # @return [String] descripcion de la granja
    attr_accessor :identificacion, :nombre, :tipo, :descripcion
    
    # Método para inicializar el objeto
    # @param identificacion nombre tipo descripcion
    def initialize (identificacion, nombre, tipo, descripcion)
      @identificacion =  identificacion
      @nombre = nombre
      @tipo = tipo
      @descripcion = descripcion
    end

    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "#{@identificacion},#{@nombre},#{@tipo},#{@descripcion}"
    end
  end

  class Avicola < Datos
  
    include Enumerable
  
    # @return [String] tipo de aves: pollos, pavos, patos, o gansos.
    # @return [String] destino del animal (huevos, sacrificio)
    # @return [Numeric] numeros de aves
    # @return [Numeric] precio de compra de las aves
    # @return [Numeric] precio de venta de las aves
    # @return [String] información relativa
    # @return [Array] Pollo 1 y Pollo 2
    attr_accessor :tipo_aves, :destino, :numeros_aves, :precio_compra, :precio_venta, :informacion, :aves_granja
  
    # Método para inicializar el objeto
    # @param tipo_aves destino numeros_aves precio_compra,precio_venta, informacion, aves_granja
    def initialize (tipo_aves, destino, numeros_aves, precio_compra, precio_venta, informacion, aves_granja)  
      @tipo_aves =  tipo_aves
      @destino = destino
      @numeros_aves = numeros_aves
      @precio_compra = precio_compra
      @precio_venta = precio_venta
      @informacion = informacion
      @aves_granja = aves_granja
    end
    
    # Se crea la funcion each con los 3 campos Numerics
    def each
      yield @numeros_aves
      yield @precio_compra
      yield @precio_venta
    end

    # Método <=> para Mixin de Comparable 
    # @param other, recibe el numero_aves para compararse
    def <=> other
      @pollo1 <=> other.numeros_aves
    end

    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "#{@tipo_aves},#{@destino},#{@numeros_aves},#{@precio_compra},#{@precio_venta},#{@informacion},#{@aves_granja[0].to_s}, #{@aves_granja[1].to_s}"
    end
  end

  module Funcion 
    
  #defino una condición con un string 
  CONDICION = "campo abierto"

	# Setter de self.cuidado
	# @return cuidado del animal
	def self.cuidado
		"cuidado del animal"
	end

	# Setter de self.	def self.reproduccion
	# @return reproduccion favorable
	def self.reproduccion
		"reproduccion favorable"
	end

  # @return [Constante] - Jaulas
  # @return [Constante] - Campo_abierto
  JAULAS = "Condiciones favorables"
  CAMPO_ABIERTO = "Circulan libremente"
    
    # Setter de def self.reproduccion
  # @return set_reproduccion (avalor, lista)
  def self.set_cuidado(valor, lista)
    return lista.collect { |i| i + valor }
  end

  # Setter de def self.reproduccion
  # @return set_reproduccion (animales)
  def self.set_reproduccion(animales)
    return animales.select{ |i| (i / 30) > 24 }
  end

  # Método para mostrar el objeto
  # @return cadena s
  def to_s
    "#{@condicion},#{@cuidados},#{@reproduccion}"
  end

  end

end