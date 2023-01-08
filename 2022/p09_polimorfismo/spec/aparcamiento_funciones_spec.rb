RSpec.describe Aparcamiento do
  before :all do'libre'
    # :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupados, :conjunto_plazas
    @parking_1 = Aparcamiento::Datos.new(5.2, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ['libre', 'ocupado', 'ocupado', 'ocupado', 'ocupado'], [[3.6, 2.1, 2.0], [4.2, 2.7, 1.2]], 100.0, 3, 1000.32, @conjunto_vehiculo)
    @parking_2 = Aparcamiento::Datos.new(6.1, 5, 2, "AparcamientoPablo", :mixto, :autobuses, ['ocupado', 'ocupado', 'ocupado'], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2], [6.2, 5.7, 6.2]], 100.0, 3, 1000.32, @conjunto_vehiculo)
    @parking_3 = Aparcamiento::Datos.new(6, 5.5, 2, "AparcamientoDani", :cubierto, :bicicletas, ['libre', 'libre'], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2]], 100.0, 3, 1000.32, @conjunto_vehiculo)
  
    @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
    @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
    @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
    @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
    
    @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
    @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
    @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

    @datos_1 = Aparcamiento::Datos.new(5, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ['libre'], [[3.0,4.0,5.0]], 1.2, 1, 1.0, @conjunto_vehiculos_1)
    @datos_2 = Aparcamiento::Datos.new(4, 10, 2, "AparcamientoJavi", :cubierto, :coches, ['libre','ocupado'], [[3.0,4.0,5.0], [5.0,6.0,7.0]], 2.5, 3, 1.25, @conjunto_vehiculos_2)
    @datos_3 = Aparcamiento::Datos.new(6, 10, 3, "AparcamientoBajo", :aire_libre, :bicicletas, ['libre','ocupado','ocupado'],[[3.0,4.0,5.0], [5.0,6.0,7.0], [8.0,9.0,10.0]], 1.0, 4, 2.0, @conjunto_vehiculos_3)
  end
  context "Interfaz de las funcionalidades - Aparcamiento::Funciones " do
    it "Tiene una clase para almacenar las funcionalidades" do
      expect(Aparcamiento::Funcionalidades).not_to eq(nil)
      expect(Aparcamiento::Funcionalidades).not_to be_nil
      expect(Aparcamiento::Funcionalidades).not_to be(nil)
    end
    it "No se espera una instancia de Funcionalidades" do
      expect(Aparcamiento::Funcionalidades.is_a?(Aparcamiento::Funcionalidades)).to eq(false)
      expect(@parking_1).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
      expect(@parking_2).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
      expect(@parking_3).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
    end
    it "Existe una constante para representar si el aparcamiento está completo" do
      expect(Aparcamiento::Funcionalidades::COMPLETO).not_to be_nil
      expect(Aparcamiento::Funcionalidades::COMPLETO).to eq(:aparcamiento_completo)
    end
    it "Existe una constante para representar si el aparcamiento tiene plazas libres" do
      expect(Aparcamiento::Funcionalidades::LIBRE).not_to be_nil
      expect(Aparcamiento::Funcionalidades::LIBRE).to eq(:plazas_libres)
    end
    it "Se espera que el modulo Funcionalidades tengan un respond_to" do
      expect(Aparcamiento::Funcionalidades).to respond_to(:mostrar_estado_aparcamiento)
      expect(Aparcamiento::Funcionalidades).not_to respond_to(:estado_aparcamiento)
    end
    it "Existe una funcion para mostrar el estado de un aparcamiento (completo, plazas libres)" do
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_1)).not_to be_nil
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_2)).to eq("aparcamiento_completo")
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_3)).to eq("plazas_libres: 2")
    end
    it "Se espera que exista una funcionalidad para determinar si un aparcamiento cumple con el porcentaje de reserva de plazas de minuválidos" do
      expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_1, 1)).to eq "Cumple con reserva plazas minuválidos"
      expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_2, 1)).to eq "Cumple con reserva plazas minuválidos"
      expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_2, 0)).to eq "No cumple con reserva plazas minuválidos"
      expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_3, 4)).to eq "Cumple con reserva plazas minuválidos"
    end
    it "Se espera que exista una funcionalidad para determinar el número de plazas para minusválidos libres de un aparcamiento" do
      expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_1)).to eq(0)
      expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_2)).to eq(1)
      expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_3)).to eq(2)
    end
    it "Se espera que exista una funcionalidad para determinar el número de vehículos estacionados en un aparcamiento" do
      expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_1)).to eq(3)
      expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_2)).to eq(4)
      expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_3)).to eq(2)
    end
  end
  context "Prevención de Errores - Aparcamiento::Funcionalidades" do 
    it "Prevención de errores en las funcionalidades" do
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(-1)).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(1)).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento([1,1,1])).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento("Aparcamiento libre")).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(@parking_1)).to eq("plazas_libres: No tiene el mismo tamaño que plazas")
    end
  end
  context "Herencia del módulo Aparcamiento" do
    it "Se espera que los datos de un aparcamiento tenga una clase" do
      expect(@parking_1).not_to be(nil)
      expect(@parking_2).not_to eq(nil)
      expect(@parking_3).not_to be_nil
      expect((@parking_1).class).to eq(Aparcamiento::Datos)
      expect((@parking_2).class).to eq(Aparcamiento::Datos)
      expect((@parking_3).class).to eq(Aparcamiento::Datos)
    end
    it "Se espera que un aparcamiento sea un objeto de la clase (Module)" do
      expect(Aparcamiento::Funcionalidades.is_a?Module).to eq(true)
      expect(Aparcamiento::Funcionalidades.class).to eq(Module)
      expect((@parking_1).is_a?Object).to eq(true)
      expect((@parking_2).is_a?Object).to eq(true)
      expect((@parking_3).is_a?Object).to eq(true)
    end
    it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
      expect(Aparcamiento::Funcionalidades.is_a?Object).to eq(true)
      expect((@parking_1).is_a?Object).to eq(true)
      expect((@parking_2).is_a?Object).to eq(true)
      expect((@parking_3).is_a?Object).to eq(true)
      expect(@parking_1).to be_an(Object)
    end
    it "Se espera que un aparcamiento sea un objeto básico (BasicObject)" do
      expect(Aparcamiento::Funcionalidades.is_a?BasicObject).to eq(true)
      expect((@parking_1).is_a?BasicObject).to eq(true)
      expect((@parking_2).is_a?BasicObject).to eq(true)
      expect((@parking_3).is_a?BasicObject).to eq(true)
      expect(@parking_1).to be_an(BasicObject)
    end
    it "No se espera que un aparcamiento sea un objeto sea una cadena (Class)" do
      expect(Aparcamiento::Funcionalidades.is_a?Class).to eq(false)
      expect((@parking_1).is_a?Class).to eq(false)
      expect((@parking_2).is_a?Class).to eq(false)
      expect((@parking_3).is_a?Class).to eq(false)
      expect(@parking_1).not_to be_an(Class)
    end
    it "No se espera que un aparcamiento sea un objeto sea una cadena (String)" do
      expect(Aparcamiento::Funcionalidades.is_a?String).to eq(false)
      expect((@parking_1).is_a?String).to eq(false)
      expect((@parking_2).is_a?String).to eq(false)
      expect((@parking_3).is_a?String).to eq(false)
      expect(@parking_1).not_to be_an(String)
    end
    it "No se espera que un aparcamiento sea un objeto sea un número (Numeric)" do
      expect(Aparcamiento::Funcionalidades.is_a?Numeric).to eq(false)
      expect((@parking_1).is_a?Numeric).to eq(false)
      expect((@parking_2).is_a?Numeric).to eq(false)
      expect((@parking_3).is_a?Numeric).to eq(false)
      expect(@parking_1).not_to be_an(Numeric)
    end
    it "No se espera que un aparcamiento sea un vehículo" do
      expect(Aparcamiento::Funcionalidades.is_a?Aparcamiento::Vehiculo).to eq(false)
      expect(@parking_1).not_to be_an(Aparcamiento::Vehiculo)
      expect((@parking_1).is_a?Aparcamiento::Vehiculo).to eq(false)
      expect((@parking_2).is_a?Aparcamiento::Vehiculo).to eq(false)
      expect((@parking_3).is_a?Aparcamiento::Vehiculo).to eq(false)
    end
    it "No se espera que un aparcamiento sea un vehículo a motor" do
      expect(Aparcamiento::Funcionalidades.is_a?Aparcamiento::Motor).to eq(false)
      expect(@parking_1).not_to be_an(Aparcamiento::Motor)
      expect((@parking_1).is_a?Aparcamiento::Motor).to eq(false)
      expect((@parking_2).is_a?Aparcamiento::Motor).to eq(false)
      expect((@parking_3).is_a?Aparcamiento::Motor).to eq(false)
    end
  end
end