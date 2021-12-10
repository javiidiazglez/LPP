require "spec_helper"

RSpec.describe Granja do

  before :each do
    @animal_1 = Animal.new(1212,2200,"Masculino",4000) 
    @animal_2 = Animal.new(1212,2500,"Masculino",5000) 

  end

  context "Representación de un Animal - Granja::Animal" do

    context "Atributos de la clase Animal" do

      it "Tiene una clase para representar Animal" do
        expect(@animal_1).not_to be_nil
      end

      it "Tiene un atributo para identificar al Animal" do
        expect(@animal_1.identificacion).to eq(1212)
      end

      it "Tiene un atributo con la edad del Animal en días" do
        expect(@animal_1.edad).to eq(2200)
      end

      it "Tiene un atributo con el sexo del Animal" do
        expect(@animal_1.sexo).to eq("Masculino")
      end

      it "Tiene un atributo con el peso del Animal en gramos" do
        expect(@animal_1.peso).to eq(4000)
      end

      it "Se obtiene una cadena con la información del Animal correctamente formateada" do
        expect(@animal_1.to_s).to eq("1212,2200,Masculino,4000")
      end
    end

    context "Herencia de la clase Animal" do

      it "Se espera que una instancia de la clase Animal sea un Animal" do
        #expect(@animal_1).is_a?Animal).to eq(true))
        expect(@animal_1).to be_a_kind_of(Animal)
      end

      it "Se espera que una instancia de la clase Animal sea un objeto (Object)" do
        #expect((@animal_1).is_a?Object).to eq(true)
        expect(@animal_1).to be_an(Object)
      end

      it "Se espera que una instancia de la clase Animal sea un objeto básico (BasicObject)" do
        expect((@animal_1).is_a?BasicObject).to eq(true)
      end

      it "No se espera que una instancia de la clase Animal sea una cadena (String)" do
        expect((@animal_1).is_a?String).to eq(false)
      end
 
      it "No se espera que una instancia de la clase Animal sea un número (Numeric)" do
        expect((@animal_1).is_a?Numeric).to eq(false)
      end

    end
    
    context "Comparable clase Animal" do

      it "Se espera Animal 1 < Animal 2 (4000 < 5000)" do
        expect(@animal_1 < @animal_2).to eq(true) 
      end

      it "No se espera Animal 1 > Animal 2 (4000 > 5000)" do
        expect(@animal_1 > @animal_2).to eq(false) 
      end

      it "Se espera Animal 1 == Animal 2 (4000 == 5000)" do
        expect(@animal_1 == @animal_2).to eq(false)
      end

      it "Se espera Animal 1 <= Animal 2 - (4000 <= 5000)" do
        expect(@animal_1 <= @animal_2).to eq(true)
      end

      it "No se espera Animal 1 >= Animal 2 (4000 >= 5000)" do
        expect(@animal_1 >= @animal_2).to eq(false)
      end

      # it "Se espera Animal 1 <=> Animal 2 (4000 < 5000)" do
      #   expect(@animal_1.peso <=> @animal_2.peso).to eq(-1) # animal_2 = -1
      # end

      # it "No se espera Animal 2 <=> Animal 1 (4000 > 5000)" do
      #   expect(@animal_2.peso <=> @animal_1.peso).to eq(1) # animal_1 = 1
      # end

      # it "Se espera Animal 1 == Animal 1 (4000 == 4000)" do
      #   expect(@animal_1.peso <=> @animal_1.peso).to eq(0) # animal_1 = 0
      # end

      # it "Se espera Animal 1 < Animal 2 (4000 < 5000)" do
      #   expect(@animal_1.peso < @animal_2.peso).to eq(true)
      # end

      # it "No se espera Animal 1 > Animal 2 - (4000 > 5000) " do
      #   expect(@animal_1.peso > @animal_2.peso).to eq(false)
      # end

      # it "No se espera Animal 1 == Animal 2 (4000 == 5000)" do
      #   expect(@animal_1.peso == @animal_2.peso).to eq(false)
      # end

      # it "Se espera Animal 1 <= Animal 2 - (4000 <= 5000)" do
      #   expect(@animal_1.peso <= @animal_2.peso).to eq(true)
      # end

      # it "No se espera Animal 1 >= Animal 2 (4000 >= 5000)" do
      #   expect(@animal_1.peso >= @animal_2.peso).to eq(false)
      # end
    end

    context "Contar clase Animal" do
      
      it "Contar el número de objetos que se instancia de la clase Animal" do
        expect(@animal_1.selfcount).to eq(34)
      end

    end
  end
end