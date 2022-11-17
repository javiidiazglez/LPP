# frozen_string_literal: true

require_relative "aparcamiento/version"
require_relative "aparcamiento/datos"
require_relative "aparcamiento/vehiculo"

module Aparcamiento
  module Funcionalidades
    COMPLETO = :aparcamiento_completo
    LIBRE = :plazas_libres

    def mostrar_estado_aparcamiento(plazas)
      if plazas.is_a? Datos
        if plazas.numero_plazas_libres == 0 
          "#{COMPLETO}"
        else
          total = plazas.numero_plazas_libres
          "#{LIBRE}: " + "#{total}"
        end
      else
        "Error, tipo de plazas incorrecto"
      end
    end
    module_function :mostrar_estado_aparcamiento
  end
end
