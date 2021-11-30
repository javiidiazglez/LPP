RSpec.describe Granja do
  describe Datos do

    before :each do
      @d = Datos.new(1212, "Pepito","TipoA", "Es alto")
    end

    it "Tiene una clase para almacenar los datos de la granja" do
      expect(@d).not_to be_nil
    end

    it "Tiene un atributo para la identificación la granja" do
      expect(@d.identificacion).to eq(1212)
    end

    it "Tiene un atributo para el nombre de la granja" do
      expect(@d.nombre).to eq("Pepito")
    end

    it "Tiene un atributo para el tipo de la granja" do
      expect(@d.tipo).to eq("TipoA")
    end

    it "Tiene un atributo para la descripción de la granja" do
      expect(@d.descripcion).to eq("Es alto")
    end
  
  end

end