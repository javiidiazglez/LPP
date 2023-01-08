RSpec.describe Aparcamiento do
  context "Aparcamiento::Aeropuerto" do
    before :all do
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
      @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)

      @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
      @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
      @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

      @aeropuerto_1 = Aparcamiento::Aeropuerto.new(1, 1, 55, "AparcamientoJavi", :cubierto, :autobuses, [[3.0,4.0,5.0]], [true], 1.0, 0, 1.0, @conjunto_vehiculos_1,1)
      @aeropuerto_2 = Aparcamiento::Aeropuerto.new(5, 10, 66, "AparcamientoBajo", :mixto, :bicicletas, [[3.0,4.0,5.0], [5.1,6.2,7.3]], [true, false], 1.0, 0, 1.0, @conjunto_vehiculos_2,3)
      @aeropuerto_3 = Aparcamiento::Aeropuerto.new(5, 5, 43, "AparcamientoSolar", :aire_libre, :coches, [[3.0,4.0,5.0], [5.1,6.2,7.3], [8.1,9.2,10.1]], [true, false, false], 1.0, 0, 1.0, @conjunto_vehiculos_3,5)
    end
    context "Atributos de la clase Aparcamiento::Aeropuerto" do 
      it "Tiene una clase para almacenar los datos del Aeropuerto" do
        expect(Aparcamiento::Aeropuerto).not_to eq nil
        expect(Aparcamiento::Aeropuerto).to eq Aparcamiento::Aeropuerto
        expect(Aparcamiento::Aeropuerto).is_a? Aparcamiento::Datos
        expect(@aeropuerto_1).not_to be(nil)
        expect(@aeropuerto_1).not_to eq(nil)
        expect(@aeropuerto_1).not_to be_nil
      end
      it "Se espera que los atributos de clase Aeropuerto tengan un respond_to" do
        expect(@aeropuerto_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :ocupada, :plazas, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos, :plantas)
        expect(@aeropuerto_1).not_to respond_to(:edad)
      end
      it "Un aeropuerto tiene un atributo para el numero de plantas" do
        expect(@aeropuerto_1.plantas).to eq 1
        expect(@aeropuerto_2.plantas).to eq 3
        expect(@aeropuerto_3.plantas).to eq 5
      end
      it "Se espera que el aparcamiento de un aeropuerto herede correctamente los atributos" do 
        expect(@aeropuerto_1.accesibilidad).not_to eq nil
        expect(@aeropuerto_1.seguridad).not_to eq nil
        expect(@aeropuerto_1.id).not_to eq nil
        expect(@aeropuerto_1.nombre).not_to eq nil
        expect(@aeropuerto_1.descripcion).not_to eq nil
        expect(@aeropuerto_1.tipo).not_to eq nil
        expect(@aeropuerto_1.plazas).not_to eq nil
        expect(@aeropuerto_1.ocupada).not_to eq nil
        expect(@aeropuerto_1.n_plazas_minusvalidos).not_to eq nil
        expect(@aeropuerto_1.precio).not_to eq nil
        expect(@aeropuerto_1.vehiculos).not_to eq nil
      end
      it "Se obtiene una cadena con la información del coche correctamente formateada" do
        expect(@aeropuerto_1.to_s).not_to eq "Aeropuerto{accesibilidad: 1, seguridad: 1, id: 55, nombre: AparcamientoJavi, descripcion: cubierto, tipo: autobuses, plazas: [[3, 4, 5]], ocupada: [true], distancia_centro: 1.0, n_plazas_minusvalidos: 0, precio: 1.0, plantas: 1}"
        expect(@aeropuerto_2.to_s).not_to eq "Aeropuerto{accesibilidad: 5, seguridad: 10, id: 66, nombre: AparcamientoBajo, descripcion: mixto, tipo: bicicletas, plazas: [[3, 4, 5], [5, 6, 7]], ocupada: [true, false], distancia_centro: 1.0, n_plazas_minusvalidos: 0, precio: 1.0, plantas: 3}"      end  
    end
    context "Herencia de la clase Aparcamiento::Aeropuerto" do
      it "Se espera que una instancia de la clase Datos sean los Datos de un aeropuerto" do
        expect(@aeropuerto_1).to be_a_kind_of(Aparcamiento::Aeropuerto)
        expect((@aeropuerto_1).is_a?Aparcamiento::Aeropuerto).to eq(true)
        expect(@aeropuerto_1).to be_an_instance_of(Aparcamiento::Aeropuerto)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea un objeto (Object)" do
        expect(Aparcamiento::Aeropuerto.is_a?Object).to eq(true)
        expect((@aeropuerto_1).is_a?Object).to eq(true)
        expect(@aeropuerto_1).to be_an(Object)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea un objeto básico (BasicObject)" do
        expect(Aparcamiento::Aeropuerto.is_a?BasicObject).to eq(true)
        expect((@aeropuerto_1).is_a?BasicObject).to eq(true)
        expect(@aeropuerto_1).to be_an(BasicObject)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea una cadena (Class)" do
        expect(Aparcamiento::Aeropuerto.is_a?Class).to eq(true)
        expect(Aparcamiento::Aeropuerto.class).to eq(Class)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea un objeto de la clase (Module)" do
        expect(Aparcamiento::Aeropuerto.is_a?Module).to eq(true)
        expect(Aparcamiento::Aeropuerto.class.superclass).to eq(Module)
        expect((@aeropuerto_1).is_a?Object).to eq(true)
      end
      it "No se espera que una instancia de la clase Aeropuerto sea una cadena (String)" do
        expect(Aparcamiento::Aeropuerto.is_a?String).to eq(false)
        expect((@aeropuerto_1).is_a?String).to eq(false)
        expect(@aeropuerto_1).not_to be_an(String)
      end
      it "No se espera que una instancia de la clase Aeropuerto sea un número (Numeric)" do
        expect(Aparcamiento::Aeropuerto.is_a?Numeric).to eq(false)
        expect((@aeropuerto_1).is_a?Numeric).to eq(false)
        expect(@aeropuerto_1).not_to be_an(Numeric)
      end
      it "No se espera que una instancia de la clase Aeropuerto sea un Vehículo" do
        expect(Aparcamiento::Aeropuerto.is_a?Aparcamiento::Vehiculo).to eq(false)
        expect(@aeropuerto_1).not_to be_an(Aparcamiento::Vehiculo)
        expect((@aeropuerto_1).is_a?Aparcamiento::Vehiculo).to eq(false)
      end
      it "No se espera que una instancia de la clase Aeropuerto sea un Motor" do
        expect(Aparcamiento::Aeropuerto.is_a?Aparcamiento::Motor).to eq(false)
        expect(@aeropuerto_1).not_to be_an(Aparcamiento::Motor)
        expect((@aeropuerto_1).is_a?Aparcamiento::Motor).to eq(false)
      end
    end
  end
  context "Aparcamiento::Estacion" do
    before :all do
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
      @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
      
      @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
      @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
      @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

      @estacion_1 = Aparcamiento::Estacion.new(1, 1, 55, "AparcamientoJavi", :cubierto, :autobuses, [[3.0,4.0,5.0]], [true], 1.0, 0, 1.0, @conjunto_vehiculos_1,1)
      @estacion_2 = Aparcamiento::Estacion.new(5, 10, 66, "AparcamientoBajo", :mixto, :bicicletas, [[3.0,4.0,5.0], [5.1,6.2,7.3]], [true, false], 1.0, 0, 1.0 , @conjunto_vehiculos_2,3)
      @estacion_3 = Aparcamiento::Estacion.new(5, 5, 43, "AparcamientoSolar", :aire_libre, :coches, [[3.0,4.0,5.0], [5.1,6.2,7.3], [8.1,9.2,10.1]], [true, false, false], 1.0, 0, 1.0, @conjunto_vehiculos_3,5)
    end
    context "Atributos de la clase Aparcamiento::Estacion" do 
      it "Tiene una clase para almacenar los datos del aparcamiento de la Estación" do
        expect(Aparcamiento::Estacion).not_to eq nil
        expect(Aparcamiento::Estacion).to eq Aparcamiento::Estacion
        expect(Aparcamiento::Estacion).is_a? Aparcamiento::Datos
        expect(@estacion_1).not_to be(nil)
        expect(@estacion_1).not_to eq(nil)
        expect(@estacion_1).not_to be_nil
      end
      it "Se espera que los atributos de clase Estacion tengan un respond_to" do
        expect(@estacion_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :ocupada, :plazas, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos, :n_plazas)
        expect(@estacion_1).not_to respond_to(:edad)
      end
      it "Una estación tiene un atributo para el numero de plazas" do
        expect(@estacion_1.larga_estancia).to eq 1
        expect(@estacion_2.larga_estancia).to eq 3
        expect(@estacion_3.larga_estancia).to eq 5
      end
      it "Se espera que el aparcamiento de una estación herede correctamente los atributos" do 
        expect(@estacion_1.accesibilidad).not_to eq nil
        expect(@estacion_1.seguridad).not_to eq nil
        expect(@estacion_1.id).not_to eq nil
        expect(@estacion_1.nombre).not_to eq nil
        expect(@estacion_1.descripcion).not_to eq nil
        expect(@estacion_1.tipo).not_to eq nil
        expect(@estacion_1.plazas).not_to eq nil
        expect(@estacion_1.ocupada).not_to eq nil
        expect(@estacion_1.distancia_centro).not_to eq nil
        expect(@estacion_1.n_plazas_minusvalidos).not_to eq nil
        expect(@estacion_1.precio).not_to eq nil
        expect(@estacion_1.vehiculos).not_to eq nil
      end
      it "Se obtiene una cadena con la información del coche correctamente formateada" do
        expect(@estacion_1.to_s).not_to eq "Estación{accesibilidad: 1, seguridad: 1, id: 55, nombre: AparcamientoJavi, descripcion: cubierto, tipo: autobuses, plazas: [[3.0, 4.0, 5.0]], ocupada: [true], distancia_entro: 1.0, n_plazas_minusvalidos: 0, precio: 1.0, larga estancia: 1}"
        expect(@estacion_2.to_s).not_to eq "Estación{accesibilidad: 5, seguridad: 10, id: 66, nombre: AparcamientoBajo, descripcion: mixto, tipo: bicicletas, plazas: [[[3.0,4.0,5.0], [5.1,6.2,7.3]], ocupada: [true, false], distancia_centro: 1.0, n_plazas_minusvalidos: 0, precio: 1.0, larga estancia: 3}"
      end
    end
    context "Herencia de la clase Aparcamiento::Estacion" do
      it "Se espera que una instancia de la clase Datos sean los Datos de una estacion" do
        expect(@estacion_1).to be_a_kind_of(Aparcamiento::Estacion)
        expect((@estacion_1).is_a?Aparcamiento::Estacion).to eq(true)
        expect(@estacion_1).to be_an_instance_of(Aparcamiento::Estacion)
      end
      it "Se espera que una instancia de la clase Estacion sea un objeto (Object)" do
        expect(Aparcamiento::Estacion.is_a?Object).to eq(true)
        expect((@estacion_1).is_a?Object).to eq(true)
        expect(@estacion_1).to be_an(Object)
      end
      it "Se espera que una instancia de la clase Estacion sea un objeto básico (BasicObject)" do
        expect(Aparcamiento::Estacion.is_a?BasicObject).to eq(true)
        expect((@estacion_1).is_a?BasicObject).to eq(true)
        expect(@estacion_1).to be_an(BasicObject)
      end
      it "Se espera que una instancia de la clase Estacion sea una cadena (Class)" do
        expect(Aparcamiento::Estacion.is_a?Class).to eq(true)
        expect(Aparcamiento::Estacion.class).to eq(Class)
      end
      it "Se espera que una instancia de la clase Estacion sea un objeto de la clase (Module)" do
        expect(Aparcamiento::Estacion.is_a?Module).to eq(true)
        expect(Aparcamiento::Estacion.class.superclass).to eq(Module)
        expect((@estacion_1).is_a?Object).to eq(true)
      end
      it "No se espera que una instancia de la clase Estacion sea una cadena (String)" do
        expect(Aparcamiento::Estacion.is_a?String).to eq(false)
        expect((@estacion_1).is_a?String).to eq(false)
        expect(@estacion_1).not_to be_an(String)
      end
      it "No se espera que una instancia de la clase Estacion sea un número (Numeric)" do
        expect(Aparcamiento::Estacion.is_a?Numeric).to eq(false)
        expect((@estacion_1).is_a?Numeric).to eq(false)
        expect(@estacion_1).not_to be_an(Numeric)
      end
      it "No se espera que una instancia de la clase Estacion sea un Vehículo" do
        expect(Aparcamiento::Estacion.is_a?Aparcamiento::Vehiculo).to eq(false)
        expect(@estacion_1).not_to be_an(Aparcamiento::Vehiculo)
        expect((@estacion_1).is_a?Aparcamiento::Vehiculo).to eq(false)
      end
      it "No se espera que una instancia de la clase Estacion sea un Motor" do
        expect(Aparcamiento::Estacion.is_a?Aparcamiento::Motor).to eq(false)
        expect(@estacion_1).not_to be_an(Aparcamiento::Motor)
        expect((@estacion_1).is_a?Aparcamiento::Motor).to eq(false)
      end
    end
  end
  context "Aparcamiento::Datos" do
    before :all do    
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
      @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
      
      @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
      @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
      @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

      @datos_1 = Aparcamiento::Datos.new(1, 1, 55, "AparcamientoElDios", :cubierto, :autobuses, [[3.0,4.0,5.0]], [true], 1.2, 0, 1.0, @conjunto_vehiculos_1)
      @datos_2 = Aparcamiento::Datos.new(5, 10, 66, "AparcamientoJavi", :mixto, :bicicletas, [[3.0,4.0,5.0], [5.1,6.2,7.1]], [true, false], 2.5, 1, 1.25, @conjunto_vehiculos_2)
      @datos_3 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :coches, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2]], [true, false, false], 1.0, 2, 2.0, @conjunto_vehiculos_3)
      @datos_4 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, true], 0.0, 3, 1.0, @conjunto_vehiculos_3)
      @datos_5 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, false], 40.0, 3, 1.0, @conjunto_vehiculos_3)
      @datos_6 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, true], 21.0, 3, 0.10, @conjunto_vehiculos_3)
      @datos_7 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, false], 40.0, 3, 0.09, @conjunto_vehiculos_3)
      @datos_8 = Aparcamiento::Datos.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0,6.0], [5.1,6.2,7.1,12.0], [8.0,9.1,10.2,13.0], [11.0,12.0,13.0,14.0]], [false, false, false, false], 40.0, 3, 0.09, @conjunto_vehiculos_3)

      @conjunto_aparcamientos_1 = [@datos_1, @datos_2, @datos_3, @datos_6]
      @conjunto_aparcamientos_2 = [@datos_1, @datos_2, @datos_6, @datos_7]
      @conjunto_aparcamientos_3 = [@datos_1, @datos_2, @datos_3]
      
      @aeropuerto_1 = Aparcamiento::Aeropuerto.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, false], 40.0, 3, 0.09, @conjunto_vehiculos_3, 1)
      @aeropuerto_2 = Aparcamiento::Aeropuerto.new(1, 1, 55, "AparcamientoElDios", :cubierto, :autobuses, [[3.0,4.0,5.0]], [true], 1.2, 0, 1.0, @conjunto_vehiculos_1, 3)
      @aeropuerto_3 = Aparcamiento::Aeropuerto.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :coches, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2]], [true, false, false], 1.0, 2, 2.0, @conjunto_vehiculos_3, 5)
      @aeropuerto_4 = Aparcamiento::Aeropuerto.new(5, 10, 66, "AparcamientoJavi", :mixto, :bicicletas, [[3.0,4.0,5.0], [5.1,6.2,7.1]], [true, false], 2.5, 1, 1.25, @conjunto_vehiculos_2, 2)

      @conjunto_aeropuerto_1 = [@aeropuerto_1, @aeropuerto_2, @aeropuerto_3, @aeropuerto_4]
      @conjunto_aeropuerto_2 = [@aeropuerto_3, @aeropuerto_2, @aeropuerto_4]

      @estacion_1 = Aparcamiento::Estacion.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :motos, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]], [false, false, false, false], 40.0, 3, 0.09, @conjunto_vehiculos_3, 1)
      @estacion_2 = Aparcamiento::Estacion.new(1, 1, 55, "AparcamientoElDios", :cubierto, :autobuses, [[3.0,4.0,5.0]], [true], 1.2, 0, 1.0, @conjunto_vehiculos_1, 3)
      @estacion_3 = Aparcamiento::Estacion.new(5, 5, 43, "AparcamientoBajo", :aire_libre, :coches, [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2]], [true, false, false], 1.0, 2, 2.0, @conjunto_vehiculos_3, 5)
      @estacion_4 = Aparcamiento::Estacion.new(5, 10, 66, "AparcamientoJavi", :mixto, :bicicletas, [[3.0,4.0,5.0], [5.1,6.2,7.1]], [true, false], 2.5, 1, 1.25, @conjunto_vehiculos_2, 2)
      
      @conjunto_estacion_1 = [@estacion_1, @estacion_2, @estacion_3, @estacion_4]
      @conjunto_estacion_2 = [@estacion_3, @estacion_2, @estacion_4]
    end
    context "Atributos de la clase Aparcamiento::Datos" do
      it "Tiene una clase para almacenar los datos del aparcamiento" do
        expect(Aparcamiento::Datos).not_to eq nil
        expect(Aparcamiento::Datos).to eq Aparcamiento::Datos
        expect(@datos_1).not_to be(nil)
        expect(@datos_1).not_to eq(nil)
        expect(@datos_1).not_to be_nil
        expect(@datos_2).not_to be(nil)
        expect(@datos_2).not_to eq(nil)
        expect(@datos_2).not_to be_nil
      end
      it "Se espera matchers de la clase Datos" do
        expect(@datos_2).to be_an(Aparcamiento::Datos)
        expect(@datos_3).to be_a_kind_of(Aparcamiento::Datos)
        expect(@datos_4).is_a?(Aparcamiento::Datos)
        expect(@datos_1.is_a?(Aparcamiento::Datos)).to eq(true)
        expect(@datos_1.class).to eq(Aparcamiento::Datos)
        expect(@datos_1.is_a? Object).to eq(true)
      end
      it "Se espera que los atributos de clase Datos tengan un respond_to" do
        expect(@datos_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas, :ocupada, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos)
        expect(@datos_3).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas, :ocupada, :distancia_centro, :n_plazas_minusvalidos, :precio, :vehiculos)
        expect(@datos_1).not_to respond_to(:edad)
      end
      it "Todo aparcamiento tiene el atributo de accesibilidad (1..5)" do
        expect(@datos_1.accesibilidad).not_to be_nil
        expect(@datos_1.accesibilidad).to eq 1
        expect(@datos_2.accesibilidad).to eq 5
        expect(@datos_2.accesibilidad).to be_between(1, 5)
      end
      it "Todo aparcamiento tiene el atributo de seguridad (1..10)" do
        expect(@datos_1.seguridad).not_to be_nil
        expect(@datos_1.seguridad).to eq 1
        expect(@datos_2.seguridad).to eq 10
        expect(@datos_3.seguridad).to eq 5
        expect(@datos_2.seguridad).to be_between(1, 10)
      end
      it "Un aparcamiento tiene un atributo para su identificación" do
        expect(@datos_1.id).not_to be_nil
        expect(@datos_1.id).to eq 55
        expect(@datos_2.id).to eq 66
        expect(@datos_3.id).to eq 43
      end
      it "Un aparcamiento tiene un atributo para su nombre comercial" do
        expect(@datos_1.nombre).not_to be_nil
        expect(@datos_1.nombre).to eq("AparcamientoElDios")
        expect(@datos_2.nombre).to eq("AparcamientoJavi")
        expect(@datos_3.nombre).to eq("AparcamientoBajo")
        expect(@datos_4.nombre).to eq("AparcamientoBajo")
      end
      it "Un aparcamiento tiene atributo para descripcion (Cubierto/Aire libre/Mixto)" do
        expect(@datos_1.descripcion).not_to be_nil
        expect(@datos_1.descripcion).to eq :cubierto
        expect(@datos_2.descripcion).to eq :mixto 
        expect(@datos_3.descripcion).to eq :aire_libre
      end
      it "Tiene un atributo para el tipo de aparcamiento (autobuses, bicicletas, coches, motos)" do
        expect(@datos_1.tipo).not_to be_nil
        expect(@datos_1.tipo).to eq :autobuses
        expect(@datos_2.tipo).to eq :bicicletas 
        expect(@datos_3.tipo).to eq :coches
        expect(@datos_4.tipo).to eq :motos
      end
      it "Un aparcamiento se espera que cada plaza tenga 3 atributos (altura, longitud y anchura)" do
        i = 0
        while i < @datos_1.plazas.size
          expect(@datos_1.plazas[i].size).to eq(3)
          i = i + 1
        end
        i = 0
        while i < @datos_2.plazas.size
          expect(@datos_2.plazas[i].size).to eq(3)
          i = i + 1
        end
        while i < @datos_3.plazas.size
          expect(@datos_3.plazas[i].size).to eq(3)
          i = i + 1
        end
        while i < @datos_4.plazas.size
          expect(@datos_4.plazas[i].size).to eq(3)
          i = i + 1
        end
      end 
      it "Tiene un atributo para representar el conjunto de plazas del aparcamiento (altura, longitud, anchura)" do
        expect(@datos_1.plazas[0]).not_to be_nil
        expect(@datos_1.plazas).to eq [[3.0,4.0,5.0]]
        expect(@datos_2.plazas).to eq [[3.0,4.0,5.0], [5.1,6.2,7.1]]
        expect(@datos_3.plazas).to eq [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2]]
        expect(@datos_4.plazas).to eq [[3.0,4.0,5.0], [5.1,6.2,7.1], [8.0,9.1,10.2], [11.0,12.0,13.0]]
        expect(@datos_2.plazas[0]).to eq [3.0,4.0,5.0]
        expect(@datos_2.plazas[1]).to eq [5.1,6.2,7.1]
      end
      it "Tiene un atributo para representar el conjunto de plazas libres y ocupadas" do
        expect(@datos_1.ocupada).not_to be_nil
        expect(@datos_1.ocupada).to eq [true]
        expect(@datos_2.ocupada).to eq [true, false]
        expect(@datos_3.ocupada).to eq [true,false,false]
        expect(@datos_4.ocupada).to eq [false,false,false,true]
      end
      it "Un aparcamiento tiene atributo para representar la distancia_centro" do
        expect(@datos_1.distancia_centro).not_to be_nil
        expect(@datos_1.distancia_centro).to eq 1.2
        expect(@datos_2.distancia_centro).to eq 2.5
        expect(@datos_3.distancia_centro).to eq 1.0
      end
      it "Un aparcamiento tiene atributo para representar la plaza de minusvalido" do
        expect(@datos_1.n_plazas_minusvalidos).not_to be_nil
        expect(@datos_1.n_plazas_minusvalidos).to eq 0
        expect(@datos_2.n_plazas_minusvalidos).to eq 1
        expect(@datos_3.n_plazas_minusvalidos).to eq 2
      end
      it "Un aparcamiento tiene atributo para representar el precio" do
        expect(@datos_1.precio).not_to be_nil
        expect(@datos_1.precio).to eq 1.0
        expect(@datos_2.precio).to eq 1.25
        expect(@datos_3.precio).to eq 2
      end
      it "Un aparcamiento tiene atributo para representar el conjunto de vehiculos" do
        expect(@datos_1.vehiculos).not_to be_nil
        expect(@datos_1.vehiculos).to eq @conjunto_vehiculos_1
        expect(@datos_2.vehiculos).to eq @conjunto_vehiculos_2
        expect(@datos_3.vehiculos).to eq @conjunto_vehiculos_3
      end
      it "Tiene un método para devolver el número de plazas del aparcamiento" do
        expect(@datos_1.n_plazas).not_to be_nil
        expect(@datos_1.n_plazas).to eq 1
        expect(@datos_2.n_plazas).to eq 2
        expect(@datos_3.n_plazas).to eq 3
        expect(@datos_4.n_plazas).to eq 4
        expect(@datos_1).to respond_to(:n_plazas)
        expect(@datos_3.respond_to?(:n_plazas)).to be(true)
      end
      it "Tiene un método para devolver el número de plazas libres del aparcamiento" do
        expect(@datos_1.libres).not_to be_nil
        expect(@datos_1.libres).to eq 0
        expect(@datos_2.libres).to eq 1
        expect(@datos_3.libres).to eq 2
        expect(@datos_4.libres).to eq 3
        expect(@datos_1).to respond_to(:libres)
        expect(@datos_3.respond_to?(:libres)).to be(true)
      end
      it "Se espera que un estacionamiento cuente con una funcionalidad que permita aparcar un vehículo." do
        expect(@datos_1.aparcar(@vehiculo_4, 0)).to eq "No se pueden aparcar coches, Aparcamiento lleno"
        expect(@datos_2.aparcar(@vehiculo_1, 0)).to eq "Aparcamiento seleccionado ocupado"
        expect(@datos_2.aparcar(@vehiculo_1, 1)).to eq "Vehículo 55 aparcado en 1"
        expect(@datos_3.aparcar(@vehiculo_3, 1)).to eq "El vehículo no entra en el estacionamiento seleccionado"
      end
      it "Se espera que un estacionamiento ha de poder determinar la duración de la estancia de un vehículo dadas su hora de entrada y salida." do
        expect(@datos_1.duracion("13:50", "14:50")).to eq "1 : 0"
        expect(@datos_1.duracion("13:50", "17:00")).to eq "3 : 10"
        expect(@datos_1.duracion("13:50", "20:50")).to eq "7 : 0"
      end
      it "Un estacionamiento debe contar con una funcionalidad que permita calcular el importe a pagar por un vehículo dada una duración." do
        @duracion_1 = @datos_1.duracion("13:50", "14:50")
        @duracion_2 = @datos_1.duracion("13:50", "17:00")
  
        expect(@datos_1.importe(@duracion_1)).to eq 60.0
        expect(@datos_1.importe(@duracion_2)).to eq 190.0
        expect(@datos_2.importe(@duracion_1)).to eq 75.0
        expect(@datos_2.importe(@duracion_2)).to eq 237.5
      end
      context "Práctica 10. PARADIGMA DE PROGRAMACION FUNCIONAL." do
        it "Se espera que un estacionamiento cuente con un método que calcula el índice de sostenibilidad" do
          expect(@datos_1.respond_to? :indice_sostenibilidad).to eq(true)
          expect(@datos_1).to respond_to(:indice_sostenibilidad)
          expect(@datos_1.indice_sostenibilidad).to eq 1
          expect(@datos_6.indice_sostenibilidad).to eq 2
          expect(@datos_7.indice_sostenibilidad).to eq 3
          expect(@datos_5.indice_sostenibilidad).to eq nil
        end
        it "Se espera seleccionar los estacionamientos con plazas libres de mayor índice de sostenibilidad del conjunto de aparcamientos" do
          expect(@conjunto_aparcamientos_1.select{|estacionamiento| estacionamiento.libres > 0}.max).not_to be nil
          expect(@conjunto_aparcamientos_1.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @datos_6
          expect(@conjunto_aparcamientos_2.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @datos_7
          expect(@conjunto_aparcamientos_3.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @datos_1
        end
        it "Se espera seleccionar los estacionamientos con plazas libres de mayor índice de sostenibilidad del conjunto de aparcamientos hijos (Aeropuerto, Estación)" do
          expect(@conjunto_aeropuerto_1.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @aeropuerto_1
          expect(@conjunto_aeropuerto_2.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @aeropuerto_2
          expect(@conjunto_estacion_1.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @estacion_1
          expect(@conjunto_estacion_2.select{|estacionamiento| estacionamiento.libres > 0}.max).to eq @estacion_2
        end
        it "Se espera seleccionar los estacionamientos con plazas libres de minusválidos de mayor índice de sostenibilidad del conjunto de aparcamientos" do
          expect(@conjunto_aparcamientos_1.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).not_to be nil
          expect(@conjunto_aparcamientos_1.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @datos_6
          expect(@conjunto_aparcamientos_2.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @datos_7
          expect(@conjunto_aparcamientos_3.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @datos_3
        end
        it "Se espera seleccionar los estacionamientos con plazas libres de minusválidos de mayor índice de sostenibilidad del conjunto de aparcamientos hijos (Aeropuerto, Estación)" do
          expect(@conjunto_aeropuerto_1.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @aeropuerto_1
          expect(@conjunto_aeropuerto_2.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @aeropuerto_2
          expect(@conjunto_estacion_1.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @estacion_1
          expect(@conjunto_estacion_2.select{|estacionamiento| Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento) > 0}.max).to eq @estacion_2
        end
        it "Se espera calcular el porcentaje de ocupación de cada uno de ellos del conjunto de aparcamientos" do
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).not_to be nil
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [100.0, 100.0, 33.33, 25.0]
          expect(@conjunto_aparcamientos_2.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [100.0, 100.0, 25.0, 0.0]
          expect(@conjunto_aparcamientos_3.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [100.0, 100.0, 33.33]
        end
        it "Se espera calcular el porcentaje de ocupación de cada uno de ellos del conjunto de aparcamientos hijos (Aeropuerto, Estación)" do
          expect(@conjunto_aeropuerto_1.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [0.0, 100.0, 33.33, 50.0]
          expect(@conjunto_aeropuerto_2.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [33.33, 100.0, 50.0]
          expect(@conjunto_estacion_1.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [0.0, 100.0, 33.33, 50.0]
          expect(@conjunto_estacion_2.collect{|estacionamiento| ((Float(estacionamiento.n_plazas - estacionamiento.libres) / estacionamiento.n_plazas)* 100).round(2) }).to eq [33.33, 100.0, 50.0]
        end
        it "Se espera calcular el porcentaje de plazas de minusválidos libres de cada uno del conjunto de aparcamientos" do
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).not_to be nil
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [0.0, 0.0, 100.0, 66.67]
          expect(@conjunto_aparcamientos_2.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [0.0, 0.0, 66.67, 100.0]
          expect(@conjunto_aparcamientos_3.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [0.0, 0.0, 100.0]
        end
        it "Se espera calcular el porcentaje de plazas de minusválidos libres de cada uno del conjunto de aparcamientos hijos (Aeropuerto, Estación)" do
          expect(@conjunto_aeropuerto_1.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [100.0, 0.0, 100.0, 100.0]
          expect(@conjunto_aeropuerto_2.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [100.0, 0.0, 100.0]
          expect(@conjunto_estacion_1.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [100.0, 0.0, 100.0, 100.0]
          expect(@conjunto_estacion_2.collect{|estacionamiento| (estacionamiento.n_plazas_minusvalidos > 0) ? (Float(Aparcamiento::Funcionalidades::libre_minusvalidos(estacionamiento)) / estacionamiento.n_plazas_minusvalidos * 100).round(2) : 0.0}).to eq [100.0, 0.0, 100.0]
        end
        it "Se espera Herencias para Aparcamiento::Datos sobre un conjunto de aparcamiento funcional" do
          expect(@conjunto_aparcamientos_1.select{|estacionamiento| estacionamiento.is_a?Aparcamiento::Datos}).to eq [@datos_1, @datos_2, @datos_3, @datos_6]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Aparcamiento::Datos}).to eq [true, true, true, true]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Object}).to eq [true, true, true, true]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?BasicObject}).to eq [true, true, true, true]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Numeric}).to eq [false, false, false, false]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?String}).to eq [false, false, false, false]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Class}).to eq [false, false, false, false]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Array}).to eq [false, false, false, false]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Aparcamiento::Motor}).to eq [false, false, false, false]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Aparcamiento::Vehiculo}).to eq [false, false, false, false]
        end
        it "Se espera comparable y enumerable para Aparcamiento::Datos sobre un conjunto de aparcamiento funcional" do
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Enumerable}).to eq [true, true, true, true]
          expect(@conjunto_aparcamientos_1.collect{|estacionamiento| estacionamiento.is_a?Comparable}).to eq [true, true, true, true]
        end
        it "Se espera realizan comparaciones de datos usando modulo comparable" do 
          expect(@datos_7 > @datos_1).to eq true
          expect(@datos_2 < @datos_1).to eq false
          expect(@datos_2 <= @datos_1).to eq true
          expect(@datos_1 >= @datos_2).to eq true
          expect(@datos_3 == @datos_4).to eq true
          expect(@datos_3.between?(@datos_4, @datos_7)).to eq true
          expect(@datos_7.between?(@datos_7, @datos_1)).to eq false
        end
      end
      it "Tiene un método para obtener una cadena con la información del aparcamiento correctamente formateada" do
        expect(@datos_1.to_s).to eq "Datos{accesibilidad: 1, seguridad: 1, id: 55, nombre: AparcamientoElDios, descripcion: cubierto, tipo: autobuses, plazas: [[3.0, 4.0, 5.0]], ocupada: [true]}"
        expect(@datos_2.to_s).to eq "Datos{accesibilidad: 5, seguridad: 10, id: 66, nombre: AparcamientoJavi, descripcion: mixto, tipo: bicicletas, plazas: [[3.0, 4.0, 5.0], [5.1, 6.2, 7.1]], ocupada: [true, true]}"
      end
    end
    context "Enumerable Aparcamiento::Datos" do
      it "Se espera que una instancia de Datos sea enumerable" do
        expect(@datos_1.is_a? Enumerable).to eq true
        expect(@datos_2.is_a? Enumerable).to eq true
        expect(@datos_3.is_a? Enumerable).to eq true
        expect(@datos_4.is_a? Enumerable).to eq true
      end
      it "Se espera que se puedan utilizar los métodos de enumerable" do
        expect(@datos_1.vehiculos.each{|vehiculos| puts vehiculos}).not_to eq nil
        #expect(@datos_1.vehiculos.detect{|vehiculos| vehiculos == vehiculos}).not_to eq nil
        expect(@datos_1.plazas.select{|plazas| plazas == plazas}).not_to eq nil
        expect(@datos_1.plazas.collect{|plazas| plazas == plazas}).not_to eq nil
      end
    end
    context "Prevención de Errores - Aparcamiento::Datos" do 
      it "No se espera que cada plaza tenga '4 atributos', ya que hay 3 atributos (altura, longitud y anchura)" do
        i = 0
        while i < @datos_8.plazas.size
          expect(@datos_8.plazas[i].size).to eq(4)
          i = i + 1
        end
      end
    end
    context "Herencia de la clase Aparcamiento::Datos" do
      it "Se espera que una instancia de la clase Datos sean los Datos de un aparcamiento" do
        expect(@datos_1).to be_a_kind_of(Aparcamiento::Datos)
        expect((@datos_1).is_a?Aparcamiento::Datos).to eq(true)
        expect(@datos_1).to be_an_instance_of(Aparcamiento::Datos)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
        expect(Aparcamiento::Datos.is_a?Object).to eq(true)
        expect((@datos_1).is_a?Object).to eq(true)
        expect((@datos_2).is_a?Object).to eq(true)
        expect((@datos_3).is_a?Object).to eq(true)
        expect((@datos_4).is_a?Object).to eq(true)
        expect((@datos_5).is_a?Object).to eq(true)
        expect(@datos_1).to be_an(Object)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto básico (BasicObject)" do
        expect(Aparcamiento::Datos.is_a?BasicObject).to eq(true)
        expect((@datos_1).is_a?BasicObject).to eq(true)
        expect((@datos_2).is_a?BasicObject).to eq(true)
        expect((@datos_3).is_a?BasicObject).to eq(true)
        expect((@datos_4).is_a?BasicObject).to eq(true)
        expect((@datos_5).is_a?BasicObject).to eq(true)
        expect(@datos_1).to be_an(BasicObject)
      end
      it "Se espera que una instancia de la clase Datos sea una cadena (Class)" do
        expect(Aparcamiento::Datos.is_a?Class).to eq(true)
        expect(Aparcamiento::Datos.class).to eq(Class)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto de la clase (Module)" do
        expect(Aparcamiento::Datos.is_a?Module).to eq(true)
        expect(Aparcamiento::Datos.class.superclass).to eq(Module)
        expect((@datos_1).is_a?Object).to eq(true)
        expect((@datos_2).is_a?Object).to eq(true)
        expect((@datos_3).is_a?Object).to eq(true)
        expect((@datos_4).is_a?Object).to eq(true)
        expect((@datos_5).is_a?Object).to eq(true)
      end
      it "No se espera que una instancia de la clase Datos sea una cadena (String)" do
        expect(Aparcamiento::Datos.is_a?String).to eq(false)
        expect((@datos_1).is_a?String).to eq(false)
        expect((@datos_2).is_a?String).to eq(false)
        expect((@datos_3).is_a?String).to eq(false)
        expect((@datos_4).is_a?String).to eq(false)
        expect((@datos_5).is_a?String).to eq(false)
        expect(@datos_1).not_to be_an(String)
      end
      it "No se espera que una instancia de la clase Datos sea un número (Numeric)" do
        expect(Aparcamiento::Datos.is_a?Numeric).to eq(false)
        expect((@datos_1).is_a?Numeric).to eq(false)
        expect((@datos_2).is_a?Numeric).to eq(false)
        expect((@datos_3).is_a?Numeric).to eq(false)
        expect((@datos_4).is_a?Numeric).to eq(false)
        expect((@datos_5).is_a?Numeric).to eq(false)
        expect(@datos_1).not_to be_an(Numeric)
      end
      it "No se espera que una instancia de la clase Datos sea un Vehículo" do
        expect(Aparcamiento::Datos.is_a?Aparcamiento::Vehiculo).to eq(false)
        expect(@datos_1).not_to be_an(Aparcamiento::Vehiculo)
        expect((@datos_1).is_a?Aparcamiento::Vehiculo).to eq(false)
        expect((@datos_2).is_a?Aparcamiento::Vehiculo).to eq(false)
        expect((@datos_3).is_a?Aparcamiento::Vehiculo).to eq(false)
        expect((@datos_4).is_a?Aparcamiento::Vehiculo).to eq(false)
        expect((@datos_5).is_a?Aparcamiento::Vehiculo).to eq(false)
      end
      it "No se espera que una instancia de la clase Datos sea un Motor" do
        expect(Aparcamiento::Datos.is_a?Aparcamiento::Motor).to eq(false)
        expect(@datos_1).not_to be_an(Aparcamiento::Motor)
        expect((@datos_1).is_a?Aparcamiento::Motor).to eq(false)
        expect((@datos_2).is_a?Aparcamiento::Motor).to eq(false)
        expect((@datos_3).is_a?Aparcamiento::Motor).to eq(false)
        expect((@datos_4).is_a?Aparcamiento::Motor).to eq(false)
        expect((@datos_5).is_a?Aparcamiento::Motor).to eq(false)
      end
    end
  end
end