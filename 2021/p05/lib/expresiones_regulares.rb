# Representar expresiones regulares: Concatenacion, alternativa y cierre de Kleen.

class Expresiones_regulares

  attr_reader :x

  def initialize(x)
		@x = x
	end

  def to_s 
    return "#{@x}"
  end

  # Concatenacion
  def concatenacion(param)
    Expresiones_regulares.new("#{@x}.#{param}")
  end

  # Alternativa
  def alternativa(param)
    Expresiones_regulares.new("#{@x}|#{param}")
  end

  # Cierre de Kleen
  def cierre_kleen
    Expresiones_regulares.new("#{@x}*")
  end

end