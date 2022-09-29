
RSpec.describe Granja do

  describe Funcion do

    before :each do
      @f = Funcion.new("Excelentes", "Cuidados sanos","Reproducción favorable")
    end

    it "Tiene una clase para almacenar las funcionalidades" do
      expect(@f).not_to eq(nil)
    end

    it "Tiene un atributo para las condiciones de vida de los animales" do
      expect(@f.condicion).to eq("Excelentes")
    end

    it "Tiene un atributo para los cuidados de los animales" do
      expect(@f.cuidados).to eq("Cuidados sanos")
    end

    it "Tiene un atributo para reproducción de la granja" do
      expect(@f.reproduccion).to eq("Reproducción favorable")
    end

  end

end