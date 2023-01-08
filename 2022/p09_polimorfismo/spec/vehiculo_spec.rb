require "spec_helper"

RSpec.describe Aparcamiento do
  before :all do
    #id, alto, ancho, largo, peso
    @vehiculo_1 = Aparcamiento::Vehiculo.new(5, 5.2, 1.5, 10.2, 500)
    @vehiculo_2 = Aparcamiento::Vehiculo.new(10, 10.2, 2.1, 20.5, 1000)
    @vehiculo_3 = Aparcamiento::Vehiculo.new(10, 10.2, 2.1, 20.5, 1000)
    @vehiculo_error = Aparcamiento::Vehiculo.new(-1, "5", -1, "10", -500)
    # id, alto, ancho, largo, peso, plazas, ruedas, centimetro, velocidad
    @motor_1 = Aparcamiento::Motor.new(5, 5.2, 1.5, 10.2, 500, 100, 4, 200, 120)
    @motor_2 = Aparcamiento::Motor.new(6, 6.2, 2.3, 20.5, 600, 200, 5, 400, 240)
    @motor_3 = Aparcamiento::Motor.new(6, 6.4, 2, 20, 600, 200, 5, 400, 240)
    @motor_error = Aparcamiento::Motor.new(-5, -5, "1", -10, "500", -100, -4, "200", -120)
    @motor_error_2 = Aparcamiento::Motor.new(-5, -5, "1", -10, "500", -100, -4, "200", -120)
  end
  context "Representación de un Vehículo - Aparcamiento::Vehículo" do
    context "Atributos de la clase Vehículo" do
      it "Tiene una clase para representar vehículos" do
        expect(Aparcamiento::Vehiculo).not_to eq(nil)
        expect(Aparcamiento::Vehiculo).not_to be_nil
        expect(Aparcamiento::Vehiculo).not_to be(nil)
        expect(@vehiculo_1.class).to eq(Aparcamiento::Vehiculo)
      end
      it "Tiene un atributo para identificar al vehículo" do
        expect(@vehiculo_1.id).not_to be_nil
        expect(@vehiculo_1.id).to eq(5)
        expect(@vehiculo_2.id).to eq(10)
        expect(@vehiculo_3.id).to eq(10)
      end
      it "Tiene un atributo con la altura en metros" do
        expect(@vehiculo_1.alto).not_to be_nil
        expect(@vehiculo_1.alto).to eq(5.2)
        expect(@vehiculo_2.alto).to eq(10.2)
        expect(@vehiculo_3.alto).to eq(10.2)
      end
      it "Tiene un atributo con el ancho en metros" do
        expect(@vehiculo_1.ancho).not_to be_nil
        expect(@vehiculo_1.ancho).to eq(1.5)
        expect(@vehiculo_2.ancho).to eq(2.1)
        expect(@vehiculo_3.ancho).to eq(2.1)
      end
      it "Tiene un atributo con el largo en metros" do
        expect(@vehiculo_1.largo).not_to be_nil
        expect(@vehiculo_1.largo).to eq(10.2)
        expect(@vehiculo_2.largo).to eq(20.5)
        expect(@vehiculo_3.largo).to eq(20.5)
      end
      it "Tiene un atributo con el peso en toneladas" do
        expect(@vehiculo_1.peso).not_to be_nil
        expect(@vehiculo_1.peso).to eq(500)
        expect(@vehiculo_2.peso).to eq(1000)
        expect(@vehiculo_3.peso).to eq(1000)
      end
      it "Se espera que los atributos de la clase Vehiculo tengan un respond_to" do
        expect(@vehiculo_1).to respond_to(:id, :alto, :ancho, :largo, :peso)
        expect(@vehiculo_2).to respond_to(:id, :alto, :ancho, :largo, :peso)
        expect(@vehiculo_3).to respond_to(:id, :alto, :ancho, :largo, :peso)
        expect(@vehiculo_1).not_to respond_to(:estado)
      end
      it "Se obtiene una cadena con la información del vehículo correctamente formateada" do
        expect(@vehiculo_1.to_s).to eq("Aparcamiento::Vehiculo: => (5) - (5.2) - (1.5) - (10.2) - (500)")
        expect(@vehiculo_2.to_s).to eq("Aparcamiento::Vehiculo: => (10) - (10.2) - (2.1) - (20.5) - (1000)")
        expect(@vehiculo_3.to_s).to eq("Aparcamiento::Vehiculo: => (10) - (10.2) - (2.1) - (20.5) - (1000)")
      end
    end
    context "Prevención de Errores - Aparcamiento::Vehiculo" do 
      it "Prevención de errores en la clase Vehiculo" do
        # id, alto, ancho, largo, peso
        #(-1, "5", -1, "10", -500)
        expect(@vehiculo_error.id).to eq("Identificación no valido, deben ser numeros positivos")
        expect(@vehiculo_error.alto).to eq("Error: Tipo de alto no válido")
        expect(@vehiculo_error.ancho).to eq("Ancho no valido, deben ser numeros positivos")
        expect(@vehiculo_error.largo).to eq("Error: Tipo de largo no válido")
        expect(@vehiculo_error.peso).to eq("Peso no valido, deben ser numeros positivos")
      end
    end
    context "Herencia de la clase Vehículo" do
      it "Se espera que una instancia de la clase Vehículo sea un Vehículo" do
        expect(@vehiculo_1).to be_a_kind_of(Aparcamiento::Vehiculo)
        expect((@vehiculo_1).is_a?Aparcamiento::Vehiculo).to eq(true)
        expect((@vehiculo_2).is_a?Aparcamiento::Vehiculo).to eq(true)
        expect((@vehiculo_3).is_a?Aparcamiento::Vehiculo).to eq(true)
        expect(@vehiculo_1).to be_an_instance_of(Aparcamiento::Vehiculo)
      end
      it "Se espera que una instancia de la clase Vehículo sea un objeto (Object)" do
        expect((@vehiculo_1).is_a?Object).to eq(true)
        expect(@vehiculo_1).to be_an(Object)
        expect(@vehiculo_2).to be_an(Object)
        expect(@vehiculo_3).to be_an(Object)
      end
      it "Se espera que una instancia de la clase Vehículo sea un objeto básico (BasicObject)" do
        expect((@vehiculo_1).is_a?BasicObject).to eq(true)
        expect(@vehiculo_1).to be_an(BasicObject)
        expect(@vehiculo_2).to be_an(BasicObject)
        expect(@vehiculo_3).to be_an(BasicObject)
      end
      it "Se espera que una instancia de la clase Motor sea una cadena (Class)" do
        expect(Aparcamiento::Vehiculo.is_a?Class).to eq(true)
        expect(Aparcamiento::Vehiculo.class).to eq(Class)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto de la clase (Module)" do
        expect(Aparcamiento::Vehiculo.is_a?Module).to eq(true)
        expect(Aparcamiento::Vehiculo.class.superclass).to eq(Module)
        expect((@vehiculo_1).is_a?Object).to eq(true)
        expect((@vehiculo_2).is_a?Object).to eq(true)
        expect((@vehiculo_3).is_a?Object).to eq(true)
      end
      it "No se espera que una instancia de la clase Vehículo sea una cadena (String)" do
        expect((@vehiculo_1).is_a?String).to eq(false)
        expect((@vehiculo_2).is_a?String).to eq(false)
        expect((@vehiculo_3).is_a?String).to eq(false)
        expect(@vehiculo_1).not_to be_an(String)
      end
      it "No se espera que una instancia de la clase Vehículo sea un número (Numeric)" do
        expect((@vehiculo_1).is_a?Numeric).to eq(false)
        expect((@vehiculo_2).is_a?Numeric).to eq(false)
        expect((@vehiculo_3).is_a?Numeric).to eq(false)
        expect(@vehiculo_1).not_to be_an(Numeric)
      end

    end
  end
  context "Representación de un Vehículo de motor - Aparcamiento::Motor" do
    context "Atributos de la clase Motor" do
      it "Tiene una clase para representar vehículos de motor" do
        expect(Aparcamiento::Motor).not_to eq(nil)
        expect(Aparcamiento::Motor).not_to be_nil
        expect(Aparcamiento::Motor).not_to be(nil)
        expect(@motor_1.class).to eq(Aparcamiento::Motor)
      end
      it "Tiene un atributo para el número de plazas" do
        expect(@motor_1.plazas).not_to be_nil
        expect(@motor_1.plazas).to eq(100)
        expect(@motor_2.plazas).to eq(200)
        expect(@motor_2.plazas).to eq(200)
      end
      it "Tiene un atributo para el número de ruedas" do
        expect(@motor_1.ruedas).not_to be_nil
        expect(@motor_1.ruedas).to eq(4)
        expect(@motor_2.ruedas).to eq(5)
        expect(@motor_3.ruedas).to eq(5)
      end
      it "Tiene un atributo para la potencia del motor en centímetros cúbicos" do
        expect(@motor_1.centimetro).not_to be_nil
        expect(@motor_1.centimetro).to eq(200)
        expect(@motor_2.centimetro).to eq(400)
        expect(@motor_2.centimetro).to eq(400)
      end
      it "Tiene un atributo para la velocidad máxima en kilómetros por hora" do
        expect(@motor_1.velocidad).not_to be_nil
        expect(@motor_1.velocidad).to eq(120)
        expect(@motor_2.velocidad).to eq(240)
        expect(@motor_3.velocidad).to eq(240)
      end
      it "Se obtiene una cadena con la información del vehículo a motor correctamente formateada" do
        expect(@motor_1.to_s).to eq("Aparcamiento::Motor: => (5) - (5.2) - (1.5) - (10.2) - (500) - (100) - (4) - (200) - (120)")
        expect(@motor_2.to_s).to eq("Aparcamiento::Motor: => (6) - (6.2) - (2.3) - (20.5) - (600) - (200) - (5) - (400) - (240)")
        expect(@motor_3.to_s).to eq("Aparcamiento::Motor: => (6) - (6.4) - (2) - (20) - (600) - (200) - (5) - (400) - (240)")
      end

    end
    context "Prevención de Errores - Aparcamiento::Motor" do 
      it "Prevención de errores en la clase Motor" do
        # id, alto, ancho, largo, peso, plazas, ruedas, centimetro, velocidad
        #(-5, -5, "1", -10, "500", -100, -4, "200", -120)
        expect(@motor_error.id).to eq("Identificación no valido, deben ser numeros positivos")
        expect(@motor_error.alto).to eq("Alto no valido, deben ser numeros positivos")
        expect(@motor_error.ancho).to eq("Error: Tipo de ancho no válido")
        expect(@motor_error.largo).to eq("Largo no valido, deben ser numeros positivos")
        expect(@motor_error.peso).to eq("Error: Tipo de peso no válido")
        expect(@motor_error.plazas).to eq("Plazas no valido, deben ser numeros positivos")
        expect(@motor_error.ruedas).to eq("Ruedas no valido, deben ser numeros positivos")
        expect(@motor_error.centimetro).to eq("Error: Tipo de centimetro no válido")
        expect(@motor_error.velocidad).to eq("Velocidad no valido, deben ser numeros positivos")
      end
    end
    context "Herencia de la clase Motor" do
      it "Se espera que una instancia de la clase Motor sea un vehículo de motor" do
        expect(@motor_1).to be_a_kind_of(Aparcamiento::Motor)
        expect((@motor_1).is_a?Aparcamiento::Motor).to eq(true)
        expect((@motor_2).is_a?Aparcamiento::Motor).to eq(true)
        expect((@motor_3).is_a?Aparcamiento::Motor).to eq(true)
      end
      it "Se espera que una instancia de la clase Motor sea un Vehículo" do
        expect(@motor_1).to be_a_kind_of(Aparcamiento::Vehiculo)
        expect((@motor_1).is_a?Aparcamiento::Vehiculo).to eq(true)
        expect((@motor_2).is_a?Aparcamiento::Vehiculo).to eq(true)
        expect((@motor_3).is_a?Aparcamiento::Vehiculo).to eq(true)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto (Object)" do
        expect(Aparcamiento::Motor.is_a?Object).to eq(true)
        expect((@motor_1).is_a?Object).to eq(true)
        expect(@motor_1).to be_an(Object)
        expect(@motor_2).to be_an(Object)
        expect(@motor_3).to be_an(Object)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto básico (BasicObject)" do
        expect(Aparcamiento::Motor.is_a?BasicObject).to eq(true)
        expect((@motor_1).is_a?BasicObject).to eq(true)
        expect(@motor_1).to be_an(BasicObject)
        expect(@motor_2).to be_an(BasicObject)
        expect(@motor_3).to be_an(BasicObject)
      end
      it "Se espera que una instancia de la clase Motor sea una cadena (Class)" do
        expect(Aparcamiento::Motor.is_a?Class).to eq(true)
        expect(Aparcamiento::Motor.class).to eq(Class)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto de la clase (Module)" do
        expect(Aparcamiento::Motor.is_a?Module).to eq(true)
        expect(Aparcamiento::Motor.class.superclass).to eq(Module)
        expect((@motor_1).is_a?Object).to eq(true)
        expect((@motor_2).is_a?Object).to eq(true)
        expect((@motor_3).is_a?Object).to eq(true)
      end
      it "No se espera que una instancia de la clase Motor sea una cadena (String)" do
        expect(Aparcamiento::Motor.is_a?String).to eq(false)
        expect((@motor_1).is_a?String).to eq(false)
        expect((@motor_2).is_a?String).to eq(false)
        expect((@motor_3).is_a?String).to eq(false)
        expect(@motor_1).not_to be_an(String)
      end
      it "No se espera que una instancia de la clase Motor sea un número (Numeric)" do
        expect(Aparcamiento::Motor.is_a?Numeric).to eq(false)
        expect((@motor_1).is_a?Numeric).to eq(false)
        expect((@motor_2).is_a?Numeric).to eq(false)
        expect((@motor_3).is_a?Numeric).to eq(false)
        expect(@motor_1).not_to be_an(Numeric)
      end
      it "Se espera que una instancia del vehículo de motor sea Enumerable" do
        expect(@motor_1).is_a?(Enumerable)
        expect(@motor_2).is_a?(Enumerable)
        expect(@motor_3).is_a?(Enumerable)
      end
    end
  end
  context "Contar instancias (Vehiculo - Motor)" do 
    it "Se ha de contar el número de objetos que se instancia de la clase Vehículo." do
      expect(@vehiculo_1.count).to eq(26)
      expect(@vehiculo_error.count).to eq(26)
    end
    it "Se ha de contar el número de objetos que se instancia de la clase Motor." do
      expect(@motor_1.count).to eq(26)
      expect(@motor_error.count).to eq(26)
    end
  end
  context "Modulo Comparable - Enumerable" do
    context "Enumerable Vehículos" do
      it "Se espera que una instancia del vehículo sea Enumerable" do
        expect(@vehiculo_1).is_a?(Enumerable)
        expect(@vehiculo_2).is_a?(Enumerable)
        expect(@vehiculo_3).is_a?(Enumerable)
      end
    end
    context "Enumerable Motor" do
      it "Se espera que una instancia del vehículo de motor sea Enumerable" do
        expect(@motor_1).is_a?(Enumerable)
        expect(@motor_2).is_a?(Enumerable)
        expect(@motor_3).is_a?(Enumerable)
      end
    end
    context "Comparable Vehículos" do
      it "Se espera que una instancia del vehículo sea comparable" do
        expect(@vehiculo_1).is_a?(Comparable)
        expect(@vehiculo_2).is_a?(Comparable)
        expect(@vehiculo_3).is_a?(Comparable)
      end
      it "Se espera realizan comparaciones de vehiculo usando modulo comparable" do
        expect(@vehiculo_1 < @vehiculo_2).to eq(true) 
        expect(@vehiculo_1 > @vehiculo_2).to be(false)
        expect(@vehiculo_2 == @vehiculo_3).to be(true)
        expect(@vehiculo_2 <= @vehiculo_3).to be(true)
        expect(@vehiculo_2 >= @vehiculo_3).to be(true)
        expect(@vehiculo_1.between?(@vehiculo_1,@vehiculo_2)).to eq(true)
        expect(@vehiculo_1.between?(@vehiculo_2,@vehiculo_3)).to eq(false)
        expect(@vehiculo_2.between?(@vehiculo_2,@vehiculo_1)).to eq(false)
        expect(@vehiculo_2.between?(@vehiculo_3,@vehiculo_2)).to eq(true)
      end
      context "Comparable Motor" do
        it "Se espera que una instancia del vehículo de motor sea comparable" do
          expect(@motor_1).is_a?(Comparable)
          expect(@motor_2).is_a?(Comparable)
          expect(@motor_3).is_a?(Comparable)
        end
        it "Se espera realizan comparaciones de vehiculo de motor usando modulo comparable" do
          expect(@motor_1 < @motor_2).to eq(true)
          expect(@motor_1 > @motor_2).to eq(false)
          expect(@motor_3 == @motor_2).to eq(true)
          expect(@motor_3 <= @motor_2).to eq(true)
          expect(@motor_3 >= @motor_2).to eq(true)      
          expect(@motor_1.between?(@motor_1,@motor_2)).to eq(true)
          expect(@motor_1.between?(@motor_2,@motor_1)).to eq(false)
          expect(@motor_2.between?(@motor_3,@motor_2)).to eq(true)
          expect(@motor_3.between?(@motor_1,@motor_3)).to eq(true)
        end
      end
    end
  end
end