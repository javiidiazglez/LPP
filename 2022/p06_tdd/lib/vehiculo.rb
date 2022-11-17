# Programación Orientada a objetos. - Desarrollo Dirigido por Pruebas (TDD)

class Vehiculo
  attr_accessor :num_identificacion, :fabricante, :año, :modelo, :millas, :precio, :propietarios

  # Un constructor que inicializa los atributos de la clase.
	def initialize (num_identificacion, fabricante, año, modelo, millas, precio, propietarios)
    @num_identificacion =  num_identificacion
		@fabricante = fabricante
    @año = año
		@modelo = modelo
    @millas = millas
    @precio = precio
    @propietarios = propietarios
    
    if (año >= 1900 && año <= 2022)
      @año = año
    else
      @año = "Año no válido"
    end
	end
  
  # Devuelve la representación de cadena del objeto.
  def to_s
    "#{self.class}: #{@num_identificacion},#{@fabricante},#{@año},#{@modelo},#{@millas},#{@precio},#{@propietarios}"
  end

  # Convierte la distancia de una unidad a otra.
  # @param cantidad_combustible la cantidad de combustible que desea convertir
  # @param unidad_medida 
  def conversor_distancia (cantidad_combustible, unidad_medida) 
    if (cantidad_combustible > -1)
      if (unidad_medida == "galon_imperial") 
       (4.54609 * cantidad_combustible) * @millas # 1 galon imperial = 4.54609 litros
      elsif(unidad_medida == "galon_estadounidense")
        (3.785 * cantidad_combustible) * @millas # 1 galón estadounidense = 3.785 litros
      elsif (unidad_medida == "litros")
        cantidad_combustible * @millas
      else
        "Unidad de medida no válido [imperial/estadounidense/litros]"
      end
    else
      "Error en el parámetro [1...+infinito]"
    end
  end
end

