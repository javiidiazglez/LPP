require "spec_helper"

RSpec.describe Granja do

  context "Interfaz de las funcionalidades - Granja::Funcion" do

    context "Componentes del módulo Funcion" do

      it "Existe un módulo para almacenar las funcionalidades" do
        expect(Funcion).not_to eq(nil)
      end

      it "Existe una constante para representar las condiciones de vida (campo abierto, establo)" do
        expect(Funcion::CONDICION).to eq("campo abierto")
      end

      it "Existe un procedimiento para establecer los cuidados de los animales" do
        expect(Funcion::cuidado).to eq("cuidado del animal")
      end

      it "Existe un procedimiento para establecer la reproducción de los animales" do
        expect(Funcion::reproduccion).to eq("reproduccion favorable")
      end
    end

    context "Herencia del módulo Funcion" do

      it "Se espera que sea un objeto de la clase Module" do
      expect((Funcion).is_a?Module).to eq(true)      
    end

      it "Se espera que sea un objeto (Object)" do
        expect((Funcion).is_a?Object).to eq(true)
      end

      it "Se espera que sea un objeto básico (BasicObject)" do
        expect((Funcion).is_a?BasicObject).to eq(true)
      end

      it "No se espera que sea una instancia de la clase que representa una cadena (String)" do
        expect((Funcion).is_a?String).to eq(false)
      end
 
      it "No se espera que sea una instancia de la clase que representa un número (Numeric)" do
        expect((Funcion).is_a?Numeric).to eq(false)
      end
    end
    
  end

end