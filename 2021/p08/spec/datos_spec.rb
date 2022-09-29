require "spec_helper"

RSpec.describe Granja do

  before :each do
    @datos = Datos.new(1212,"Pepito","avícola", "Alto")
    #@datos_2 = Datos.new("2121","Juanito","ganadera", "Alto")
  end
  
  context "Representación de los Datos de una Granja - Granja::Datos" do
    
    context "Atributos de la clase Datos" do

      it "Tiene un atributo para la identificación la granja" do
        expect(@datos.identificacion).to eq(1212)
      end

      it "Tiene un atributo para el nombre de la granja" do
        expect(@datos.nombre).to eq("Pepito")
      end

      it "Tiene un atributo para el tipo de la granja (avícola o ganadera)" do
        expect(@datos.tipo).to eq("avícola")
      end

      it "Tiene un atributo para la descripción de la granja" do
        expect(@datos.descripcion).to eq("Alto")
      end
      
      it "Se obtiene una cadena con la información del animal correctamente formateada" do
        expect(@datos.to_s).to eq("1212,Pepito,avícola,Alto")
      end

    end

    context "Herencia de la clase Datos" do
      it "Se espera que una instancia de la clase Datos sea un Datos" do
        expect((@datos).is_a?Datos).to eq(true)
      end

      it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
        expect((@datos).is_a?Object).to eq(true)
      end

      it "Se espera que una instancia de la clase Datos sea un objeto básico (BasicObject)" do
        expect((@datos).is_a?BasicObject).to eq(true)
      end

      it "No se espera que una instancia de la clase Datos sea una cadena (String)" do
        expect((@datos).is_a?String).to eq(false)
      end
 
      it "No se espera que una instancia de la clase Datos sea un número (Numeric)" do
        expect((@datos).is_a?Numeric).to eq(false)
      end

    end

  end
end