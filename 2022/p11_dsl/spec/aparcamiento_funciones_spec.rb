# RSpec.describe Aparcamiento do
#   before :all do
#     @vehiculo_1 = Aparcamiento::Vehiculo.new(55, 1.20, 3.401, 3.405, 3.5671)
#     @vehiculo_2 = Aparcamiento::Vehiculo.new(43, 2.1,  3, 5, 5)
#     @vehiculo_3 = Aparcamiento::Vehiculo.new(70, 30, 7.1, 10.5, 10.55)
#     @vehiculo_4 = Aparcamiento::Vehiculo.new(30, 10, 3.1, 8.5, 5)
    
#     @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3]
#     @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4]
#     @conjunto_vehiculos_3 = [@vehiculo_1, @vehiculo_2]

#     @datos_1 = Aparcamiento::Datos.new(1, 1, 55, "Las Aguas", :cubierto, :autobuses, [[3,4,5]], [true],1.0, 0, 1.0, @conjunto_vehiculos_1)
#     @datos_2 = Aparcamiento::Datos.new(5, 10, 66, "Toscal", :mixto, :bicicletas, [[3,4,5], [5,6,7]], [true, false],1.0, 1, 1.0, @conjunto_vehiculos_2)
#     @datos_3 = Aparcamiento::Datos.new(5, 5, 43, "La Ballena", :aire_libre, :coches, [[3,4,5], [5,6,7], [8,9,10]], [true, false, false], 1.0, 2, 1.0, @conjunto_vehiculos_3)
#   end
#   context "Interfaz de las funcionalidades - Aparcamiento::Funciones " do
#     it "Tiene un número de version, usando la sintaxis semántica X.Y.Z" do
#       expect(Aparcamiento::VERSION).not_to be nil
#     end
#     it "Tiene una clase para almacenar las funcionalidades" do
#       expect(Aparcamiento::Funcionalidades).not_to eq(nil)
#       expect(Aparcamiento::Funcionalidades).not_to be_nil
#       expect(Aparcamiento::Funcionalidades).not_to be(nil)
#     end
#     it "No se espera una instancia de Funcionalidades" do
#       expect(Aparcamiento::Funcionalidades.is_a?(Aparcamiento::Funcionalidades)).to eq(false)
#       expect(@datos_1).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
#       expect(@datos_2).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
#       expect(@datos_3).not_to be_an_instance_of(Aparcamiento::Funcionalidades)
#     end
#     it "Existe una constante para representar si el aparcamiento está completo" do
#       expect(Aparcamiento::Funcionalidades::COMPLETO).not_to be_nil
#       expect(Aparcamiento::Funcionalidades::COMPLETO).to eq("completo")
#     end
#     it "Existe una constante para representar si el aparcamiento tiene plazas libres" do
#       expect(Aparcamiento::Funcionalidades::LIBRE).not_to be_nil
#       expect(Aparcamiento::Funcionalidades::LIBRE).to eq("plazas libres")
#     end
#     it "Se espera que el modulo Funcionalidades tengan un respond_to" do
#       expect(Aparcamiento::Funcionalidades).to respond_to(:estado)
#       expect(Aparcamiento::Funcionalidades).not_to respond_to(:estado_aparcamiento)
#     end
#     it "Existe una funcion para mostrar el estado de un aparcamiento (completo, plazas libres)" do
#       plazas_1 = @datos_1.libres
#       expect(Aparcamiento::Funcionalidades::estado(plazas_1)).to eq "completo"
#       plazas_2 = @datos_2.libres
#       expect(Aparcamiento::Funcionalidades::estado(plazas_2)).to eq "plazas libres: 1"
#       plazas_3 = @datos_3.libres
#       expect(Aparcamiento::Funcionalidades::estado(plazas_3)).to eq "plazas libres: 2"
#     end
#     it "Se espera que exista una funcionalidad para determinar si un aparcamiento cumple con el porcentaje de reserva de plazas de minuválidos" do
#       expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_1, 1)).to eq "Cumple con reserva plazas minuválidos"
#       expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_2, 1)).to eq "Cumple con reserva plazas minuválidos"
#       expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_2, 0)).to eq "No cumple con reserva plazas minuválidos"
#       expect(Aparcamiento::Funcionalidades::reserva_minusvalidos(@datos_3, 4)).to eq "Cumple con reserva plazas minuválidos"
#     end
#     it "Se espera que exista una funcionalidad para determinar el número de plazas para minusválidos libres de un aparcamiento" do
#       expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_1)).to eq 0
#       expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_2)).to eq 1
#       expect(Aparcamiento::Funcionalidades::libre_minusvalidos(@datos_3)).to eq 2
#     end
#     it "Se espera que exista una funcionalidad para determinar el número de vehículos estacionados en un aparcamiento" do
#       expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_1)).to eq 3
#       expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_2)).to eq 4
#       expect(Aparcamiento::Funcionalidades::vehiculos_estacionados(@datos_3)).to eq 2
#     end
#   end
#   context "Herencia del módulo Aparcamiento" do
#     it "Se espera que los datos de un aparcamiento tenga una clase" do
#       expect(@datos_1).not_to be(nil)
#       expect(@datos_2).not_to eq(nil)
#       expect(@datos_3).not_to be_nil
#       expect((@datos_1).class).to eq(Aparcamiento::Datos)
#       expect((@datos_2).class).to eq(Aparcamiento::Datos)
#       expect((@datos_3).class).to eq(Aparcamiento::Datos)
#     end
#     it "Se espera que un aparcamiento sea un objeto de la clase (Module)" do
#       expect(Aparcamiento::Funcionalidades.is_a?Module).to eq(true)
#       expect(Aparcamiento::Funcionalidades.class).to eq(Module)
#       expect((@datos_1).is_a?Object).to eq(true)
#       expect((@datos_2).is_a?Object).to eq(true)
#       expect((@datos_3).is_a?Object).to eq(true)
#     end
#     it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
#       expect(Aparcamiento::Funcionalidades.is_a?Object).to eq(true)
#       expect((@datos_1).is_a?Object).to eq(true)
#       expect((@datos_2).is_a?Object).to eq(true)
#       expect((@datos_3).is_a?Object).to eq(true)
#       expect(@datos_1).to be_an(Object)
#     end
#     it "Se espera que un aparcamiento sea un objeto básico (BasicObject)" do
#       expect(Aparcamiento::Funcionalidades.is_a?BasicObject).to eq(true)
#       expect((@datos_1).is_a?BasicObject).to eq(true)
#       expect((@datos_2).is_a?BasicObject).to eq(true)
#       expect((@datos_3).is_a?BasicObject).to eq(true)
#       expect(@datos_1).to be_an(BasicObject)
#     end
#     it "No se espera que un aparcamiento sea un objeto sea una cadena (Class)" do
#       expect(Aparcamiento::Funcionalidades.is_a?Class).to eq(false)
#       expect((@datos_1).is_a?Class).to eq(false)
#       expect((@datos_2).is_a?Class).to eq(false)
#       expect((@datos_3).is_a?Class).to eq(false)
#       expect(@datos_1).not_to be_an(Class)
#     end
#     it "No se espera que un aparcamiento sea un objeto sea una cadena (String)" do
#       expect(Aparcamiento::Funcionalidades.is_a?String).to eq(false)
#       expect((@datos_1).is_a?String).to eq(false)
#       expect((@datos_2).is_a?String).to eq(false)
#       expect((@datos_3).is_a?String).to eq(false)
#       expect(@datos_1).not_to be_an(String)
#     end
#     it "No se espera que un aparcamiento sea un objeto sea un número (Numeric)" do
#       expect(Aparcamiento::Funcionalidades.is_a?Numeric).to eq(false)
#       expect((@datos_1).is_a?Numeric).to eq(false)
#       expect((@datos_2).is_a?Numeric).to eq(false)
#       expect((@datos_3).is_a?Numeric).to eq(false)
#       expect(@parking_1).not_to be_an(Numeric)
#     end
#     it "No se espera que un aparcamiento sea un vehículo" do
#       expect(Aparcamiento::Funcionalidades.is_a?Aparcamiento::Vehiculo).to eq(false)
#       expect(@datos_1).not_to be_an(Aparcamiento::Vehiculo)
#       expect((@datos_1).is_a?Aparcamiento::Vehiculo).to eq(false)
#       expect((@datos_2).is_a?Aparcamiento::Vehiculo).to eq(false)
#       expect((@datos_3).is_a?Aparcamiento::Vehiculo).to eq(false)
#     end
#     it "No se espera que un aparcamiento sea un vehículo a motor" do
#       expect(Aparcamiento::Funcionalidades.is_a?Aparcamiento::Motor).to eq(false)
#       expect(@datos_1).not_to be_an(Aparcamiento::Motor)
#       expect((@datos_1).is_a?Aparcamiento::Motor).to eq(false)
#       expect((@datos_2).is_a?Aparcamiento::Motor).to eq(false)
#       expect((@datos_3).is_a?Aparcamiento::Motor).to eq(false)
#     end
#   end
# end