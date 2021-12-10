# Module Funcion , Plantilla para representar una funcion
# con sus respectivo nombre e información sobre funcion
# @author José Javier Díaz González

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

	# Método para mostrar el objeto
	# @return cadena s
	def to_s
		"#{@condicion},#{@cuidSados},#{@reproduccion}"
	end

end