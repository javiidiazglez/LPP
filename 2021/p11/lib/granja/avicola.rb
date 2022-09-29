module Granja

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
      "Tipo de aves: #{@tipo_aves}, Destino de los animales: #{@destino}, Numero de aves (granja): #{@numeros_aves}, Precio unitario: #{@precio_compra}, Precio venta unitario: #{@precio_venta}, Información: #{@informacion}, Vector granja (0): #{@vector_granja[0].to_s}, Vector granja (1): #{@vector_granja[1].to_s}"
    end
  end
end
