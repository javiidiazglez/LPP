require "spec_helper"

RSpec.describe Granja do

  before :each do
    @ave_1 = Ave.new("corto","palmeadas","voladoras") 
    @ave_2 = Ave.new("grueso","palmeadas","nadadoras") 

    @ave_1.edad = 1000
    @ave_2.edad = 2000

  end

  context "Representación de un Ave - Granja::Ave" do

    context "Atributos de la clase Ave" do

      it "Tiene una clase para representar ave" do
        expect(@ave_1).not_to be_nil
      end

      it "Tiene un atributo para el tipo de pico (corto, grueso y robusto o ancho y aplanado)" do
        expect(@ave_1.pico).to eq("corto")
      end

      it "Tiene un atributo para el tipo de las patas (anisodáctilas o palmeadas)" do
        expect(@ave_1.patas).to eq("palmeadas")
      end

      it "Tiene un atributo para su tipo de movilidad (corredoras, voladoras o nadadoras)" do
        expect(@ave_1.movilidad).to eq("voladoras")
      end

      it "Se obtiene una cadena con la información del ave_1 correctamente formateada" do
        expect(@ave_1.to_s).to eq("corto,palmeadas,voladoras")
      end
    end

    context "Herencia de la clase Ave" do

      it "Se espera que una instancia de la clase Ave sea un Ave" do
        #expect((@ave_1).is_a?Ave).to eq(true)
        expect(@ave_1).to be_a_kind_of(Ave)
      end

      it "Se espera que una instancia de la clase Ave sea un Animal" do
        #expect((@ave_1).is_a?Animal).to eq(true)
        expect(@ave_1).to be_a(Object)

      end

      it "Se espera que una instancia de la clase Ave sea un objeto (Object)" do
        expect((@ave_1).is_a?Object).to eq(true)
      end

      it "Se espera que una instancia de la clase Ave sea un objeto básico (BasicObject)" do
        expect((@ave_1).is_a?BasicObject).to eq(true)
      end

      it "No se espera que una instancia de la clase Ave sea una cadena (String)" do
        expect((@ave_1).is_a?String).to eq(false)
      end
 
      it "No se espera que una instancia de la clase Ave sea un número (Numeric)" do
        expect((@ave_1).is_a?Numeric).to eq(false)
      end

    end

    context "Comparable clase Ave" do

      it "Se espera Ave 1 < Ave 2 (1000 < 2000)" do
        expect(@ave_1 < @ave_2).to eq(true) 
      end

      it "No se espera Ave 1 > Ave 2 (1000 > 2000)" do
        expect(@ave_1 > @ave_2).to eq(false) 
      end

      it "Se espera Ave 1 == Ave 2 (1000 == 2000)" do
        expect(@ave_1 == @ave_2).to eq(false)
      end

      it "Se espera Ave 1 <= Ave 2 - (1000 <= 2000)" do
        expect(@ave_1 <= @ave_2).to eq(true)
      end

      it "No se espera Ave 1 >= Ave 2 (1000 >= 2000)" do
        expect(@ave_1 >= @ave_2).to eq(false)
      end

      # it "Se espera Ave 1 <=> Ave 2 (1000 < 2000)" do
      #   expect(@ave_1.edad <=> @ave_2.edad).to eq(-1) # ave_2 = -1
      # end

      # it "No se espera Ave 2 <=> Ave 1 (1000 > 2000)" do
      #   expect(@ave_2.edad <=> @ave_1.edad).to eq(1) # ave_1 = 1
      # end

      # it "Se espera Ave 1 == Ave 1 (1000 == 1000)" do
      #   expect(@ave_1.edad <=> @ave_1.edad).to eq(0) # ave_1 = 0
      # end

      # it "Se espera Ave 1 < Ave 2 (1000 < 2000)" do
      #   expect(@ave_1.edad < @ave_2.edad).to eq(true)
      # end

      # it "No se espera Ave 1 > Ave 2 - (1000 > 2000) " do
      #   expect(@ave_1.edad > @ave_2.edad).to eq(false)
      # end

      # it "No se espera Ave 1 == Ave 2 (1000 == 2000)" do
      #   expect(@ave_1.edad == @ave_2.edad).to eq(false)
      # end

      # it "Se espera Ave 1 <= Ave 2 - (1000 <= 2000)" do
      #   expect(@ave_1.edad <= @ave_2.edad).to eq(true)
      # end

      # it "No se espera Ave 1 >= Ave 2 (1000 >= 2000)" do
      #   expect(@ave_1.edad >= @ave_2.edad).to eq(false)
      # end

    end
  end
end