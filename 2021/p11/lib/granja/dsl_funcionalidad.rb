module Granja
  class DSLFuncionalidad
		
    # @param identificacion [String]
    # @param &block [block]
    def initialize(identificacion, &block)
      @identificacion = identificacion
      @beneficio
      @bienestar
      @productividad
    
      if block_given?  
        if block.arity == 1
          yield self
        else
          instance_eval(&block) 
        end
      end
    end

		# Metodo que formatea los datos de una granja
    # @return [String] Retorna los datos formateados
    def to_s
      salida = "Funcionalidad:\n"
      salida << "Identificacion: #{@identificacion}\n"
      salida << "Beneficio: #{@beneficio}\n"
      salida << "Bienestar: #{@bienestar}\n"
      salida << "Productividad: #{@productividad}\n"
  
      salida
    end

		# Metodo que cargar los beneficios
    # @param granja [Object]
    def beneficio(granja)
      @beneficio = Granja::Funcion::set_beneficio_neto(granja)
    end

		# Metodo que cargar el bienestar
    # @param granja [Object]
    # @param opciones [hash]
    def bienestar(granja, opciones = {})        	
      @bienestar = Granja::Funcion::set_bienestar_animal(granja, opciones[:condiciones])
    end

		# Metodo que cargar la productividad
    # @param granja [Object]
    # @param opciones [hash]
		def productividad(granja, opciones = {})
			@productividad = Granja::Funcion::set_indicador_productividad(granja, opciones[:condiciones])
	  end
  end
end
