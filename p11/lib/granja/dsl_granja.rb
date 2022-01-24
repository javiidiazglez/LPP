module Granja
	class DSLGranja
		attr_reader :identificacion, :datos, :ejemplares

		# @param identificacion [String]
		# @param &block [block]
		def initialize(identificacion, &block)
				@identificacion = identificacion
				@datos
				@ejemplares = []
				
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
				output = "DSLGranja: #{@datos.to_s}\n\n"
				
				@ejemplares.each_with_index do |ejemplar, index|
					output << "#{index + 1}) #{ejemplar.to_s}\n"
				end
				
				output
		end
		
		# Metodo que cargar los datos
		# @param nombre [String]
		# @param opciones [hash]
		def datos(nombre, opciones = {})
				@datos = Granja::Datos.new(@identificacion, nombre, opciones[:tipo], opciones[:descripcion])
		end
		
		# Metodo que carga los ejemplares
		# @param id [Number]
		# @param opciones [hash]
		def ejemplar(id, opciones = {})
				ejemplar = Granja::Animal.new(id, opciones[:edad], opciones[:peso], opciones[:precio_compra], opciones[:precio_venta])	
				@ejemplares << ejemplar
		end
	end
end
