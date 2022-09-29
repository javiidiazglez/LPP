RSpec.describe Granja do
  context "Lenguaje de Dominio especifo - DSL para los datos de la granja" do
    context "Granja::DSLGranja" do
      before :each do
        @granja_1 = Granja::DSLGranja.new(12345678) do
          datos       "Pollos muertos",
                      :descripcion => "PyME - Pequeña y mediana empresa",
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
      end
        context "Atributos de la clase DSLGranja" do
            it "Tiene una clase para almacenar los datos de la granja" do
                expect(@granja_1).not_to be(nil)
            end
            it "Tiene un metodo para los datos" do
                expect(@granja_1.respond_to?(:datos)).to be(true)
            end
            it "Tiene un metodo para los ejemplares" do
                expect(@granja_1.respond_to?(:ejemplar)).to be(true)
            end
            it "Se obtiene una cadena con la informacion de la granja correctamente formateada" do
                expect(@granja_1.to_s).to eq("DSLGranja: Identificación: 12345678, Nombre: Pollos muertos, Tipo: pollos, Descripción: PyME - Pequeña y mediana empresa\n\n1) Identificación: 12345678-00000001, Edad: 365 días, Peso: 700.2 gramos, Precio de compra: 4.25, Precio de venta: 4.75\n2) Identificación: 12345678-00000002, Edad: 465 días, Peso: 1200.2 gramos, Precio de compra: 1.25, Precio de venta: 2.75\n")
            end
        end
    end
  end
end