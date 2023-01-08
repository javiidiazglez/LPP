RSpec.describe Aparcamiento do
  context "Representación de los Datos de un aeropuerto - Aparcamiento::Aeropuerto" do
    before :all do
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
      @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
      
      @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
      @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
      @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]
      
      # accesibilidad, seguridad, id, nombre, descripcion, tipo, plazas_ocupadaslibres, plazas, distancia, n_plazas_minusvalido, precio, vehiculo
      @aeropuerto_1 = Aparcamiento::Aeropuerto.new(5, 66, 1, "AparcamientoElDios", :mixto, :autobuses, ['libre'], [[3.0,4.0,5.0]], 100.0, 3, 1000.32, @conjunto_vehiculos_1, 5)  
      @aeropuerto_2 = Aparcamiento::Aeropuerto.new(5, 10, 1, "AparcamientoJavi", :mixto, :autobuses, ['libre','ocupada'], [[3.0,4.0,5.0], [5.0,6.0,7.0]], 100.0, 3, 1000.32, @conjunto_vehiculos_2, 5)    
      @aeropuerto_3 = Aparcamiento::Aeropuerto.new(5, 5, 1, "AparcamientoPepe", :aire_libre, :autobuses, ['libre','ocupada','ocupada'], [[3.0,4.0,5.0], [5.0,6.0,7.0], [8.0,9.0,10.0]], 100.0, 3, 1000.32, @conjunto_vehiculos3_, 5)    
      @aeropuerto_error = Aparcamiento::Aeropuerto.new("hola", "prueba", "hola", -1, "prueba", "ciclismo", "libre", "vector de 3", -1.0, "100.0", -1.0, "conjunto", -1)
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
        expect(@aeropuerto_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas_ocupadaslibres, :plazas, :distancia, :n_plazas_minusvalido, :precio, :vehiculo, :numero_plantas)
        expect(@aeropuerto_1).not_to respond_to(:edad)
      end
      it "Un aeropuerto tiene un atributo para el numero de plantas" do
        expect(@aeropuerto_1.numero_plantas).to eq(5)
        expect(@aeropuerto_2.numero_plantas).to eq(5)
        expect(@aeropuerto_3.numero_plantas).to eq(5)
      end
      it "Se espera que el aparcamiento de un aeropuerto herede correctamente los atributos" do 
        expect(@aeropuerto_1.accesibilidad).not_to eq nil
        expect(@aeropuerto_1.seguridad).not_to eq nil
        expect(@aeropuerto_1.id).not_to eq nil
        expect(@aeropuerto_1.nombre).not_to eq nil
        expect(@aeropuerto_1.descripcion).not_to eq nil
        expect(@aeropuerto_1.tipo).not_to eq nil
        expect(@aeropuerto_1.plazas).not_to eq nil
        expect(@aeropuerto_1.plazas_ocupadaslibres).not_to eq nil
        expect(@aeropuerto_1.distancia).not_to eq nil
        expect(@aeropuerto_1.n_plazas_minusvalido).not_to eq nil
        expect(@aeropuerto_1.precio).not_to eq nil
        expect(@aeropuerto_1.vehiculo).not_to eq nil
      end
      it "Se obtiene una cadena con la información del coche correctamente formateada" do
        expect(@aeropuerto_2.to_s).to eq("Aparcamiento::Aeropuerto: => 5, 10, 1, AparcamientoJavi, mixto, autobuses, [\"libre\", \"ocupada\"], 100.0, 3, 1000.32, Aparcamiento::Vehiculo: => (55) - (1.2) - (3.401) - (3.405) - (3.5671) - (5)")
      end  
    end
    context "Prevención de Errores - Aparcamiento::Aeropuerto" do 
      it "Prevención de errores de los atributos de la clase Aeropuerto" do
        expect(@aeropuerto_error.accesibilidad).to eq("Error: Tipo de accesibilidad no válido")
        expect(@aeropuerto_error.seguridad).to eq("Error: Tipo de seguridad no válido")
        expect(@aeropuerto_error.id).to eq("Error: Tipo de identificación no válido")
        expect(@aeropuerto_error.nombre).to eq("Error: Tipo de nombre no válido")
        expect(@aeropuerto_error.descripcion).to eq("Error: Tipo de descripcion no válido [cubierto/aire_libre/mixto]")
        expect(@aeropuerto_error.tipo).to eq("Error: Tipo no válido [cubierto/aire_libre/mixto]")
        expect(@aeropuerto_error.plazas_ocupadaslibres).to eq("Error: Tipo de conjunto libre-ocupado no válido")
        expect(@aeropuerto_error.plazas).to eq("Error: Tipo de plazas no válido")
        expect(@aeropuerto_error.distancia).to eq("Error: Distancia no valido, deben ser numeros positivos")
        expect(@aeropuerto_error.n_plazas_minusvalido).to eq("Error: Tipo de numero plazas minusvalido no válido")
        expect(@aeropuerto_error.precio).to eq("Error: Precio no valido, deben ser numeros positivos")
        expect(@aeropuerto_error.numero_plantas).to eq("Error: Numero de plantas no valido, deben ser numeros positivos")
        expect(@datos_2.to_s).not_to eq("Funcionalidades => (4) - (10) - (2) - (AparcamientoJavi) - (Cubierto) - (coches)")
      end
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
  context "Representación de los Datos de un aeropuerto - Aparcamiento::Estacion" do
    before :all do
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
      @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
      
      @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
      @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
      @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

      @estacion_1 = Aparcamiento::Estacion.new(5, 66, 1, "AparcamientoElDios", :mixto, :autobuses, ['libre'], [[3.0,4.0,5.0]], 100.0, 3, 1000.32, @conjunto_vehiculos_1, 5)  
      @estacion_2 = Aparcamiento::Estacion.new(5, 10, 1, "AparcamientoJavi", :mixto, :autobuses, ['libre','ocupada'], [[3.0,4.0,5.0], [5.0,6.0,7.0]], 100.0, 3, 1000.32, @conjunto_vehiculos_2, 5)    
      @estacion_3 = Aparcamiento::Estacion.new(5, 5, 1, "AparcamientoPepe", :aire_libre, :autobuses, ['libre','ocupada','ocupada'], [[3.0,4.0,5.0], [5.0,6.0,7.0], [8.0,9.0,10.0]], 100.0, 3, 1000.32, @conjunto_vehiculos_3, 5)    
      @estacion_error = Aparcamiento::Estacion.new("hola", "prueba", "hola", -1, "prueba", "ciclismo", "libre", "vector de 3", -1.0, "100.0", -1.0, "conjunto", -1)
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
        expect(@estacion_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas_ocupadaslibres, :plazas, :distancia, :n_plazas_minusvalido, :precio, :vehiculo, :numero_plazas)
        expect(@estacion_1).not_to respond_to(:edad)
      end
      it "Una estación tiene un atributo para el numero de plazas" do
        expect(@estacion_1.numero_plazas).to eq(5)
        expect(@estacion_2.numero_plazas).to eq(5)
        expect(@estacion_3.numero_plazas).to eq(5)
      end
      it "Se espera que el aparcamiento de una estación herede correctamente los atributos" do 
        expect(@estacion_1.accesibilidad).not_to eq nil
        expect(@estacion_1.seguridad).not_to eq nil
        expect(@estacion_1.id).not_to eq nil
        expect(@estacion_1.nombre).not_to eq nil
        expect(@estacion_1.descripcion).not_to eq nil
        expect(@estacion_1.tipo).not_to eq nil
        expect(@estacion_1.plazas).not_to eq nil
        expect(@estacion_1.plazas_ocupadaslibres).not_to eq nil
        expect(@estacion_1.distancia).not_to eq nil
        expect(@estacion_1.n_plazas_minusvalido).not_to eq nil
        expect(@estacion_1.precio).not_to eq nil
        expect(@estacion_1.vehiculo).not_to eq nil
      end
      it "Se obtiene una cadena con la información del coche correctamente formateada" do
        expect(@estacion_2.to_s).to eq("Aparcamiento::Estacion: => 5, 10, 1, AparcamientoJavi, mixto, autobuses, [\"libre\", \"ocupada\"], 100.0, 3, 1000.32, Aparcamiento::Vehiculo: => (55) - (1.2) - (3.401) - (3.405) - (3.5671) - (5)")
      end
    end
    context "Prevención de Errores - Aparcamiento::Estación" do 
      it "Prevención de errores de los atributos de la clase Estacion" do
        expect(@estacion_error.accesibilidad).to eq("Error: Tipo de accesibilidad no válido")
        expect(@estacion_error.seguridad).to eq("Error: Tipo de seguridad no válido")
        expect(@estacion_error.id).to eq("Error: Tipo de identificación no válido")
        expect(@estacion_error.nombre).to eq("Error: Tipo de nombre no válido")
        expect(@estacion_error.descripcion).to eq("Error: Tipo de descripcion no válido [cubierto/aire_libre/mixto]")
        expect(@estacion_error.tipo).to eq("Error: Tipo no válido [cubierto/aire_libre/mixto]")
        expect(@estacion_error.plazas_ocupadaslibres).to eq("Error: Tipo de conjunto libre-ocupado no válido")
        expect(@estacion_error.plazas).to eq("Error: Tipo de plazas no válido")
        expect(@estacion_error.distancia).to eq("Error: Distancia no valido, deben ser numeros positivos")
        expect(@estacion_error.n_plazas_minusvalido).to eq("Error: Tipo de numero plazas minusvalido no válido")
        expect(@estacion_error.precio).to eq("Error: Precio no valido, deben ser numeros positivos")
        expect(@estacion_error.numero_plazas).to eq("Error: Numero de plazas no valido, deben ser numeros positivos")
        expect(@datos_2.to_s).not_to eq("Funcionalidades => (4) - (10) - (2) - (AparcamientoJavi) - (Cubierto) - (coches)")
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
  context "Representación de los Datos de un aparcamiento - Aparcamiento::Datos" do
    before :all do    
    @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
    @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
    @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
    @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
    
    @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
    @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
    @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

    @datos_1 = Aparcamiento::Datos.new(5, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ['libre'], [[3.0,4.0,5.0]], 1.2, 1, 1.0, @conjunto_vehiculos_1)
    @datos_2 = Aparcamiento::Datos.new(4, 10, 2, "AparcamientoJavi", :cubierto, :coches, ['libre','ocupada'], [[3.0,4.0,5.0], [5.0,6.0,7.0]], 2.5, 3, 1.25, @conjunto_vehiculos_2)
    @datos_3 = Aparcamiento::Datos.new(6, 10, 3, "AparcamientoBajo", :aire_libre, :bicicletas, ['libre','ocupada','ocupada'],[[3.0,4.0,5.0], [5.0,6.0,7.0], [8.0,9.0,10.0]], 1.0, 4, 2.0, @conjunto_vehiculos_3)
    @datos_4 = Aparcamiento::Datos.new(8, 11, 4, "AparcamientoSolar", :aire_libre, :motos, ['ocupada','ocupada','ocupada','libre'], [[3.0,4.0,5.0], [5.0,6.0,7.0], [8.0,9.0,10.0], [11.0,12.0,13.0]], 0.0, 0, 1.0, @conjunto_vehiculos_3)
    @datos_5 = Aparcamiento::Datos.new(9, 12, 3, "AparcamientoVago", :aire_libre, :bicicletas, ['ocupado', 'ocupado', 'ocupado'], [[3.0,4.0,5.0,1], [5,6,7,2], [8,9,10,1], [11,12,13,2],[11,12,13,14]], 0.0, 0, 1.0, @conjunto_vehiculos_3)  
    @datos_error = Aparcamiento::Datos.new("hola", "prueba", "hola", -1, "prueba", "ciclismo", 'libre', 'vector de 3', -1, "100.0", -1, "conjunto")
    @datos_6 = Aparcamiento::Datos.new(5, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ['ocupado'], [[3.0,4.0,5.0]], 1.2, 1, 1.0, @conjunto_vehiculos_1)
    @motor_1 = Aparcamiento::Motor.new(5, 5.2, 1.5, 10.2, 500, 100, 4, 200, 120)
  end
    context "Atributos de la clase Aparcamiento::Datos" do
      it "Tiene una clase para almacenar los datos del aparcamiento" do
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
        expect(@datos_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas_ocupadaslibres, :plazas, :distancia, :n_plazas_minusvalido, :precio, :vehiculo)
        expect(@datos_3).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :plazas_ocupadaslibres, :plazas, :distancia, :n_plazas_minusvalido, :precio, :vehiculo)
        expect(@datos_1).not_to respond_to(:edad)
      end
      it "Todo aparcamiento tiene el atributo de accesibilidad (1..5)" do
        expect(@datos_1.accesibilidad).not_to be_nil
        expect(@datos_1.accesibilidad).to eq(5)
        expect(@datos_2.accesibilidad).to eq(4)
        expect(@datos_2.accesibilidad).to be_between(1, 5)
        expect(@datos_3.accesibilidad).not_to eq(5)
        expect(@datos_4.accesibilidad).not_to eq(4)
      end
      it "Todo aparcamiento tiene el atributo de seguridad (1..10)" do
        expect(@datos_1.seguridad).not_to be_nil
        expect(@datos_1.seguridad).to eq(5)
        expect(@datos_2.seguridad).to eq(10)
        expect(@datos_2.seguridad).to be_between(1, 10)
        expect(@datos_3.accesibilidad).not_to eq(5)
        expect(@datos_4.accesibilidad).not_to eq(10)
      end
      it "Un aparcamiento tiene un atributo para su identificación" do
        expect(@datos_1.id).not_to be_nil
        expect(@datos_1.id).to eq(1)
        expect(@datos_2.id).to eq(2)
        expect(@datos_3.id).to eq(3)
      end
      it "Un aparcamiento tiene un atributo para su nombre comercial" do
        expect(@datos_1.nombre).not_to be_nil
        expect(@datos_1.nombre).to eq("AparcamientoElDios")
        expect(@datos_2.nombre).to eq("AparcamientoJavi")
        expect(@datos_3.nombre).to eq("AparcamientoBajo")
        expect(@datos_4.nombre).to eq("AparcamientoSolar")
      end
      it "Un aparcamiento tiene atributo para descripcion (Cubierto/Aire libre/Mixto)" do
        expect(@datos_1.descripcion).not_to be_nil
        expect(@datos_1.descripcion).to eq(:mixto)
        expect(@datos_2.descripcion).to eq(:cubierto)
        expect(@datos_3.descripcion).to eq(:aire_libre)
        expect(@datos_4.descripcion).to eq(:aire_libre)
      end
      it "Tiene un atributo para el tipo de aparcamiento (autobuses, bicicletas, coches, motos)" do
        expect(@datos_1.tipo).not_to be_nil
        expect(@datos_1.tipo).to eq(:autobuses)
        expect(@datos_2.tipo).to eq(:coches)
        expect(@datos_3.tipo).to eq(:bicicletas)
        expect(@datos_4.tipo).to eq(:motos)
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
        expect(@datos_1.plazas[0]).to eq([3.0, 4.0, 5.0])
        expect(@datos_1.plazas[0][0]).to eq(3.0)
        expect(@datos_1.plazas[0][1]).to eq(4.0)
        expect(@datos_1.plazas[0][2]).to eq(5.0)
        expect(@datos_2.plazas[0]).to eq([3.0, 4.0, 5.0])
        expect(@datos_2.plazas[1]).to eq([5.0, 6.0, 7.0])
        expect(@datos_2.plazas[1][0]).to eq(5.0)
        expect(@datos_2.plazas[1][1]).to eq(6.0)
        expect(@datos_2.plazas[1][2]).to eq(7.0)
        expect(@datos_1.plazas).to eq([[3, 4, 5]])
        expect(@datos_2.plazas).to eq([[3.0, 4.0, 5.0], [5.0, 6.0, 7.0]])
        expect(@datos_3.plazas).to eq([[3.0, 4.0, 5.0], [5.0, 6.0, 7.0], [8.0, 9.0, 10.0]])
        expect(@datos_4.plazas).to eq([[3.0, 4.0, 5.0], [5.0, 6.0, 7.0], [8.0, 9.0, 10.0], [11.0, 12.0, 13.0]])
      end
      it "Tiene un atributo para representar el conjunto de plazas libres y ocupadas" do
        expect(@datos_1.plazas_ocupadaslibres).not_to be_nil
        expect(@datos_1.plazas_ocupadaslibres[0]).to eq("libre")
        expect(@datos_2.plazas_ocupadaslibres[0]).to eq("libre")
        expect(@datos_2.plazas_ocupadaslibres[1]).to eq("ocupada")
        expect(@datos_1.plazas_ocupadaslibres).to eq(['libre'])
        expect(@datos_2.plazas_ocupadaslibres).to eq(['libre', 'ocupada'])
        expect(@datos_3.plazas_ocupadaslibres).to eq(['libre','ocupada','ocupada'])
        expect(@datos_4.plazas_ocupadaslibres).to eq(['ocupada','ocupada','ocupada','libre'])
      end
      it "Un aparcamiento tiene atributo para representar la distancia" do
        expect(@datos_1.distancia).not_to be_nil
        expect(@datos_1.distancia).to eq(1.2)
        expect(@datos_2.distancia).to eq(2.5)
        expect(@datos_3.distancia).to eq(1.0)
        expect(@datos_4.distancia).to eq(0.0)
        expect(@datos_4.distancia).to eq(0.0)
      end
      it "Un aparcamiento tiene atributo para representar la plaza de minusvalido" do
        expect(@datos_1.n_plazas_minusvalido).not_to be_nil
        expect(@datos_1.n_plazas_minusvalido).to eq(1)
        expect(@datos_2.n_plazas_minusvalido).to eq(3)
        expect(@datos_3.n_plazas_minusvalido).to eq(4)
        expect(@datos_4.n_plazas_minusvalido).to eq(0)
        expect(@datos_5.n_plazas_minusvalido).to eq(0)
      end
      it "Un aparcamiento tiene atributo para representar el precio" do
        expect(@datos_1.precio).not_to be_nil
        expect(@datos_1.precio).to eq(1.0)
        expect(@datos_2.precio).to eq(1.25)
        expect(@datos_3.precio).to eq(2.0)
        expect(@datos_4.precio).to eq(1.0)
        expect(@datos_5.precio).to eq(1.0)
      end
      it "Un aparcamiento tiene atributo para representar el conjunto de vehiculo" do
        expect(@datos_1.vehiculo).not_to be_nil
        expect(@datos_1.vehiculo).to eq([@vehiculo_1, @vehiculo_2, @vehiculo_3])
        expect(@datos_1.vehiculo).to eq(@conjunto_vehiculos_1)
      end
      it "Tiene un método para devolver el número de plazas del aparcamiento" do
        expect(@datos_1.numero_plazas).not_to be_nil
        expect(@datos_1.numero_plazas).to eq(1)
        expect(@datos_2.numero_plazas).to eq(2)
        expect(@datos_3.numero_plazas).to eq(3)
        expect(@datos_4.numero_plazas).to eq(4)
        expect(@datos_1).to respond_to(:numero_plazas)
        expect(@datos_3.respond_to?(:numero_plazas)).to be(true)
      end
      it "Tiene un método para devolver el número de plazas libres del aparcamiento" do
        expect(@datos_1.numero_plazas_libres).not_to be_nil
        expect(@datos_1.numero_plazas_libres).to eq(1)
        expect(@datos_2.numero_plazas_libres).to eq(1)
        expect(@datos_4.numero_plazas_libres).to eq(1)
        expect(@datos_1).to respond_to(:numero_plazas_libres)
        expect(@datos_3.respond_to?(:numero_plazas_libres)).to be(true)
      end
      it "Se espera que un estacionamiento cuente con una funcionalidad que permita aparcar un vehículo." do
        expect(@datos_6.aparcar(@vehiculo_4, 3)).to eq "No se pueden aparcar coches, Aparcamiento lleno"
        expect(@datos_2.aparcar(@vehiculo_1, 0)).to eq "Aparcamiento seleccionado ocupado"
        expect(@datos_2.aparcar(@vehiculo_1, 1)).to eq "Vehículo: 55 aparcado en posición: 1"
        expect(@datos_3.aparcar(@vehiculo_3, 1)).to eq "El vehículo no entra en el estacionamiento seleccionado"
        expect(@datos_6.aparcar(@vehiculo_4, 3)).to eq "No se pueden aparcar coches, Aparcamiento lleno"
        expect(@datos_6.aparcar(@motor_1, 3)).to eq "No se pueden aparcar coches, Aparcamiento lleno"
        expect(@datos_2.aparcar(@motor_1, 1)).to eq "El vehículo no entra en el estacionamiento seleccionado"
        expect(@datos_2.aparcar(@motor_1, 0)).to eq "Aparcamiento seleccionado ocupado"
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
      it "Tiene un método para obtener una cadena con la información del aparcamiento correctamente formateada" do
        expect(@datos_2.to_s).to eq("Aparcamiento::Datos: => 4, 10, 2, AparcamientoJavi, cubierto, coches, [\"libre\", \"ocupada\"], 2.5, 3, 1.25, Aparcamiento::Vehiculo: => (55) - (1.2) - (3.401) - (3.405) - (3.5671)")
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
        expect(@datos_1.vehiculo.each{|vehiculo| puts vehiculo}).not_to eq nil
        expect(@datos_1.vehiculo.detect{|vehiculo| vehiculo == vehiculo}).not_to eq nil
        expect(@datos_1.plazas.select{|plazas| plazas == plazas}).not_to eq nil
        expect(@datos_1.plazas.collect{|plazas| plazas == plazas}).not_to eq nil
      end
    end
    context "Prevención de Errores - Aparcamiento::Datos" do 
      it "Prevención de errores de los atributos datos" do
        expect(@datos_error.accesibilidad).to eq("Error: Tipo de accesibilidad no válido")
        expect(@datos_error.seguridad).to eq("Error: Tipo de seguridad no válido")
        expect(@datos_error.id).to eq("Error: Tipo de identificación no válido")
        expect(@datos_error.nombre).to eq("Error: Tipo de nombre no válido")
        expect(@datos_error.descripcion).to eq("Error: Tipo de descripcion no válido [cubierto/aire_libre/mixto]")
        expect(@datos_error.tipo).to eq("Error: Tipo no válido [cubierto/aire_libre/mixto]")
        expect(@datos_error.plazas_ocupadaslibres).to eq("Error: Tipo de conjunto libre-ocupado no válido")
        expect(@datos_error.plazas).to eq("Error: Tipo de plazas no válido")
        expect(@datos_3.accesibilidad).to eq("Accesibilidad no valido [1..5]")
        expect(@datos_4.accesibilidad).to eq("Accesibilidad no valido [1..5]")
        expect(@datos_4.seguridad).to eq("Seguridad no valido [1..10]")
        expect(@datos_4.seguridad).to eq("Seguridad no valido [1..10]")
        expect(@datos_2.to_s).not_to eq("Funcionalidades => (4) - (10) - (2) - (AparcamientoJavi) - (Cubierto) - (coches)")
      end
      it "Prevención de errores de la funcion 'numeros plazas' & 'numeros plazas libres'" do
        expect(@datos_4.plazas_ocupadaslibres).not_to eq("Conjunto plazas")
        expect(@datos_4.numero_plazas_libres).not_to eq("Numero plazas")
        expect(@datos_4.numero_plazas_libres).not_to eq(-1)
        expect(@datos_1.plazas_ocupadaslibres[3]).to eq(nil)
        expect(@datos_error.numero_plazas_libres).to eq("Error, tipo de plazas libres incorrectos")
        expect(@datos_error.numero_plazas).to eq("Error, tipo de plazas incorrecto")
      end
      it "No se espera que cada plaza tenga '4 atributos', ya que hay 3 atributos (altura, longitud y anchura)" do
        i = 0
        while i < @datos_5.plazas.size
          expect(@datos_5.plazas[i].size).to eq(4)
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