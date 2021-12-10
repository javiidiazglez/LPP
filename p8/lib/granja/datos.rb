# Clase datos , Plantilla para representar datos
# con sus respectivo nombre e información sobre datos
# @author José Javier Díaz González

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