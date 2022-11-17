RSpec.describe Aparcamiento do
  before :all do
    # :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas, :conjunto_plazas
    @parking_1 = Aparcamiento::Datos.new(5.2, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ["libre", "ocupado", "ocupado", "ocupado", "ocupado"], [[3.6, 2.1, 2.0], [4.2, 2.7, 1.2]])
    @parking_2 = Aparcamiento::Datos.new(6.1, 5, 2, "AparcamientoPablo", :mixto, :autobuses, ["ocupado", "ocupado", "ocupado"], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2], [6.2, 5.7, 6.2]])
    @parking_3 = Aparcamiento::Datos.new(6, 5.5, 2, "AparcamientoDani", :cubierto, :bicicletas, ["libre", "libre"], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2]])
  end
  context "Interfaz de las funcionalidades - Aparcamiento::Funciones  " do
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