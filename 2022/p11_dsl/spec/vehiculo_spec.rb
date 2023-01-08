require "spec_helper"

RSpec.describe Aparcamiento do
  context "Representación de un Vehículo - Aparcamiento::Vehículo" do
    before :all do
      @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
      @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
      @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
    end
    context "Atributos de la clase Vehículo" do
      it "Tiene una clase para representar vehículos" do
        expect(Aparcamiento::Vehiculo).not_to eq(nil)
        expect(Aparcamiento::Vehiculo).not_to be_nil
        expect(Aparcamiento::Vehiculo).not_to be(nil)
        expect(@vehiculo_1.class).to eq(Aparcamiento::Vehiculo)
      end
      it "Tiene un atributo para identificar al vehículo" do
        expect(@vehiculo_1.id).not_to be_nil
        expect(@vehiculo_1.id).to eq 55
        expect(@vehiculo_2.id).to eq 43
        expect(@vehiculo_3.id).to eq 70
      end
      it "Tiene un atributo con la altura en metros" do
        expect(@vehiculo_1.altura).not_to be_nil
        expect(@vehiculo_1.altura).to eq 1.20
        expect(@vehiculo_2.altura).to eq 2.1
        expect(@vehiculo_3.altura).to eq 30.0
      end
      it "Tiene un atributo con el ancho en metros" do
        expect(@vehiculo_1.ancho).not_to be_nil
        expect(@vehiculo_1.ancho).to eq 3.40
        expect(@vehiculo_2.ancho).to eq 3.0
        expect(@vehiculo_3.ancho).to eq 7.1
      end
      it "Tiene un atributo con el largo en metros" do
        expect(@vehiculo_1.largo).not_to be_nil
        expect(@vehiculo_1.largo).to eq 3.41
        expect(@vehiculo_2.largo).to eq 5.0
        expect(@vehiculo_3.largo).to eq 10.5
      end
      it "Tiene un atributo con el peso en toneladas" do
        expect(@vehiculo_1.peso).not_to be_nil
        expect(@vehiculo_1.peso).to eq 3.567
        expect(@vehiculo_2.peso).to eq 5.0
        expect(@vehiculo_3.peso).to eq 10.55
      end
      it "Se espera que los atributos de la clase Vehiculo tengan un respond_to" do
        expect(@vehiculo_1).to respond_to(:id, :altura, :ancho, :largo, :peso)
        expect(@vehiculo_2).to respond_to(:id, :altura, :ancho, :largo, :peso)
        expect(@vehiculo_3).to respond_to(:id, :altura, :ancho, :largo, :peso)
        expect(@vehiculo_1).not_to respond_to(:estado)
      end
      it "Se obtiene una cadena con la información del vehículo correctamente formateada" do
        expect(@vehiculo_1.to_s).to eq "Vehiculo{id: 55, altura: 1.2m, ancho: 3.4m, largo: 3.41m, peso: 3.567t}"
        expect(@vehiculo_2.to_s).to eq "Vehiculo{id: 43, altura: 2.1m, ancho: 3.0m, largo: 5.0m, peso: 5.0t}"
        expect(@vehiculo_3.to_s).to eq "Vehiculo{id: 70, altura: 30.0m, ancho: 7.1m, largo: 10.5m, peso: 10.55t}"
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
    context "Modulo Comparable - Enumerable para Vehiculos" do
      context "Enumerable Vehículos" do
        it "Se espera que una instancia del vehículo sea Enumerable" do
          expect(@vehiculo_1).is_a?(Enumerable)
          expect(@vehiculo_2).is_a?(Enumerable)
          expect(@vehiculo_3).is_a?(Enumerable)
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
          expect(@vehiculo_2 == @vehiculo_3).to be(false)
          expect(@vehiculo_2 <= @vehiculo_3).to be(true)
          expect(@vehiculo_2 >= @vehiculo_3).to be(false)
          expect(@vehiculo_1.between?(@vehiculo_1,@vehiculo_2)).to eq(true)
          expect(@vehiculo_1.between?(@vehiculo_2,@vehiculo_3)).to eq(false)
          expect(@vehiculo_2.between?(@vehiculo_2,@vehiculo_1)).to eq(false)
          expect(@vehiculo_2.between?(@vehiculo_3,@vehiculo_2)).to eq(false)
        end
      end
    end
    context "Contar instancias para Vehiculos" do 
      it "Se ha de contar el número de objetos que se instancia de la clase Vehículo." do
        expect(@vehiculo_1.count).to eq(21)
        expect(@vehiculo_2.count).to eq(21)
        expect(@vehiculo_3.count).to eq(21)
      end
    end
  end
  context "Representación de un Vehículo de motor - Aparcamiento::Motor" do
    before :all do
      @motor_1 = Aparcamiento::Motor.new(55, 1.20, 3.401, 3.405, 3.5671, 4, 4, 2500, 250)
      @motor_2 = Aparcamiento::Motor.new(43, 2.1,  3, 5, 5, 3, 3, 1000, 160)
      @motor_3 = Aparcamiento::Motor.new(70, 30, 7.1, 10.5, 10.55, 2, 2, 125, 80)
    end
    context "Atributos de la clase Motor" do
      it "Tiene una clase para representar vehículos de motor" do
        expect(Aparcamiento::Motor).not_to eq(nil)
        expect(Aparcamiento::Motor).not_to be_nil
        expect(Aparcamiento::Motor).not_to be(nil)
        expect(@motor_1.class).to eq(Aparcamiento::Motor)
      end
      it "Tiene un atributo para el número de plazas" do
        expect(@motor_1.n_plazas).not_to be_nil
        expect(@motor_1.n_plazas).to eq 4
        expect(@motor_2.n_plazas).to eq 3
        expect(@motor_3.n_plazas).to eq 2
      end
      it "Tiene un atributo para el número de ruedas" do
        expect(@motor_1.n_ruedas).not_to be_nil
        expect(@motor_1.n_ruedas).to eq 4
        expect(@motor_2.n_ruedas).to eq 3
        expect(@motor_3.n_ruedas).to eq 2
      end
      it "Tiene un atributo para la potencia del motor en centímetros cúbicos" do
        expect(@motor_1.cilindrada).not_to be_nil
        expect(@motor_1.cilindrada).to eq 2500
        expect(@motor_2.cilindrada).to eq 1000
        expect(@motor_3.cilindrada).to eq 125
      end
      it "Tiene un atributo para la velocidad máxima en kilómetros por hora" do
        expect(@motor_1.velocidad).not_to be_nil
        expect(@motor_1.velocidad).to eq 250
        expect(@motor_2.velocidad).to eq 160
        expect(@motor_3.velocidad).to eq 80
      end
      it "Se obtiene una cadena con la información del vehículo a motor correctamente formateada" do
        expect(@motor_1.to_s).to eq "Vehiculo a motor{id: 55, altura: 1.2m, ancho: 3.4m, largo: 3.41m, peso: 3.567t, n_ruedas: 4, n_plazas: 4, cilindrada: 2500cc, velocidad: 250km/h}"
        expect(@motor_2.to_s).to eq "Vehiculo a motor{id: 43, altura: 2.1m, ancho: 3.0m, largo: 5.0m, peso: 5.0t, n_ruedas: 3, n_plazas: 3, cilindrada: 1000cc, velocidad: 160km/h}"
        expect(@motor_3.to_s).to eq "Vehiculo a motor{id: 70, altura: 30.0m, ancho: 7.1m, largo: 10.5m, peso: 10.55t, n_ruedas: 2, n_plazas: 2, cilindrada: 125cc, velocidad: 80km/h}"
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
    context "Modulo Comparable - Enumerable para Motor" do
      context "Enumerable Motor" do
        it "Se espera que una instancia del vehículo de motor sea Enumerable" do
          expect(@motor_1).is_a?(Enumerable)
          expect(@motor_2).is_a?(Enumerable)
          expect(@motor_3).is_a?(Enumerable)
        end
      end
      context "Comparable Motor" do
        it "Se espera que una instancia del vehículo de motor sea comparable" do
          expect(@motor_1).is_a?(Comparable)
          expect(@motor_2).is_a?(Comparable)
          expect(@motor_3).is_a?(Comparable)
        end
        it "Se espera realizan comparaciones de vehiculo de motor usando modulo comparable" do
          expect(@motor_1 < @motor_2).to eq(false)
          expect(@motor_1 > @motor_2).to eq(true)
          expect(@motor_3 == @motor_2).to eq(false)
          expect(@motor_3 <= @motor_2).to eq(true)
          expect(@motor_3 >= @motor_2).to eq(false)      
          expect(@motor_1.between?(@motor_1,@motor_2)).to eq(false)
          expect(@motor_1.between?(@motor_2,@motor_1)).to eq(true)
          expect(@motor_2.between?(@motor_3,@motor_2)).to eq(true)
          expect(@motor_3.between?(@motor_1,@motor_3)).to eq(false)
        end
      end
    end
    context "Contar instancias para Vehiculos" do 
      it "Se ha de contar el número de objetos que se instancia de la clase Vehículo." do
        expect(@motor_1.count).to eq(24)
        expect(@motor_2.count).to eq(24)
        expect(@motor_3.count).to eq(24)
      end
    end
  end
end