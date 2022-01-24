RSpec.describe Granja do
  context "Lenguaje de Dominio especifo - DSL para las funcionalidades de la granja" do
    context "Granja::DSLFuncionalidad" do
      before :each do
        granja_1 = Granja::DSLGranja.new(12345678) do
          datos       "Pollos muertos",
                      :descripcion => "PyME - Pequena y mediana empresa",
                      :tipo => :pollos
          ejemplar    "12345678-00000001",
                      :edad => 365,
                      :peso => 700.2,
                      :precio_compra => 4.25,
                      :precio_venta => 4.75
          ejemplar    "12345678-00000002",
                      :edad => 465,
                      :peso => 1200.2,
                      :precio_compra => 1.25,
                      :precio_venta => 2.75
        end
        @funcionalidad = Granja::DSLFuncionalidad.new(12345678) do
          beneficio       granja_1
          bienestar       granja_1, :condiciones => :campo
          productividad   granja_1, :condiciones => :campo
        end            
      end
      context "Atributos de la clase DSLFuncionalidad" do
        it "Tiene una clase para almacenar las funcionalidades de la granja" do
            expect(@funcionalidad).not_to be(nil)
        end
        it "Tiene un metodo para calcular el beneficio de una granja" do
            expect(@funcionalidad.respond_to?(:beneficio)).to be(true)
        end
        it "Tiene un metodo para calcular el bienestar de una granja" do
            expect(@funcionalidad.respond_to?(:bienestar)).to be(true)
        end
        it "Tiene un metodo para calcular la productividad de una granja" do
            expect(@funcionalidad.respond_to?(:productividad)).to be(true)
        end
        it "Se obtiene una cadena con la informacion de las funcionalidades correctamente formateada" do
            expect(@funcionalidad.to_s).to eq("Funcionalidad:\nIdentificacion: 12345678\nBeneficio: 0.009036144578313253\nBienestar: 1.2905376344086021\nProductividad: 1\n")
        end
      end
    end
  end
end