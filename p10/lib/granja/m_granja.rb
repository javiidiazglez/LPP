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
    # @return [Array] Almacenar array
    attr_reader :tipo_aves, :destino, :numeros_aves, :precio_compra, :precio_venta, :informacion, :vector_granja, :almacenar
    attr_writer :almacenar
  
    # Método para inicializar el objeto
    # @param tipo_aves destino numeros_aves precio_compra,precio_venta, informacion, vector_granja, almacenar
    def initialize (tipo_aves, destino, numeros_aves, precio_compra, precio_venta, informacion, vector_granja, almacenar)  
      @tipo_aves =  tipo_aves
      @destino = destino
      @numeros_aves = numeros_aves
      @precio_compra = precio_compra
      @precio_venta = precio_venta
      @informacion = informacion
      @vector_granja = vector_granja
      @almacenar = almacenar
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
      "#{@tipo_aves},#{@destino},#{@numeros_aves},#{@precio_compra},#{@precio_venta},#{@informacion},#{@vector_granja[0].to_s}, #{@vector_granja[1].to_s}"
    end
  end

  module Funcion 
    
    #Defino una condición con un string = campo abierto
    CONDICION = "campo abierto"
    @condicion = ""

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
    JAULAS = "jaulas"
    CAMPO_ABIERTO = "campo_abierto"
      
    # Setter de def self.reproduccion
    # @return set_reproduccion (valor, granja)
    def self.set_cuidado(valor, granja)
      return granja.collect { |i| i + valor }
    end

    # Setter de def self.reproduccion
    # @return set_reproduccion (animales)
    def self.set_reproduccion(granja)
      return granja.select{ |i| (i / 30) > 24 }
    end

    # Procedimiento para gestionar animales (jaulas, campo abierto)
    def self.set_GestionAnimales (p1, p2, granja)
      if (p1 == "jaulas")
        granja.almacenar = "jaulas"
        @condiciones = "jaulas"
        "automatica"
        else if (p1 == "campo_abierto")
          granja.almacenar = "campo_abierto"
          @condiciones = "campo_abierto"
          if (p2 == 1)
            "libre"
          else
            "cobertizo"
          end
        end
      end
    end

    # Setter de def self.set_BienestarAnimal
    # @return set_BienestarAnimal(granja, condicion)
    def self.set_BienestarAnimal(granja, condicion)  # [300,400,500,1000]   [4000,5000,6000,7000] = (400/5000)*100 = 8   / 4 
      
      maximo = granja.vector_granja.collect { |n| (n.edad.to_f / n.peso.to_f)}.max
      media = (granja.vector_granja.collect { |n| (n.edad.to_f / n.peso.to_f)}.sum / granja.vector_granja.count.to_f)

      if (condicion == "campo_abierto")
        return (media * 100) / maximo 
      else
        return (media * 50) / maximo 
      end
    end 

    # Setter de def self.set_BeneficioNeto
    # @return set_BeneficioNeto(granja)
    def self.set_BeneficioNeto(granja)  
      if (granja.destino == "sacrificio") # media = sum [n.peso.to_f] / granja.vector_granja.count.to_f = [4000,5000,6000,7000] / 4 granjas
        granja.vector_granja.collect { |n| n.peso.to_f}.sum / granja.vector_granja.count.to_f / granja.precio_venta
      else
        granja.vector_granja.collect { |n| n.edad.to_f}.sum / granja.vector_granja.count.to_f / granja.precio_venta
      end
    end

    # Setter de def self.set_IndicadorProductividad
    # @return set_IndicadorProductividad(granja, condicion)
    def self.set_IndicadorProductividad(granja, condicion)  
      bienestar = set_BienestarAnimal(granja, condicion)
      beneficio = set_BeneficioNeto(granja)
      if (bienestar <= 20)
        bienestar = 1
        else if (bienestar >= 21 && bienestar <= 79)
          bienestar = 2
          else if (bienestar >= 80)
            bienestar = 3
          end
        end
      end
      
      if (beneficio < 10)
        beneficio = 1
        else if (beneficio >= 10 && beneficio <= 50)
          beneficio = 2
          else if (beneficio >= 80)
            beneficio = 3
          end
        end
      end
      ((bienestar + beneficio) / 2).round(0)  # media
    end

    # Método para mostrar el objeto
    # @return cadena s
    def to_s
      "#{@condicion},#{@cuidados},#{@reproduccion}"
    end
    
  end
end