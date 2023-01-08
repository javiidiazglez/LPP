# frozen_string_literal: true

require_relative "aparcamiento/version"
require_relative "aparcamiento/datos"
require_relative "aparcamiento/vehiculo"

module Aparcamiento
  module Funcionalidades
    COMPLETO = :aparcamiento_completo
    LIBRE = :plazas_libres

    def self.mostrar_estado_aparcamiento(plazas)
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
    #module_function :mostrar_estado_aparcamiento

    def self.reserva_minusvalidos(datos, plazas_min)
      ratio = datos.count / 40.0
      
      if (plazas_min >= ratio)
        return "Cumple con reserva plazas minuválidos"
      else
        return "No cumple con reserva plazas minuválidos"
      end
    end

    def self.libre_minusvalidos(datos)
      contador = 0
      datos.plazas.each_with_index do |plazas, indice|
        if  datos.plazas[indice][0] >= 5 && datos.plazas[indice][1] >= 5 && datos.plazas[indice][2] >= 5 && datos.plazas_ocupadaslibres[indice] == 'ocupado'
          contador += 1
        end
      end
      contador
    end

    def self.vehiculos_estacionados(datos)
      datos.vehiculo.length
    end

  end
end
