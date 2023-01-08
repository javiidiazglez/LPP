module Aparcamiento

  descripcion = :cubierto, :aire_libre, :mixto
  tipo = :autobuses, :bicicletas, :coches, :motos

  class Datos
    include Enumerable, Comparable
    attr_reader :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas, :ocupada, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos

    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas, ocupada, distancia_centro, n_plazas_minusvalidos, precio, vehiculos)
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
      # ocupada
      if ocupada.is_a? Array
        @ocupada = ocupada
      else
        @ocupada = "Error: Tipo de conjunto libre-ocupado no válido"
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
      # distancia_centro
      if distancia_centro.is_a? Float
        if distancia_centro >= 0.0
          @distancia_centro = distancia_centro
        else
          @distancia_centro = "Error: Distancia no valido, deben ser numeros positivos"
        end
      else
        @distancia_centro = "Error: Tipo de distancia_centro no válido"
      end
      # n_plazas_minusvalidos
      if n_plazas_minusvalidos.is_a? Integer
        if n_plazas_minusvalidos >= 0
          @n_plazas_minusvalidos = n_plazas_minusvalidos
        else
          @n_plazas_minusvalidos = "Error: Plazas minusvalido no valido, deben ser numeros positivos"
        end
      else
        @n_plazas_minusvalidos = "Error: Tipo de numero plazas minusvalido no válido"
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
      # vehiculos
      if vehiculos.is_a? Array
        @vehiculos = vehiculos
      else
        @vehiculos = "Error: Tipo de conjunto vehiculos no válido"
      end
    end

    def n_plazas
      @plazas.length
    end

    def libres
      ocupada.count(false)
   end

   def aparcar(vehiculo, posicion)
    if libres != 0
      if posicion <= n_plazas
        if ocupada[posicion] == false
          if vehiculo.altura <= plazas[posicion][0] && vehiculo.largo <= plazas[posicion][1] && vehiculo.ancho <= plazas[posicion][2]  
            ocupada[posicion] = true
            vehiculos.append(vehiculo)
            return "Vehículo #{vehiculo.id} aparcado en #{posicion}"
          else
            return "El vehículo no entra en el estacionamiento seleccionado"
          end
        else
          return "Aparcamiento seleccionado ocupado"
        end
      else
        return "Error: posición incorrecta"
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
      if (distancia_centro <= 20.0 && precio > 0.50)
        1
      elsif ((distancia_centro > 20.0 && distancia_centro < 40.0) && (precio <= 0.50 && precio >= 0.10))
        2
      elsif (distancia_centro >= 40.0 && (precio >= 0 && precio < 0.10))
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
      return "Datos{accesibilidad: #{accesibilidad}, seguridad: #{seguridad}, id: #{id}, nombre: #{nombre}, descripcion: #{descripcion}, tipo: #{tipo}, plazas: #{plazas}, ocupada: #{ocupada}}"
    end
  end

  class Aeropuerto < Datos
    attr_reader :plantas, :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas, :ocupada, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos
    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas, ocupada, distancia_centro, n_plazas_minusvalidos, precio, vehiculos, plantas)
      super(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas, ocupada, distancia_centro, n_plazas_minusvalidos, precio, vehiculos)    
      # plantas
      if plantas.is_a? Integer
        if plantas >= 1
          @plantas = plantas
        else
          @plantas = "Error: el número de plantas tiene que ser mayor o igual a 1"
        end
      else
        @plantas = "Error: Tipo de numero de plantas no válido"
      end
     
      def to_s
        return "Aeropuerto{accesibilidad: #{accesibilidad}, seguridad: #{seguridad}, id: #{id}, nombre: #{nombre}, descripcion: #{descripcion}, tipo: #{tipo}, plazas: #{plazas}, ocupada: #{ocupada}, distancia_centro: #{distancia_centro}, n_plazas_minusvalidos: #{n_plazas_minusvalidos}, precio: #{precio}, plantas: #{plantas}}"
      end
    end
  end

  class Estacion < Datos
    attr_reader :larga_estancia, :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas, :ocupada, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos
    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas, ocupada, distancia_centro, n_plazas_minusvalidos, precio, vehiculos, larga_estancia)
      super(accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas, ocupada, distancia_centro, n_plazas_minusvalidos, precio, vehiculos)    
      # larga_estancia
      if larga_estancia.is_a? Integer
        if larga_estancia >= 0
          @larga_estancia = larga_estancia
        else
          @larga_estancia = "Error: Numero de plazas no valido, deben ser numeros positivos"
        end
      else
        @larga_estancia = "Error: Tipo de numero de plazas no válido"
      end
      
      def to_s
        return "Estación{accesibilidad: #{accesibilidad}, seguridad: #{seguridad}, id: #{id}, nombre: #{nombre}, descripcion: #{descripcion}, tipo: #{tipo}, plazas: #{plazas}, ocupada: #{ocupada}, distancia_centro: #{distancia_centro}, n_plazas_minusvalidos: #{n_plazas_minusvalidos}, precio: #{precio}, larga estancia: #{larga_estancia}}"
      end
    end
  end
end
