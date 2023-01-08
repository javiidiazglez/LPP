module Aparcamiento  
  class DSLProveedor
    attr_reader :id, :aparcamiento, :estado, :reserva_minusvalidos, :libre_minusvalidos, :vehiculos_estacionados
    def initialize(id)
      # id
      if id.is_a? Integer
        @id = id
      else
        "Error: tipo de id incorrecto"
      end
      # aparcamiento
      @aparcamiento = []
  
      # estado, reserva_minusvalidos, libre_minusvalidos, vehiculos_estacionados
      @estado = []
      @reserva_minusvalidos = []
      @libre_minusvalidos = []
      @vehiculos_estacionados = []

      #instance_eval &block
      yield self
    end

    def anadir_aparcamiento(datos)
      if datos.is_a? Array
        if datos.length >= 1 
          datos.each{|dat| aparcamiento.push(dat)}
          return "Aparcamientos añadidos #{datos.collect{|dat| dat.nombre}} al proveedor con id: #{id}"
        else datos.length == 0
          "Error: no se puede añadir un array vacío"
        end
      elsif datos.is_a? Datos
        aparcamiento.push(datos)
        return "Aparcamiento añadido #{datos.nombre} al proveedor con id: #{id}"
      else
        "Error: tipo de aparcamiento introducido incorrecto"
      end
    end

    def aparcar(vehiculo, nombre, posicion)
      if vehiculo.is_a?(Vehiculo) && nombre.is_a?(String) && posicion.is_a?(Integer)
        if aparcamiento.select{|datos| datos.libres > 0 if datos.nombre == nombre } != [] 
          aparcamiento.each{|datos| datos.aparcar(vehiculo, posicion) if datos.nombre == nombre}
          return "El Vehiculo con id #{vehiculo.id} ha sido aparcado en el aparcamiento llamado #{nombre} en el sitio número #{posicion}"
        else
          return "El proveedor no tiene ningún aparcamiento con un puesto libre"
        end
      else
        "Error: tipo de vehiculo introducido incorrecto"
      end
    end

    def get_estado()
      aparcamiento.each{|datos| @estado.push(Aparcamiento::Funcionalidades::estado(datos.libres))}
      return @estado
    end

    def get_reserva_minusvalidos(numero)
      aparcamiento.each{|datos| @reserva_minusvalidos.push(Aparcamiento::Funcionalidades::reserva_minusvalidos(datos, numero))}
      return @reserva_minusvalidos
    end

    def get_libre_minusvalidos()
      aparcamiento.each{|datos| @libre_minusvalidos.push(Aparcamiento::Funcionalidades::libre_minusvalidos(datos))}
      return @libre_minusvalidos
    end

    def get_vehiculos_estacionados()
      aparcamiento.each{|datos| @vehiculos_estacionados.push(Aparcamiento::Funcionalidades::vehiculos_estacionados(datos))}
      return @vehiculos_estacionados
    end

    def to_s()
      return "Proveedor con id: #{id} y aparcamientos: #{aparcamiento.collect{|datos| datos.nombre}} con estado: #{get_estado}, con reserva minusvalidos: #{get_reserva_minusvalidos(1)}, con libre minusvalidos: #{get_libre_minusvalidos}, con vehiculos estacionados: #{get_vehiculos_estacionados}"
    end
  end
end