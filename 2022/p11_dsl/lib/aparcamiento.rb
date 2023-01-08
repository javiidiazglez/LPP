# frozen_string_literal: true

require_relative "aparcamiento/version"
require_relative "aparcamiento/datos"
require_relative "aparcamiento/vehiculo"
require_relative "aparcamiento/dslproveedor"


module Aparcamiento
  module Funcionalidades
    COMPLETO = "completo"
    LIBRE = "plazas libres"

    def self.estado(plazas)
      if plazas.is_a? Integer 
        if plazas >= 1
          return "#{LIBRE}" + ": #{plazas}"
        elsif plazas == 0
          return "#{COMPLETO}"
        else
          return "ERROR: Número de plazas no puede ser negativo"
        end
      else
        "Error: tipo de plazas incorrecto"
      end
    end

    def self.reserva_minusvalidos(datos, plazas_min)
      ratio = datos.count / 40.0
      
      if (plazas_min >= ratio)
        return "Cumple con reserva plazas minuválidos"
      else
        return "No cumple con reserva plazas minuválidos"
      end
    end

    def self.libre_minusvalidos(datos)
      datos.plazas.select.with_index{|plazas, indice| datos.plazas[indice][0] >= 5 && datos.plazas[indice][1] >= 5 && datos.plazas[indice][2] >= 5 && datos.ocupada[indice] == false}.count
    end

    def self.vehiculos_estacionados(datos)
      datos.vehiculos.length
    end
  end
end
