module Aparcamiento

  descripcion = :cubierto, :aire_libre, :mixto
  tipo = :autobuses, :bicicletas, :coches, :motos

  class Datos
    include Enumerable, Comparable
    attr_reader :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas_ocupadaslibres, :plazas, :distancia, :n_plazas_minusvalido, :precio, :vehiculo

    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo)     
      # accesibilidad
      if accesibilidad.is_a? Integer
        if accesibilidad >= 1 && accesibilidad <= 5
          @accesibilidad = accesibilidad
        else
          @accesibilidad = "Accesibilidad no valido [1..5]"
        end
      else
        @accesibilidad = "Error: Tipo de accesibilidad no válido"
      end
      # seguridad
      if seguridad.is_a? Integer
        if seguridad >= 1 && seguridad <= 10
          @seguridad = seguridad
        else
          @seguridad = "Seguridad no valido [1..10]"
        end
      else
        @seguridad = "Error: Tipo de seguridad no válido"
      end
      # Identificación
      if id.is_a? Integer
        @id = id
      else
        @id = "Error: Tipo de identificación no válido"
      end
      # nombre
      if nombre.is_a? String
        @nombre = nombre
      else
        @nombre = "Error: Tipo de nombre no válido"
      end
      # descripcion
      if descripcion == :cubierto || descripcion == :aire_libre || descripcion == :mixto
        @descripcion = descripcion
      else
        @descripcion = "Error: Tipo de descripcion no válido [cubierto/aire_libre/mixto]"
      end
      # tipo
      if tipo == :autobuses || tipo == :bicicletas || tipo == :coches || tipo == :motos
        @tipo = tipo
      else
        @tipo = "Error: Tipo no válido [cubierto/aire_libre/mixto]"
      end
      # plazas_ocupadaslibres
      if plazas_ocupadaslibres.is_a? Array
        @plazas_ocupadaslibres = plazas_ocupadaslibres
      else
        @plazas_ocupadaslibres = "Error: Tipo de conjunto libre-ocupado no válido"
      end
      # plazas
      if plazas.is_a? Array
        if plazas.length != 0
          @plazas = plazas
        else
          @plazas = "Error: Número de plazas incorrecto"
        end
      else
        @plazas = "Error: Tipo de plazas no válido"
      end
      # distancia
      if distancia.is_a? Float
        if distancia >= 0.0
          @distancia = distancia
        else
          @distancia = "Error: Distancia no valido, deben ser numeros positivos"
        end
      else
        @distancia = "Error: Tipo de distancia no válido"
      end
      # n_plazas_minusvalido
      if n_plazas_minusvalido.is_a? Integer
        if n_plazas_minusvalido >= 0
          @n_plazas_minusvalido = n_plazas_minusvalido
        else
          @n_plazas_minusvalido = "Error: Plazas minusvalido no valido, deben ser numeros positivos"
        end
      else
        @n_plazas_minusvalido = "Error: Tipo de numero plazas minusvalido no válido"
      end
      # precio
      if precio.is_a? Float
        if precio >= 0.0
          @precio = precio
        else
          @precio = "Error: Precio no valido, deben ser numeros positivos"
        end
      else
        @precio = "Error: Tipo de precio no válido"
      end
      # vehiculo
      if vehiculo.is_a? Array
        @vehiculo = vehiculo
      else
        @vehiculo = "Error: Tipo de conjunto vehiculo no válido"
      end
    end

    def numero_plazas
      if plazas.is_a?Array
        @plazas.length
      else
        "Error, tipo de plazas incorrecto"
      end
    end

    def numero_plazas_libres
      if plazas.is_a?Array
        if plazas_ocupadaslibres.length == numero_plazas
          plazas_ocupadaslibres.count('libre')
        else
          "No tiene el mismo tamaño que plazas"
        end
      else
        "Error, tipo de plazas libres incorrectos"
      end
   end

    def aparcar(vehiculo_objecto, posicion)
      if numero_plazas_libres != 0
        if plazas_ocupadaslibres[posicion] == 'ocupada'
          if vehiculo_objecto.alto <= plazas[posicion][0] && vehiculo_objecto.largo <= plazas[posicion][1] && vehiculo_objecto.ancho <= plazas[posicion][2]  
            plazas_ocupadaslibres[posicion] == 'libre'
            vehiculo.append(vehiculo_objecto)
            return "Vehículo: #{vehiculo_objecto.id} aparcado en posición: #{posicion}"
          else
            return "El vehículo no entra en el estacionamiento seleccionado"
          end
        else
          return "Aparcamiento seleccionado ocupado"
        end
      else
        return "No se pueden aparcar coches, Aparcamiento lleno"
      end
    end
 
    def duracion(entrada, salida)
      array_entrada = entrada.split(":")
      array_salida = salida.split(":")

      segundos_entrada = hora_a_segundos(array_entrada)
      segundos_salida = hora_a_segundos(array_salida)

      resultado_segundos = segundos_salida - segundos_entrada

      resultado_horas = resultado_segundos / 3600
      resultado_minutos = (resultado_horas).round(2) % 1 * 60
      
      return  "#{Integer(resultado_horas)} : #{Integer(resultado_minutos)}"
    end
    def hora_a_segundos(array)
      array[0] = Float(array[0]) * 3600
      array[1] = Float(array[1]) * 60

      array[0] + array[1]
    end

    def importe(duracion)
      array_duracion = duracion.split(":")

      array_duracion[0] = Float(array_duracion[0]) * 60

      minutos = array_duracion[0] + Float(array_duracion[1])

      (minutos * precio).round(2)
    end

    # índice de sostenibilidad
    def indice_sostenibilidad
      if (distancia <= 20.0 && precio > 0.50)
        1
      elsif ((distancia > 20.0 && distancia < 40.0) && (precio <= 0.50 && precio >= 0.10))
        2
      elsif (distancia >= 40.0 && (precio >= 0 && precio < 0.10))
        3
      else
        nil
      end
    end

    # método comparable 
    def each
      for index in (0...@plazas.length)  
        yield @plazas[index]
      end
    end
  
    # Método Comparable segun su sostenibilidad
    def <=> (other)
      return nil unless other.is_a? Datos
      indice_sostenibilidad() <=> other.indice_sostenibilidad()
    end
    def to_s
      "#{self.class}: => #{@accesibilidad}, #{@seguridad}, #{@id}, #{@nombre}, #{@descripcion}, #{@tipo}, #{@plazas_ocupadaslibres}, #{@distancia}, #{@n_plazas_minusvalido}, #{@precio}, #{@vehiculo[0]}"
    end
  end

  class Aeropuerto < Datos
    attr_reader :numero_plantas
    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo, numero_plantas)     
      super(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo)
      # numero_plantas
      if numero_plantas.is_a? Numeric
        if numero_plantas >= 0
          @numero_plantas = numero_plantas
        else
          @numero_plantas = "Error: Numero de plantas no valido, deben ser numeros positivos"
        end
      else
        @numero_plantas = "Error: Tipo de numero deplantas no válido"
      end
     
      def to_s
        super.to_s << " - (#{@numero_plantas})"
      end
    end
  end

  class Estacion < Datos
    attr_reader :numero_plazas
    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo, numero_plazas)     
      super(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo)
      # numero_plazas
      if numero_plazas.is_a? Numeric
        if numero_plazas >= 0
          @numero_plazas = numero_plazas
        else
          @numero_plazas = "Error: Numero de plazas no valido, deben ser numeros positivos"
        end
      else
        @numero_plazas = "Error: Tipo de numero de plazas no válido"
      end
      
      def to_s
        super.to_s << " - (#{@numero_plazas})"
      end
    end
  end
end
