RSpec.describe Aparcamiento do
  it "Tiene un número de version, usando la sintaxis semántica X.Y.Z" do
    expect(Aparcamiento::VERSION).not_to be nil
  end
  describe Aparcamiento::Funcionalidades do
    before :all do
      # :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas, :conjunto_plazas
      @parking_1 = Aparcamiento::Datos.new(5, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ["libre", "ocupado", "ocupado", "ocupado", "ocupado"], [[3.6, 2.1, 2.0], [4.2, 2.7, 1.2]])
      @parking_2 = Aparcamiento::Datos.new(6, 5, 2, "AparcamientoPablo", :mixto, :autobuses, ["ocupado", "ocupado", "ocupado"], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2], [6.2, 5.7, 6.2]])
      @parking_3 = Aparcamiento::Datos.new(6, 5, 2, "AparcamientoDani", :cubierto, :bicicletas, ["libre", "libre"], [[3.1, 2.3, 2.1], [6.2, 5.7, 6.2]])
    end
    it "Tiene una clase para almacenar las funcionalidades" do
      expect(Aparcamiento::Funcionalidades).not_to eq(nil)
      expect(Aparcamiento::Funcionalidades).not_to be_nil
      expect(Aparcamiento::Funcionalidades).not_to be(nil)
    end
    it "No se espera una instancia de Funcionalidades" do
      expect(Aparcamiento::Funcionalidades.is_a?(Aparcamiento::Funcionalidades)).to eq(false)
    end
    it "Se cuenta con una constante para representar si el aparcamiento esta completo" do
      expect(Aparcamiento::Funcionalidades::COMPLETO).not_to be_nil
      expect(Aparcamiento::Funcionalidades::COMPLETO).to eq(:aparcamiento_completo)
    end
    it "Se cuenta con una constante para representar si el aparcamiento tiene plazas libres" do
      expect(Aparcamiento::Funcionalidades::LIBRE).not_to be_nil
      expect(Aparcamiento::Funcionalidades::LIBRE).to eq(:plazas_libres)
    end
    it "Se espera que el modulo Funcionalidades tengan un respond_to" do
      expect(Aparcamiento::Funcionalidades).to respond_to(:mostrar_estado_aparcamiento)
      expect(Aparcamiento::Funcionalidades).not_to respond_to(:estado_aparcamiento)
    end
    it "Se cuenta con funcion para mostrar estado de aparcamiento (completo, plazas libre)" do
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_1)).not_to be_nil
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_2)).to eq("aparcamiento_completo")
      expect(Aparcamiento::Funcionalidades::mostrar_estado_aparcamiento(@parking_3)).to eq("plazas_libres: 2")
    end
    it "Prevención de errores en las funcionalidades" do
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(-1)).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(1)).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento([1,1,1])).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento("Aparcamiento libre")).to eq("Error, tipo de plazas incorrecto")
      expect(Aparcamiento::Funcionalidades.mostrar_estado_aparcamiento(@parking_1)).to eq("plazas_libres: No tiene el mismo tamaño que plazas")
    end
  end
  describe Aparcamiento::Datos do
    before :all do
      # :accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas [0 ocupada, 1 libre], :conjunto_plazas
      @datos_1 = Aparcamiento::Datos.new(5, 5, 1, "AparcamientoElDios", :mixto, :autobuses, ["ocupado", "libre", "libre"], [[3.6, 2.1, 2.0], [4.2, 2.7, 1.2], [3.6, 2.1, 2.0]])
      @datos_2 = Aparcamiento::Datos.new(4, 10, 2, "AparcamientoJavi", :cubierto, :coches, ["ocupado", "ocupado", "ocupado"], [[5.2, 5.7, 4.2], [5.0, 5.1, 3.2], [7.2, 3.3, 1.2]])
      @datos_3 = Aparcamiento::Datos.new(6, 10, 3, "AparcamientoBajo", :aire_libre, :bicicletas, ["libre", "ocupado"], [[6.3, 2.3, 5.6], [3.1, 3.5, 3.3], [5.8, 5.2, 1.2], [6.1, 2.2, 5.0]])
      @datos_4 = Aparcamiento::Datos.new(8, 11, 4, "AparcamientoSolar", :aire_libre, :motos, ["libre", "libre", "libre"], [[4.3, 4.2, 8.0], [3.2, 6.1, 4.0], [9.2, 7.7, 4.2]])
      @datos_5 = Aparcamiento::Datos.new(9, 12, 3, "AparcamientoVago", :aire_libre, :bicicletas, ["libre", "libre", "ocupado"], [[4.3, 4.2, 8.0, 2.0], [3.2, 6.1, 4.0, 3.1], [9.2, 7.7, 4.2, 2.2]])
      @datos_6 = Aparcamiento::Datos.new("hola", "prueba", "hola", -1, "prueba", "ciclismo", "libre", "vector de 3")
    end
    it "Tiene una clase para almacenar los datos del aparcamiento" do
      expect(@datos_1).not_to be(nil)
      expect(@datos_1).not_to eq(nil)
      expect(@datos_1).not_to be_nil
      expect(@datos_2).not_to be(nil)
      expect(@datos_2).not_to eq(nil)
      expect(@datos_2).not_to be_nil
    end
    it "Se espera matchers de la clase Datos" do
      expect(@datos_2).to be_an(Aparcamiento::Datos)
      expect(@datos_3).to be_a_kind_of(Aparcamiento::Datos)
      expect(@datos_4).is_a?(Aparcamiento::Datos)
      expect(@datos_1.is_a?(Aparcamiento::Datos)).to eq(true)
      expect(@datos_1.class).to eq(Aparcamiento::Datos)
      expect(@datos_1.is_a? Object).to eq(true)
    end
    it "Se espera que los atributos de clase Datos tengan un respond_to" do
      expect(@datos_1).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas, :conjunto_plazas)
      expect(@datos_3).to respond_to(:accesibilidad, :seguridad, :id, :nombre, :descripcion, :tipo, :conjunto_libreuocupadas, :conjunto_plazas)
      expect(@datos_1).not_to respond_to(:edad)
    end
    it "Todo aparcamiento tiene el atributo de accesibilidad (1..5)" do
      expect(@datos_1.accesibilidad).not_to be_nil
      expect(@datos_1.accesibilidad).to eq(5)
      expect(@datos_2.accesibilidad).to eq(4)
      expect(@datos_2.accesibilidad).to be_between(1, 5)
      expect(@datos_3.accesibilidad).not_to eq(5)
      expect(@datos_4.accesibilidad).not_to eq(4)
    end
    it "Todo aparcamiento tiene el atributo de seguridad (1..10)" do
      expect(@datos_1.seguridad).not_to be_nil
      expect(@datos_1.seguridad).to eq(5)
      expect(@datos_2.seguridad).to eq(10)
      expect(@datos_2.seguridad).to be_between(1, 10)
      expect(@datos_3.accesibilidad).not_to eq(5)
      expect(@datos_4.accesibilidad).not_to eq(10)
    end
    it "Un aparcamiento tiene un atributo para su identificación" do
      expect(@datos_1.id).not_to be_nil
      expect(@datos_1.id).to eq(1)
      expect(@datos_2.id).to eq(2)
      expect(@datos_3.id).to eq(3)
    end
    it "Un aparcamiento tiene un atributo para su nombre comercial" do
      expect(@datos_1.nombre).not_to be_nil
      expect(@datos_1.nombre).to eq("AparcamientoElDios")
      expect(@datos_2.nombre).to eq("AparcamientoJavi")
      expect(@datos_3.nombre).to eq("AparcamientoBajo")
      expect(@datos_4.nombre).to eq("AparcamientoSolar")
    end
    it "Un aparcamiento tiene atributo para descripcion (Cubierto/Aire libre/Mixto)" do
      expect(@datos_1.descripcion).not_to be_nil
      expect(@datos_1.descripcion).to eq(:mixto)
      expect(@datos_2.descripcion).to eq(:cubierto)
      expect(@datos_3.descripcion).to eq(:aire_libre)
      expect(@datos_4.descripcion).to eq(:aire_libre)
    end
    it "Tiene atributo para tipo de aparcamiento (autobuses, bicicletas, coches, motos)" do
      expect(@datos_1.tipo).not_to be_nil
      expect(@datos_1.tipo).to eq(:autobuses)
      expect(@datos_2.tipo).to eq(:coches)
      expect(@datos_3.tipo).to eq(:bicicletas)
      expect(@datos_4.tipo).to eq(:motos)
    end
    it "Se espera que cada plaza tenga 3 atributos (altura, longitud y anchura)" do
      i = 0
      while i < @datos_1.conjunto_plazas.size
        expect(@datos_1.conjunto_plazas[i].size).to eq(3)
        i = i + 1
      end
      i = 0
      while i < @datos_2.conjunto_plazas.size
        expect(@datos_2.conjunto_plazas[i].size).to eq(3)
        i = i + 1
      end
      while i < @datos_3.conjunto_plazas.size
        expect(@datos_3.conjunto_plazas[i].size).to eq(3)
        i = i + 1
      end
      while i < @datos_4.conjunto_plazas.size
        expect(@datos_4.conjunto_plazas[i].size).to eq(3)
        i = i + 1
      end
    end 
    it "Tiene atributo para representar conjunto de plazas aparcamiento (altura, longitud, anchura)" do
      expect(@datos_1.conjunto_plazas[0]).not_to be_nil
      expect(@datos_1.conjunto_plazas[0]).to eq([3.6, 2.1, 2.0])
      expect(@datos_1.conjunto_plazas[0][0]).to eq(3.6)
      expect(@datos_1.conjunto_plazas[0][1]).to eq(2.1)
      expect(@datos_1.conjunto_plazas[0][2]).to eq(2.0)
      expect(@datos_1.conjunto_plazas[1]).to eq([4.2, 2.7, 1.2])
      expect(@datos_1.conjunto_plazas[1][0]).to eq(4.2)
      expect(@datos_1.conjunto_plazas[1][1]).to eq(2.7)
      expect(@datos_1.conjunto_plazas[1][2]).to eq(1.2)
      expect(@datos_1.conjunto_plazas).to eq([[3.6, 2.1, 2.0], [4.2, 2.7, 1.2], [3.6, 2.1, 2.0]])
      expect(@datos_2.conjunto_plazas).to eq([[5.2, 5.7, 4.2], [5.0, 5.1, 3.2], [7.2, 3.3, 1.2]])
      expect(@datos_3.conjunto_plazas).to eq([[6.3, 2.3, 5.6], [3.1, 3.5, 3.3], [5.8, 5.2, 1.2], [6.1, 2.2, 5.0]])
      expect(@datos_4.conjunto_plazas).to eq([[4.3, 4.2, 8.0], [3.2, 6.1, 4.0], [9.2, 7.7, 4.2]])
    end
    it "Tiene un atributo para representar el conjunto de plazas libres y ocupadas" do
      expect(@datos_1.conjunto_libreuocupadas).not_to be_nil
      expect(@datos_1.conjunto_libreuocupadas[0]).to eq("ocupado")
      expect(@datos_1.conjunto_libreuocupadas[1]).to eq("libre")
      expect(@datos_1.conjunto_libreuocupadas[2]).to eq("libre")
      expect(@datos_1.conjunto_libreuocupadas).to eq(["ocupado", "libre", "libre"])
      expect(@datos_2.conjunto_libreuocupadas).to eq(["ocupado", "ocupado", "ocupado"])
      expect(@datos_3.conjunto_libreuocupadas).to eq(["libre", "ocupado"])
      expect(@datos_4.conjunto_libreuocupadas).to eq( ["libre", "libre", "libre"])
    end
    it "Tiene un metodo para devolver el numero de plazas del aparcamiento" do
      expect(@datos_1.numero_plazas).not_to be_nil
      expect(@datos_1.numero_plazas).to eq(3)
      expect(@datos_2.numero_plazas).to eq(3)
      expect(@datos_3.numero_plazas).to eq(4)
      expect(@datos_4.numero_plazas).to eq(3)
      expect(@datos_1).to respond_to(:numero_plazas)
      expect(@datos_3.respond_to?(:numero_plazas)).to be(true)
    end
    it "Tiene un método para devolver el número de plazas libres del aparcamiento" do
      expect(@datos_1.numero_plazas_libres).not_to be_nil
      expect(@datos_2.numero_plazas_libres).to eq(0)
      expect(@datos_4.numero_plazas_libres).to eq(3)
      expect(@datos_1).to respond_to(:numero_plazas_libres)
      expect(@datos_3.respond_to?(:numero_plazas_libres)).to be(true)
    end
    it "Se obtiene una cadena con la información del coche correctamente formateada" do
      expect(@datos_1.to_s).to eq("Aparcamiento::Datos: => (5) - (5) - (1) - (AparcamientoElDios) - (mixto) - (autobuses) - ([\"ocupado\", \"libre\", \"libre\"]) - ([[3.6, 2.1, 2.0], [4.2, 2.7, 1.2], [3.6, 2.1, 2.0]])")
      expect(@datos_2.to_s).to eq("Aparcamiento::Datos: => (4) - (10) - (2) - (AparcamientoJavi) - (cubierto) - (coches) - ([\"ocupado\", \"ocupado\", \"ocupado\"]) - ([[5.2, 5.7, 4.2], [5.0, 5.1, 3.2], [7.2, 3.3, 1.2]])")
      expect(@datos_3.to_s).to eq("Aparcamiento::Datos: => (Accesibilidad no valido [1..5]) - (10) - (3) - (AparcamientoBajo) - (aire_libre) - (bicicletas) - ([\"libre\", \"ocupado\"]) - ([[6.3, 2.3, 5.6], [3.1, 3.5, 3.3], [5.8, 5.2, 1.2], [6.1, 2.2, 5.0]])")
    end
    it "Prevención de errores de los atributos datos" do
      expect(@datos_6.accesibilidad).to eq("Error: Tipo de accesibilidad no válido")
      expect(@datos_6.seguridad).to eq("Error: Tipo de seguridad no válido")
      expect(@datos_6.id).to eq("Error: Tipo de identificación no válido")
      expect(@datos_6.nombre).to eq("Error: Tipo de nombre no válido")
      expect(@datos_6.descripcion).to eq("Error: Tipo de descripcion no válido [cubierto/aire_libre/mixto]")
      expect(@datos_6.tipo).to eq("Error: Tipo no válido [cubierto/aire_libre/mixto]")
      expect(@datos_6.conjunto_libreuocupadas).to eq("Error: Tipo de conjunto libre-ocupado no válido")
      expect(@datos_6.conjunto_plazas).to eq("Error: Tipo de conjunto plazas no válido")
      expect(@datos_3.accesibilidad).to eq("Accesibilidad no valido [1..5]")
      expect(@datos_4.accesibilidad).to eq("Accesibilidad no valido [1..5]")
      expect(@datos_4.seguridad).to eq("Seguridad no valido [1..10]")
      expect(@datos_4.seguridad).to eq("Seguridad no valido [1..10]")
      expect(@datos_2.to_s).not_to eq("Funcionalidades => (4) - (10) - (2) - (AparcamientoJavi) - (Cubierto) - (coches)")
    end
    it "Prevención de errores de la funcion 'numeros plazas' & 'numeros plazas libres'" do
      expect(@datos_4.conjunto_libreuocupadas).not_to eq("Conjunto plazas")
      expect(@datos_4.numero_plazas_libres).not_to eq("Numero plazas")
      expect(@datos_4.numero_plazas_libres).not_to eq(-1)
      expect(@datos_1.conjunto_libreuocupadas[3]).to eq(nil)
      expect(@datos_3.numero_plazas_libres).to eq("No tiene el mismo tamaño que plazas")
      expect(@datos_6.numero_plazas_libres).to eq("Error, tipo de plazas libres incorrectos")
      expect(@datos_6.numero_plazas).to eq("Error, tipo de plazas incorrecto")
    end
    it "No se espera que cada plaza tenga '4 atributos', ya que hay 3 atributos (altura, longitud y anchura)" do
      i = 0
      while i < @datos_5.conjunto_plazas.size
        expect(@datos_5.conjunto_plazas[i].size).to eq(4)
        i = i + 1
      end
    end
  end
end
