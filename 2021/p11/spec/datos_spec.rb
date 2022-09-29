RSpec.describe Granja do
  context "Representacion de los Datos de una datos - datos::Datos" do
    before :each do
        @datos = Granja::Datos.new("Granja 1212","Pepito","avícola", "Granja alta")
    end
    context "Atributos de la clase Datos" do
      it "Tiene una clase para representar Datos" do
          expect(@datos).not_to be(nil)
      end
      it "Tiene un atributo para la identificacion la datos" do
          expect(@datos.identificacion).to eq("Granja 1212")
      end
      it "Tiene un atributo para el nombre de la datos" do  
          expect(@datos.nombre).to eq("Pepito")
      end
      it "Tiene un atributo para el tipo de la datos" do 
          expect(@datos.tipo).to eq("avícola")
      end
      it "Tiene un atributo para la descripcion de la datos" do 
          expect(@datos.descripcion).to eq("Granja alta")
      end
      it "Se obtiene una cadena con la informacion del animal correctamente formateada" do 
          expect(@datos.to_s).to eq("Identificación: Granja 1212, Nombre: Pepito, Tipo: avícola, Descripción: Granja alta")
      end
    end
    context "Herencia de la clase Datos" do
      it "Se espera que una instancia de la clase Datos sea un Datos" do 
          expect(@datos.is_a? Granja::Datos).to eq(true)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do 
          expect(@datos.is_a? Object).to eq(true)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto basico (BasicObject)" do 
          expect(@datos.is_a? BasicObject).to eq(true)
      end
      it "No se espera que una instancia de la clase Datos sea una cadena (String)" do 
          expect(@datos.is_a? String).to eq(false)
      end
      it "No se espera que una instancia de la clase Datos sea un numero (Numeric)" do 
          expect(@datos.is_a? Numeric).to eq(false)
      end
    end
  end
end
