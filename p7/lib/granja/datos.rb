class Datos
    attr_accessor :identificacion, :nombre, :tipo, :descripcion
	
	def initialize (identificacion, nombre, tipo, descripcion)
		@identificacion =  identificacion
		@nombre = nombre
		@tipo = tipo
		@descripcion = descripcion
	end
end

