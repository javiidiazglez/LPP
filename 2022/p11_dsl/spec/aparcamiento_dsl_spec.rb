RSpec.describe Aparcamiento do
  before :all do
    @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
    @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
    @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
    @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
    @vehiculo_5 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
    @vehiculo_6 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)

    @conjunto_vehiculos_1 = [@vehiculo_1]
    @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
    @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]
    
    @datos_1 = Aparcamiento::Datos.new(1, 1, 55, "AparcamientoElDios", :cubierto, :autobuses, [[3.1,4.1,5.1]], [true], 1.2, 0, 1.0, @conjunto_vehiculos_1)
    @datos_2 = Aparcamiento::Datos.new(5, 10, 66, "AparcamientoJavi", :mixto, :bicicletas, [[3.1,4.1,5.2], [5.2,6.3,7.3]], [true, false], 2.5, 1, 1.25, @conjunto_vehiculos_1)
    @datos_3 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoPepe", :aire_libre, :coches, [[3.1,4.1,5.2], [5.2,6.3,7.3], [8.2,9.3,10.1]], [false, false, false], 1.0, 2, 2.0, [])
    @datos_4 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.1,4.1,5.2], [5.2,6.3,7.3], [8.2,9.3,10.1], [11.0,12.0,13.1]], [false, false, false, true], 0.0, 3, 1.0, @conjunto_vehiculos_3)
    @datos_5 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoSolar", :aire_libre, :motos, [[3.1,4.1,5.2], [5.2,6.3,7.3], [8.2,9.3,10.1], [11.0,12.0,13.1]], [false, false, false, false], 40.0, 3, 1.0, @conjunto_vehiculos_3)
  end
  context "DSLProveedor" do
    it "Se espera que exista una clase DSLProveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(Aparcamiento::DSLProveedor).not_to eq nil
      expect(Aparcamiento::DSLProveedor.is_a?Class).to eq(true)
      expect(Aparcamiento::DSLProveedor).to be_a(Class)

      expect(@proveedor_1.is_a? Aparcamiento::DSLProveedor).to eq true
      expect(@proveedor_2.is_a? Aparcamiento::DSLProveedor).to eq true
      expect(@proveedor_3.is_a? Aparcamiento::DSLProveedor).to eq true
    end
    it "Se espera que exista un atributo para idenficar al proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
      end
      expect(@proveedor_1.id).to eq 1
      expect(@proveedor_2.id).to eq 2
      expect(@proveedor_3.id).to eq 3
    end
    it "Se espera que exista un atributo para los aparcamientos del proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1).to respond_to(:anadir_aparcamiento)

      expect(@proveedor_1.aparcamiento).to eq [@datos_1]
      expect(@proveedor_2.aparcamiento).to eq [@datos_1, @datos_2]
      expect(@proveedor_3.aparcamiento).to eq [@datos_1, @datos_2, @datos_3]
    end
    it "Se espera que se pueda saber el estado de cada aparcamiento de un proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1.respond_to? :get_estado).to eq(true)
      expect(@proveedor_1).to respond_to(:get_estado)
      expect(@proveedor_1.get_estado()).to eq ["completo"]
      expect(@proveedor_2.get_estado()).to eq ["completo", "plazas libres: 1"]
      expect(@proveedor_3.get_estado()).to eq ["completo", "plazas libres: 1", "plazas libres: 3"]
    end
    it "Se espera que se pueda saber si cumple con la reserva minusvalidos cada aparcamiento de un proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1.respond_to? :get_reserva_minusvalidos).to eq(true)
      expect(@proveedor_1).to respond_to(:get_reserva_minusvalidos)
      expect(@proveedor_1.get_reserva_minusvalidos(1)).to eq ["Cumple con reserva plazas minuválidos"]
      expect(@proveedor_2.get_reserva_minusvalidos(0)).to eq ["No cumple con reserva plazas minuválidos", "No cumple con reserva plazas minuválidos"]
      expect(@proveedor_3.get_reserva_minusvalidos(3)).to eq ["Cumple con reserva plazas minuválidos", "Cumple con reserva plazas minuválidos", "Cumple con reserva plazas minuválidos"]
    end
    it "Se espera que se pueda saber cuantas plazas libres minusválidas hay en cada aparcamiento de un proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1.respond_to? :get_libre_minusvalidos).to eq(true)
      expect(@proveedor_1).to respond_to(:get_libre_minusvalidos)
      expect(@proveedor_1.get_libre_minusvalidos()).to eq [0]
      expect(@proveedor_2.get_libre_minusvalidos()).to eq [0, 1]
      expect(@proveedor_3.get_libre_minusvalidos()).to eq [0, 1, 2]
    end
    it "Se espera que se pueda saber cuantos vehiculos estacionados hay para cada aparcamiento de un proveedor" do	
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1.respond_to? :get_vehiculos_estacionados).to eq(true)
      expect(@proveedor_1).to respond_to(:get_vehiculos_estacionados)
      expect(@proveedor_1.get_vehiculos_estacionados()).to eq [1]
      expect(@proveedor_2.get_vehiculos_estacionados()).to eq [1, 1]
      expect(@proveedor_3.get_vehiculos_estacionados()).to eq [1, 1, 0]
    end
    it "Se espera que exista un método para formatear la información de un proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
      end
      expect(@proveedor_1.to_s).to eq "Proveedor con id: 1 y aparcamientos: [\"AparcamientoElDios\"] con estado: [\"completo\"], con reserva minusvalidos: [\"Cumple con reserva plazas minuválidos\"], con libre minusvalidos: [0], con vehiculos estacionados: [1]"
      expect(@proveedor_2.to_s).to eq "Proveedor con id: #{@proveedor_2.id} y aparcamientos: #{@proveedor_2.aparcamiento.collect{|datos| datos.nombre}} con estado: #{@proveedor_2.estado}, con reserva minusvalidos: #{@proveedor_2.reserva_minusvalidos}, con libre minusvalidos: #{@proveedor_2.libre_minusvalidos}, con vehiculos estacionados: #{@proveedor_2.vehiculos_estacionados}"
      expect(@proveedor_3.to_s).to eq "Proveedor con id: #{@proveedor_3.id} y aparcamientos: #{@proveedor_3.aparcamiento.collect{|datos| datos.nombre}} con estado: #{@proveedor_3.estado}, con reserva minusvalidos: #{@proveedor_3.reserva_minusvalidos}, con libre minusvalidos: #{@proveedor_3.libre_minusvalidos}, con vehiculos estacionados: #{@proveedor_3.vehiculos_estacionados}"
    end
    it "Se espera que exista una método para aparcar un coche en un aparcamiento , especificando el nombre y el sitio, de un proveedor" do
      @proveedor_1 = Aparcamiento::DSLProveedor.new(1) do |r|
        r.anadir_aparcamiento [@datos_1]
        r.aparcar @vehiculo_1, "AparcamientoElDios", 1
      end
      @proveedor_2 = Aparcamiento::DSLProveedor.new(2) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2]
        r.aparcar @vehiculo_2, "AparcamientoJavi", 1
      end
      @proveedor_3 = Aparcamiento::DSLProveedor.new(3) do |r|
        r.anadir_aparcamiento [@datos_1, @datos_2, @datos_3]
        r.aparcar @vehiculo_6, "AparcamientoPepe", 3
      end
      expect(@proveedor_1.respond_to? :aparcar).to eq(true)
      expect(@proveedor_1).to respond_to(:aparcar)

      # expect(@proveedor_1.aparcar(@vehiculo_1, "AparcamientoElDios", 1)).to eq "El proveedor no tiene ningún aparcamiento con un puesto libre"
      # expect(@proveedor_1.aparcar(@vehiculo_1, "AparcamientoBajo", 0)).to eq "El Vehiculo con id 55 ha sido aparcado en el aparcamiento llamado AparcamientoBajo en el sitio número 0"
      # expect(@proveedor_2.aparcar(@vehiculo_2, "AparcamientoJavi", 1)).to eq "El Vehiculo con id 43 ha sido aparcado en el aparcamiento llamado AparcamientoJavi en el sitio número 1"
      # expect(@proveedor_3.aparcar(@vehiculo_6, "AparcamientoPepe", 3)).to eq "El Vehiculo con id 30 ha sido aparcado en el aparcamiento llamado AparcamientoPepe en el sitio número 3"
      
      expect(@proveedor_1.get_vehiculos_estacionados).to eq [2]
      expect(@proveedor_2.get_vehiculos_estacionados).to eq [2, 2]
      expect(@proveedor_3.get_vehiculos_estacionados).to eq [2, 2, 0]

      expect(@proveedor_1.aparcamiento.select{|datos| datos.vehiculos.find(@vehiculo_1) if datos.nombre == "AparcamientoBajo"}).not_to eq nil
      expect(@proveedor_2.aparcamiento.select{|datos| datos.vehiculos.find(@vehiculo_2) if datos.nombre == "AparcamientoJavi"}).not_to eq nil
      expect(@proveedor_3.aparcamiento.select{|datos| datos.vehiculos.find(@vehiculo_6) if datos.nombre == "AparcamientoPepe"}).not_to eq nil
    end
  end
  context "Herencia de la clase Aparcamiento::DSLProveedor" do
    it "Se espera que una instancia de la clase DSLProveedor sean los Proveedores de un aparcamiento" do
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).to be_a_kind_of(Aparcamiento::DSLProveedor)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Aparcamiento::DSLProveedor).to eq(true)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).to be_an_instance_of(Aparcamiento::DSLProveedor)
    end
    it "Se espera que una instancia de la clase DSLProveedor sea un objeto (Object)" do
      expect(Aparcamiento::DSLProveedor.is_a?Object).to eq(true)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Object).to eq(true)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?Object).to eq(true)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?Object).to eq(true)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).to be_an(Object)
    end
    it "Se espera que una instancia de la clase DSLProveedor sea un objeto básico (BasicObject)" do
      expect(Aparcamiento::DSLProveedor.is_a?BasicObject).to eq(true)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?BasicObject).to eq(true)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?BasicObject).to eq(true)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?BasicObject).to eq(true)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).to be_an(BasicObject)
    end
    it "Se espera que una instancia de la clase DSLProveedor sea una cadena (Class)" do
      expect(Aparcamiento::DSLProveedor.is_a?Class).to eq(true)
      expect(Aparcamiento::DSLProveedor.class).to eq(Class)
    end
    it "Se espera que una instancia de la clase DSLProveedor sea un objeto de la clase (Module)" do
      expect(Aparcamiento::DSLProveedor.is_a?Module).to eq(true)
      expect(Aparcamiento::DSLProveedor.class.superclass).to eq(Module)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Object).to eq(true)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?Object).to eq(true)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?Object).to eq(true)
    end
    it "No se espera que una instancia de la clase DSLProveedor sea una cadena (String)" do
      expect(Aparcamiento::DSLProveedor.is_a?String).to eq(false)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?String).to eq(false)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?String).to eq(false)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?String).to eq(false)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).not_to be_an(String)
    end
    it "No se espera que una instancia de la clase DSLProveedor sea un número (Numeric)" do
      expect(Aparcamiento::DSLProveedor.is_a?Numeric).to eq(false)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Numeric).to eq(false)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?Numeric).to eq(false)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?Numeric).to eq(false)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).not_to be_an(Numeric)
    end
    it "No se espera que una instancia de la clase DSLProveedor sea un Vehículo" do
      expect(Aparcamiento::DSLProveedor.is_a?Aparcamiento::Vehiculo).to eq(false)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).not_to be_an(Aparcamiento::Vehiculo)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Aparcamiento::Vehiculo).to eq(false)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?Aparcamiento::Vehiculo).to eq(false)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?Aparcamiento::Vehiculo).to eq(false)
    end
    it "No se espera que una instancia de la clase Datos sea un Motor" do
      expect(Aparcamiento::DSLProveedor.is_a?Aparcamiento::Motor).to eq(false)
      expect(@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).not_to be_an(Aparcamiento::Motor)
      expect((@proveedor_1 = Aparcamiento::DSLProveedor.new(1){}).is_a?Aparcamiento::Motor).to eq(false)
      expect((@proveedor_2 = Aparcamiento::DSLProveedor.new(2){}).is_a?Aparcamiento::Motor).to eq(false)
      expect((@proveedor_3 = Aparcamiento::DSLProveedor.new(3){}).is_a?Aparcamiento::Motor).to eq(false)
    end
    # it "Ejemplo" do
    #   @proveedor_1 = Aparcamiento::DSLProveedor.new(1){}
    #   expect(@proveedor_1.aparcamiento.max{|x| x.indice_sostenibilidad}).to eq(150)
    # end
  end
end