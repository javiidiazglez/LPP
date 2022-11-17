require 'vehiculo'

describe Vehiculo do
  before :each do
    @conjunto_propietarios_1 = [[672917290, "Javier"], [672927610, "Pepe"]]
    @conjunto_propietarios_2 = [[672455214, "Dani"], [648991763, "Lucia"]]
    @conjunto_vacio = [] # nuevo no tienen propietario
    
    @coche_NUEVO = Vehiculo.new(01,"Ford",1990,"Cupra",100,600000, @conjunto_vacio)
    @coche_USADO = Vehiculo.new(10,"Hyundai",1990,"Volvo",20,155000, @conjunto_propietarios_1)
    @coche_2_USADO = Vehiculo.new(11,"Honda",2023,"BMW",30,200000, @conjunto_propietarios_2)
  end
 
  context "Representación de la clase Vehiculo" do
    it "Tiene una clase para representar la clase Vehiculo" do
      expect(@coche_USADO).not_to eq(nil) #matcher
      expect(@coche_USADO).not_to be_nil
      expect(@coche_2_USADO).not_to eq(nil) #matcher
      expect(@coche_2_USADO).not_to be_nil
      expect(@coche_NUEVO).not_to eq(nil) #matcher
      expect(@coche_NUEVO).not_to be_nil
    end
    it "Se espera una instancia de la Clase Vehiculo sea un coche" do
      expect(@coche_NUEVO).to be_an(Vehiculo)
      expect(@coche_USADO).to be_an(Vehiculo)
      expect(@coche_2_USADO).to be_an(Vehiculo)
      expect(@coche_2_USADO).to be_a(Vehiculo)
      expect(@coche_USADO).to be_a_kind_of(Vehiculo)
      expect(@coche_NUEVO).is_a?(Vehiculo)
      expect(@coche_NUEVO.is_a?Vehiculo).to eq(true)
    end
    it "Se espera que los atributos de clase Vehiculo tengan un respond_to" do
      expect(@coche_NUEVO).to respond_to(:num_identificacion, :fabricante, :año, :modelo, :millas, :precio, :propietarios)
      expect(@coche_USADO).to respond_to(:num_identificacion, :fabricante, :año, :modelo, :millas, :precio, :propietarios)
      expect(@coche_2_USADO).to respond_to(:num_identificacion, :fabricante, :año, :modelo, :millas, :precio, :propietarios)
      expect(@coche_2_USADO).not_to respond_to(:fabricas)
    end
    context "Atributos de la clase Vehiculo - Coche Ocasión & Segunda Mano" do
      it "Tiene un atributo para identificar al coche" do
        expect(@coche_USADO.num_identificacion).to eq(10)
        expect(@coche_2_USADO.num_identificacion).to eq(11)
        expect(@coche_2_USADO.num_identificacion).to eq(11)
        expect(@coche_2_USADO.num_identificacion).not_to eq(10)   
        expect(@coche_NUEVO.num_identificacion).to eq(01)
        expect(@coche_NUEVO.num_identificacion).not_to eq(11)   
      end
      it "Tiene un atributo para el fabricante del coche" do
        expect(@coche_USADO.fabricante).to eq("Hyundai")
        expect(@coche_2_USADO.fabricante).to eq("Honda")
        expect(@coche_2_USADO.fabricante).not_to eq("Ford")
        expect(@coche_NUEVO.fabricante).to eq("Ford")
        expect(@coche_NUEVO.fabricante).not_to eq("Honda")
      end
      it "Tiene un atributo con el año para al coche" do
        expect(@coche_USADO.año).to eq(1990)
        expect(@coche_2_USADO.año).to eq("Año no válido")
        expect(@coche_2_USADO.año).not_to eq(1992)
        expect(@coche_NUEVO.año).to eq(1990)
        expect(@coche_NUEVO.año).not_to eq(1991)
      end
      it "Tiene un atributo con el modelo para el coche" do
        expect(@coche_USADO.modelo).to eq("Volvo")
        expect(@coche_2_USADO.modelo).to eq("BMW")
        expect(@coche_2_USADO.modelo).not_to eq("Honda")
        expect(@coche_NUEVO.modelo).to eq("Cupra")
        expect(@coche_NUEVO.modelo).not_to eq("Ford")
      end
      it "Tiene un atributo con las millas para el coche" do
        expect(@coche_USADO.millas).to eq(20)
        expect(@coche_2_USADO.millas).to eq(30)
        expect(@coche_2_USADO.millas).not_to eq(31)
        expect(@coche_NUEVO.millas).to eq(100)
        expect(@coche_NUEVO.millas).not_to eq(99)
      end
      it "Tiene un atributo con el precio para el coche" do
        expect(@coche_USADO.precio).to eq(155000)
        expect(@coche_2_USADO.precio).to eq(200000)
        expect(@coche_2_USADO.precio).not_to eq(210000)
        expect(@coche_NUEVO.precio).to eq(600000)
        expect(@coche_NUEVO.precio).not_to eq(611111)
      end
      it "Tiene un atributo con el cojunto para el coche" do
        expect(@coche_USADO.propietarios).to eq([[672917290, "Javier"], [672927610, "Pepe"]])
        expect(@coche_2_USADO.propietarios).to eq([[672455214, "Dani"], [648991763, "Lucia"]])  
        expect(@coche_USADO.propietarios).to eq(@conjunto_propietarios_1)
        expect(@coche_2_USADO.propietarios).to eq(@conjunto_propietarios_2)  
        expect(@coche_USADO.propietarios[0]).to eq([672917290, "Javier"])  
        expect(@coche_USADO.propietarios[0][0]).to eq(672917290)  
        expect(@coche_USADO.propietarios[0][1]).to eq("Javier")  
        expect(@coche_USADO.propietarios[1][0]).to eq(672927610)  
        expect(@coche_USADO.propietarios[1][1]).to eq("Pepe")  
        expect(@coche_2_USADO.propietarios[0]).to eq([672455214, "Dani"])  
        expect(@coche_2_USADO.propietarios[0][0]).to eq(672455214)
        expect(@coche_2_USADO.propietarios[0][1]).to eq("Dani")
        expect(@coche_2_USADO.propietarios[1][0]).to eq(648991763)
        expect(@coche_2_USADO.propietarios[1][1]).to eq("Lucia")  
        expect(@coche_2_USADO.propietarios).not_to eq(@conjunto_propietarios_1)    
        expect(@coche_NUEVO.propietarios).to eq([])
        expect(@coche_NUEVO.propietarios).to eq(@conjunto_vacio)
        expect(@coche_NUEVO.propietarios).not_to eq([1,1]) 
      end
      it "Se obtiene una cadena con la información del coche correctamente formateada" do
        expect(@coche_USADO.to_s).to eq("Vehiculo: 10,Hyundai,1990,Volvo,20,155000,[[672917290, \"Javier\"], [672927610, \"Pepe\"]]")
        expect(@coche_2_USADO.to_s).to eq("Vehiculo: 11,Honda,Año no válido,BMW,30,200000,[[672455214, \"Dani\"], [648991763, \"Lucia\"]]")
        expect(@coche_2_USADO.to_s).not_to eq("Coche: 11,Honda,Año no válido,BMW,30,200000,[[672455214, \"Dani\"], [648991763, \"Lucia\"]]")
        expect(@coche_NUEVO.to_s).to eq("Vehiculo: 1,Ford,1990,Cupra,100,600000,[]")
        expect(@coche_NUEVO.to_s).not_to eq("Coche: 1,Ford,1990,Cupra,100,600000,[]")
      end
    end
    context "Tiene una funcionalidad de conversor de distancia" do
      it "Pasan conversor de galon imperial y devuelve la distancia en km" do
        expect(@coche_USADO.conversor_distancia(10, "galon_imperial")).to eq(909.2180000000001)
        expect(@coche_2_USADO.conversor_distancia(15, "galon_imperial")).to eq(2045.7404999999999)
        expect(@coche_NUEVO.conversor_distancia(30, "galon_imperial")).to eq(13638.27)
      end
      it "Pasan conversor de galon estadounidense y devuelve la distancia en km" do
        expect(@coche_USADO.conversor_distancia(40, "galon_estadounidense")).to eq(3028.0)
        expect(@coche_2_USADO.conversor_distancia(45, "galon_estadounidense")).to eq(5109.750000000001)
        expect(@coche_NUEVO.conversor_distancia(60, "galon_estadounidense")).to eq(22710.000000000004)
      end
      it "Pasan conversor de estadounidense a litros y devuelve la distancia en km" do
        expect(@coche_USADO.conversor_distancia(50, "litros")).to eq(1000)
        expect(@coche_2_USADO.conversor_distancia(55, "litros")).to eq(1650)
        expect(@coche_NUEVO.conversor_distancia(75, "litros")).to eq(7500)
      end
      it "Prevención de errores en las funcionalidades de conversor_distancia" do
        expect(@coche_USADO.conversor_distancia(70, "centilitros")).to eq("Unidad de medida no válido [imperial/estadounidense/litros]")
        expect(@coche_2_USADO.conversor_distancia(70, 3)).to eq("Unidad de medida no válido [imperial/estadounidense/litros]")
        expect(@coche_2_USADO.conversor_distancia(-70, 3)).to eq("Error en el parámetro [1...+infinito]")
        expect(@coche_NUEVO.conversor_distancia(-12, "centilitros")).to eq("Error en el parámetro [1...+infinito]")
        expect(@coche_USADO.conversor_distancia(-4, "litros")).to eq("Error en el parámetro [1...+infinito]")
      end
    end
  end
end