module Aparcamiento

  descripcion = :cubierto, :aire_libre, :mixto
  tipo = :autobuses, :bicicletas, :coches, :motos

  class Datos
    attr_reader :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas, :conjunto_plazas

    def initialize(accesibilidad, seguridad, id, nombre, descripcion, tipo, conjunto_libreuocupadas, conjunto_plazas)     
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
      # conjunto_libreuocupadas
      if conjunto_libreuocupadas.is_a? Array
        @conjunto_libreuocupadas = conjunto_libreuocupadas
      else
        @conjunto_libreuocupadas = "Error: Tipo de conjunto libre-ocupado no válido"
      end
      # conjunto_plazas
      if conjunto_plazas.is_a? Array
        @conjunto_plazas = conjunto_plazas
      else
        @conjunto_plazas = "Error: Tipo de conjunto plazas no válido"
      end
    end

    def numero_plazas
      if conjunto_plazas.is_a?Array
        @conjunto_plazas.length
      else
        "Error, tipo de plazas incorrecto"
      end
    end

    def numero_plazas_libres
      if conjunto_plazas.is_a?Array
        if conjunto_libreuocupadas.length == numero_plazas
          total = 0
          for i in conjunto_libreuocupadas
            if i.to_s == "libre"
                total = total + 1 
            end
          end
          return total
        else
          "No tiene el mismo tamaño que plazas"
        end
      else
        "Error, tipo de plazas libres incorrectos"
      end
   end

    def to_s
      "#{self.class}: => (#{@accesibilidad}) - (#{@seguridad}) - (#{@id}) - (#{@nombre}) - (#{@descripcion}) - (#{@tipo}) - (#{@conjunto_libreuocupadas}) - (#{@conjunto_plazas})"
    end
  end
end
