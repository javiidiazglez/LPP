class Funcion
    attr_accessor :condicion, :cuidados, :reproduccion
	
	def initialize (condicion, cuidados, reproduccion)
		@condicion =  condicion
		@cuidados = cuidados
		@reproduccion = reproduccion
	end
end
