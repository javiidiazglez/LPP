# Programación estructurada o Modular

# Calcula el coste total de un vehículo.
# dias: número de días que se alquila el coche
# precio_diario: El precio diario del vehículo.
# tipo: el tipo de vehículo (turismos, moto)
def coste_total_vehiculo(dias, precio_diario, tipo)
  if (tipo == "turismos")
    dias * precio_diario
  elsif (tipo == "motos")
    dias * precio_diario
  else
    "No es un Vehiculo"
  end
end

# Calcula el coste descuento del alquiler de un vehículo.
# coste_total: El costo total del vehículo
# porcentaje: el porcentaje del descuento
# tipo: el tipo de vehículo (turismos, moto)
def coste_descuento_vehiculo(coste_total, porcentaje, tipo) #costetotal, porcentaje
  if (tipo == "turismos")
    (1 - (porcentaje / 100)) * coste_total
  elsif (tipo == "motos")
    (1 - (porcentaje / 100)) * coste_total
  else
    "No es un Vehiculo"
  end
end

# Calcula el total de kilómetros recorridos por un vehículo.
# alquiler: la fecha en que se alquiló el coche
# entrega: la fecha en que se devolvió el coche
# tipo: el tipo de vehículo (turismos, moto)
def total_km_vehiculo(alquiler, entrega, tipo)
  if (tipo == "turismos")
    alquiler - entrega
  elsif (tipo == "motos")
    alquiler - entrega
  else
    "No es un Vehiculo"
  end
end