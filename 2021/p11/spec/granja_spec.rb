#frozen_string_literal: true

RSpec.describe Granja do

  # it "Tiene un número de versión: Version 1.0.0" do
  #   expect(Granja::VERSION).not_to be nil
  # end

  # before :each do

  #   @pollo1 = Granja::Ave.new("corto","palmeadas","voladoras") 
  #   @pollo2 = Granja::Ave.new("grueso","palmeadas","nadadoras") 
  #   @vector_aves = [@pollo1, @pollo2]

  #   @avicola = Granja::Avicola.new("pollo","huevos",2,100,200,"ave macho robusto",@vector_aves,"establo")

  #   @animal_1 = Granja::Animal.new(1212,300,"Masculino",4000) #identificacion, edad, sexo, peso
  #   @animal_2 = Granja::Animal.new(1212,400,"Masculino",5000)
  #   @animal_3 = Granja::Animal.new(1212,500,"Masculino",6000)
  #   @animal_4 = Granja::Animal.new(1212,1000,"Masculino",7000)
  #   @vector_animales = [@animal_1, @animal_2, @animal_3, @animal_4]

  #   @avicola_animales = Granja::Avicola.new("pollo","huevos",2,100,200,"ave macho robusto",@vector_animales,"establo")

  #   @datos = Granja::Datos.new(1212,"Pepito","avícola", "Alto")
  # end

  # context "Práctica 8." do
  #   context "Representación de un Animal - Granja::Animal" do
  #     context "Atributos de la clase Animal" do
  #       it "Tiene una clase para representar Animal" do
  #         expect(@animal_1).not_to be_nil
  #       end
  #       it "Tiene un atributo para identificar al Animal" do
  #         expect(@animal_1.identificacion).to eq(1212)
  #       end
  #       it "Tiene un atributo con la edad del Animal en días" do
  #         expect(@animal_1.edad).to eq(300)
  #       end
  #       it "Tiene un atributo con el sexo del Animal" do
  #         expect(@animal_1.sexo).to eq("Masculino")
  #       end
  #       it "Tiene un atributo con el peso del Animal en gramos" do
  #         expect(@animal_1.peso).to eq(4000)
  #       end
  #       it "Se obtiene una cadena con la información del Animal correctamente formateada" do
  #         expect(@animal_1.to_s).to eq("1212,300,Masculino,4000")
  #       end
  #     end
  #     context "Herencia de la clase Animal" do
  #       it "Se espera que una instancia de la clase Animal sea un Animal" do
  #         #expect(@animal_1).is_a?Animal).to eq(true))
  #         expect(@animal_1).to be_a_kind_of(Granja::Animal)
  #       end
  #       it "Se espera que una instancia de la clase Animal sea un objeto (Object)" do
  #         #expect((@animal_1).is_a?Object).to eq(true)
  #         expect(@animal_1).to be_an(Object)
  #       end
  #       it "Se espera que una instancia de la clase Animal sea un objeto básico (BasicObject)" do
  #         expect((@animal_1).is_a?BasicObject).to eq(true)
  #       end
  #       it "No se espera que una instancia de la clase Animal sea una cadena (String)" do
  #         expect((@animal_1).is_a?String).to eq(false)
  #       end
  #       it "No se espera que una instancia de la clase Animal sea un número (Numeric)" do
  #         expect((@animal_1).is_a?Numeric).to eq(false)
  #       end
  #     end
  #     context "Comparable clase Animal" do
  #       it "Se espera Animal 1 < Animal 2 (4000 < 5000)" do
  #         expect(@animal_1 < @animal_2).to eq(true) 
  #       end
  #       it "No se espera Animal 1 > Animal 2 (4000 > 5000)" do
  #         expect(@animal_1 > @animal_2).to eq(false) 
  #       end
  #       it "Se espera Animal 1 == Animal 2 (4000 == 5000)" do
  #         expect(@animal_1 == @animal_2).to eq(false)
  #       end
  #       it "Se espera Animal 1 <= Animal 2 - (4000 <= 5000)" do
  #         expect(@animal_1 <= @animal_2).to eq(true)
  #       end
  #       it "No se espera Animal 1 >= Animal 2 (4000 >= 5000)" do
  #         expect(@animal_1 >= @animal_2).to eq(false)
  #       end
  #     end
  #     context "Contar clase Animal" do
  #       it "Contar el número de objetos que se instancia de la clase Animal" do
  #         expect(@animal_1.get_count).to eq(272)
  #       end
  #     end
  #   end
  #   context "Representación de un Ave - Granja::Ave" do
  #     context "Atributos de la clase Ave" do
  #       it "Tiene una clase para representar ave" do
  #         expect(@pollo1).not_to be_nil
  #       end
  #       it "Tiene un atributo para el tipo de pico (corto, grueso y robusto o ancho y aplanado)" do
  #         expect(@pollo1.pico).to eq("corto")
  #       end
  #       it "Tiene un atributo para el tipo de las patas (anisodáctilas o palmeadas)" do
  #         expect(@pollo1.patas).to eq("palmeadas")
  #       end
  #       it "Tiene un atributo para su tipo de movilidad (corredoras, voladoras o nadadoras)" do
  #         expect(@pollo1.movilidad).to eq("voladoras")
  #       end
  #       it "Se obtiene una cadena con la información del pollo1 correctamente formateada" do
  #         expect(@pollo1.to_s).to eq("corto,palmeadas,voladoras")
  #       end
  #     end
  #     context "Herencia de la clase Ave" do
  #       it "Se espera que una instancia de la clase Ave sea un Ave" do
  #         #expect((@pollo1).is_a?Granja::Ave).to eq(true)
  #         expect(@pollo1).to be_a_kind_of(Granja::Ave)
  #       end
  #       it "Se espera que una instancia de la clase Ave sea un Animal" do
  #         #expect((@pollo1).is_a?Granja::Animal).to eq(true)
  #         expect(@pollo1).to be_a(Granja::Animal)
  #       end
  #       it "Se espera que una instancia de la clase Ave sea un objeto (Object)" do
  #         expect((@pollo1).is_a?Object).to eq(true)
  #       end
  #       it "Se espera que una instancia de la clase Ave sea un objeto básico (BasicObject)" do
  #         expect((@pollo1).is_a?BasicObject).to eq(true)
  #       end
  #       it "No se espera que una instancia de la clase Ave sea una cadena (String)" do
  #         expect((@pollo1).is_a?String).to eq(false)
  #       end
  #       it "No se espera que una instancia de la clase Ave sea un número (Numeric)" do
  #         expect((@pollo1).is_a?Numeric).to eq(false)
  #       end
  #     end
  #     context "Comparable clase Ave" do
  #       it "Se espera Ave 1 < Ave 2 (1000 < 2000)" do
  #         expect(@pollo1 < @pollo2).to eq(false) 
  #       end
  #       it "No se espera Ave 1 > Ave 2 (1000 > 2000)" do
  #         expect(@pollo1 > @pollo2).to eq(false) 
  #       end
  #       it "Se espera Ave 1 == Ave 2 (1000 == 2000)" do
  #         expect(@pollo1 == @pollo2).to eq(true)
  #       end
  #       it "Se espera Ave 1 <= Ave 2 - (1000 <= 2000)" do
  #         expect(@pollo1 <= @pollo2).to eq(true)
  #       end
  #       it "No se espera Ave 1 >= Ave 2 (1000 >= 2000)" do
  #         expect(@pollo1 >= @pollo2).to eq(true)
  #       end
  #     end
  #   end
  # context "Representación de los Datos de una Granja - Granja::Datos" do
  #   context "Atributos de la clase Datos" do
  #     it "Tiene un atributo para la identificación la granja" do
  #       expect(@datos.identificacion).to eq(1212)
  #     end
  #     it "Tiene un atributo para el nombre de la granja" do
  #       expect(@datos.nombre).to eq("Pepito")
  #     end
  #     it "Tiene un atributo para el tipo de la granja (avícola o ganadera)" do
  #       expect(@datos.tipo).to eq("avícola")
  #     end
  #     it "Tiene un atributo para la descripción de la granja" do
  #       expect(@datos.descripcion).to eq("Alto")
  #     end
  #     it "Se obtiene una cadena con la información del animal correctamente formateada" do
  #       expect(@datos.to_s).to eq("1212,Pepito,avícola,Alto")
  #     end
  #   end
  #   context "Herencia de la clase Datos" do
  #     it "Se espera que una instancia de la clase Datos sea un Datos" do
  #       expect((@datos).is_a?Granja::Datos).to eq(true)
  #     end
  #     it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
  #       expect((@datos).is_a?Object).to eq(true)
  #     end
  #     it "Se espera que una instancia de la clase Datos sea un objeto básico (BasicObject)" do
  #       expect((@datos).is_a?BasicObject).to eq(true)
  #     end
  #     it "No se espera que una instancia de la clase Datos sea una cadena (String)" do
  #       expect((@datos).is_a?String).to eq(false)
  #     end
  #     it "No se espera que una instancia de la clase Datos sea un número (Numeric)" do
  #       expect((@datos).is_a?Numeric).to eq(false)
  #     end
  #   end
  # end
  #   context "Interfaz de las funcionalidades - Granja::Funcion" do
  #     context "Componentes del módulo Funcion" do
  #       it "Existe un módulo para almacenar las funcionalidades" do
  #         expect(Granja::Funcion).not_to eq(nil)
  #       end
  #       it "Existe una constante para representar las condiciones de vida (campo abierto, establo)" do
  #         expect(Granja::Funcion::CONDICION).to eq("campo abierto")
  #       end
  #       it "Existe un procedimiento para establecer los cuidados de los animales" do
  #         expect(Granja::Funcion::cuidado).to eq("cuidado del animal")
  #       end
  #       it "Existe un procedimiento para establecer la reproducción de los animales" do
  #         expect(Granja::Funcion::reproduccion).to eq("reproduccion favorable")
  #       end
  #     end
  #     context "Herencia del módulo Funcion" do
  #       it "Se espera que sea un objeto de la clase Module" do
  #         expect((Granja::Funcion).is_a?Module).to eq(true)      
  #       end
  #       it "Se espera que sea un objeto (Object)" do
  #         expect((Granja::Funcion).is_a?Object).to eq(true)
  #       end
  #       it "Se espera que sea un objeto básico (BasicObject)" do
  #         expect((Granja::Funcion).is_a?BasicObject).to eq(true)
  #       end
  #       it "No se espera que sea una instancia de la clase que representa una cadena (String)" do
  #         expect((Granja::Funcion).is_a?String).to eq(false)
  #       end
  #       it "No se espera que sea una instancia de la clase que representa un número (Numeric)" do
  #         expect((Granja::Funcion).is_a?Numeric).to eq(false)
  #       end
  #     end   
  #   end
  # end
  # context "Práctica 9." do
  #   context "Representación de la clase Avícola de una Granja - Granja::Avicola" do
  #     context "Herencia de la clase Avícola" do
  #       it "Se espera que una instancia de la clase Avícola sea una granja Avicola" do
  #         expect(@avicola.instance_of?Granja::Avicola).to eq(true)
  #         #expect(@avicola).to be_a_kind_of(Granja::Avicola)
  #         #expect(@avicola.is_a?Granja::Avicola).to eq(true)
  #       end
  #       it "Se espera que una instancia de la clase Avícola sea un Dato" do
  #         expect(@avicola).to be_a_kind_of(Granja::Datos)
  #         #expect(@avicola.is_a?Granja::Datos).to eq(true)
  #       end
  #       it "Se espera que una instancia de la clase Avícola sea un Object" do
  #         expect(@avicola.is_a?Object).to eq(true)
  #       end
  #       it "Se espera que una instancia de la clase Avícola sea un Basic Object" do
  #         expect(@avicola.is_a?BasicObject).to eq(true)
  #       end
  #       it "No se espera que una instancia de la clase Avícola sea un Animal" do
  #         expect(@avicola).not_to be_a(Granja::Animal)    
  #         #expect(@avicola.is_a?Granja::Animal).to eq(false)
  #       end
  #       it "No se espera que una instancia de la clase Avícola sea un Ave" do
  #         expect(@avicola.is_a?Granja::Ave).to eq(false)
  #         #expect(@avicola).not_to be_a(Granja::Ave)    
  #       end
  #     end
  #     context "Atributos de la clase Avícola" do
  #       it "Tiene una clase para almacenar los datos de la granja" do
  #         expect(@avicola).not_to be_nil
  #       end
  #       it "Tiene un atributo para el tipo de aves (gansos, pollos, patos, pavos)" do
  #         expect(@avicola.tipo_aves).to eq("pollo")
  #       end
  #       it "Tiene un atributo para el destino de los animales (huevos, sacrificio)" do
  #         expect(@avicola.destino).to eq("huevos")
  #       end
  #       it "Tiene un atributo para el número de aves de la granja" do
  #         expect(@avicola.numeros_aves).to eq(2)
  #       end
  #       it "Tiene un atributo para el precio unitario de los animales" do
  #         expect(@avicola.precio_compra).to eq(100)
  #       end
  #       it "Tiene un atributo para el precio de venta unitario de los animales" do
  #         expect(@avicola.precio_venta).to eq(200)
  #       end
  #       it "Tiene un atributo para almacenar las aves de la granja" do
  #         expect(@avicola.informacion).to eq("ave macho robusto")
  #       end
  #       it "Se obtiene una cadena con la información de la granja avícola correctamente formateada" do
  #         expect(@avicola.to_s).to eq("pollo,huevos,2,100,200,ave macho robusto,corto,palmeadas,voladoras, grueso,palmeadas,nadadoras")
  #       end
  #     end
  #     context "Enumerables de la clase Avícola" do
  #       it "Se espera clase Avicola sea Enumerable" do
  #         expect(@avicola).to be_a(Enumerable)   
  #       end
  #       it "Se espera el método All" do
  #         expect(@avicola.all?Numeric).to eq(true)    
  #       end
  #       it "Se espera el método Min" do
  #         expect(@avicola.min).to eq(2)   
  #       end
  #       it "Se espera el método Max" do
  #         expect(@avicola.max).to eq(200)   
  #       end
  #       it "Se espera el método Sort" do
  #         expect(@avicola.sort).to eq([2,100,200])   
  #       end
  #       it "Se espera el método Each (numeros_aves)" do
  #         expect(@avicola.each{ |numeros_aves| numeros_aves}).to eq(200)   
  #       end
  #       it "Se espera el método Collect" do
  #         expect(@avicola.collect { |i| i * 3 }).to eq([6,300,600])
  #       end
  #       it "Se espera el método Any" do
  #         expect(@avicola.any?).to eq(true)  
  #       end
  #       it "Se espera el método Count" do
  #         expect(@avicola.count).to eq(3)  
  #       end
  #       it "Se espera el método Drop" do
  #         expect(@avicola.drop(1)).to eq([100, 200])  
  #       end
  #       it "Se espera el método Detect (numero_aves)" do
  #         expect(@avicola.detect { |i| i == @numeros_aves}).to eq(nil)
  #       end
  #     end
  #     context "Gestión de puesta de huevos de Granja Avicola" do
  #       it "Existe una constante para Jaulas" do
  #         expect(Granja::Funcion::JAULAS).to eq("jaulas")
  #       end
  #       it "Existe una constante para Campo Abierto" do
  #         expect(Granja::Funcion::CAMPO_ABIERTO).to eq("campo_abierto")
  #       end
  #       it "Gestión mediante JAULAS" do
  #         expect(Granja::Funcion::set_GestionAnimales("jaulas",0, @avicola)).to eq("automatica")
  #         expect(@avicola.almacenar).to eq("jaulas")        
  #       end
  #       it "Gestion mediante CAMPO ABIERTO fuera del cobertizo LIBRE" do
  #         expect(Granja::Funcion::set_GestionAnimales("campo_abierto",1,@avicola)).to eq("libre")
  #         expect(@avicola.almacenar).to eq("campo_abierto")
  #       end
  #       it "Gestion mediante CAMPO ABIERTO dentro del COBERTIZO" do
  #         expect(Granja::Funcion::set_GestionAnimales("campo_abierto",2,@avicola)).to eq("cobertizo")
  #         expect(@avicola.almacenar).to eq("campo_abierto")      
  #       end
  #     end
  #     context "Productores Avicolas" do
  #       it "Existe un procedimiento para establecer los cuidados de los animales" do
  #         expect(Granja::Funcion::set_cuidado(5.2 , @vector_animales)).to eq([305.2, 405.2, 505.2, 1005.2])
  #       end
  #     end
  #     context "Población de la granja" do
  #       it "Existe un procedimiento para establecer la reproduccion de los animales ( > 24 )" do
  #         expect(Granja::Funcion::set_reproduccion(@vector_animales)).to eq([@animal_4])    # 1000 /30 = 33.3 > 24 SI
  #         expect(Granja::Funcion::set_reproduccion(@vector_animales)).not_to eq([@animal_1, @animal_2, @animal_3])
  #       end
  #     end
  #   end
  # end
  # before :each do
  #   @animal_11 = Granja::Animal.new(1212,60,"Masculino",200) #identificacion, edad, sexo, peso
  #   @animal_22 = Granja::Animal.new(1212,100,"Masculino",400)
  #   @animal_33 = Granja::Animal.new(1212,100,"Masculino",500)
  #   @animal_44 = Granja::Animal.new(1212,110,"Masculino",200)
  #   @animal_111 = Granja::Animal.new(1212,2000,"Masculino",12000) #identificacion, edad, sexo, peso
  #   @animal_222 = Granja::Animal.new(1212,3114,"Masculino",24000)
  #   @animal_333 = Granja::Animal.new(1212,2566,"Masculino",15000)
  #   @animal_444 = Granja::Animal.new(1212,3210,"Masculino",17700)
  #   @animal_1111 = Granja::Animal.new(1212,123200,"Masculino",12500) #identificacion, edad, sexo, peso
  #   @animal_2222 = Granja::Animal.new(1212,121146,"Masculino",22400)
  #   @animal_3333 = Granja::Animal.new(1212,521760,"Masculino",24200)
  #   @animal_4444 = Granja::Animal.new(1212,232200,"Masculino",15800)

  #   @vector_animales_1 = [@animal_11, @animal_22, @animal_33, @animal_44]
  #   @vector_animales_2 = [@animal_111, @animal_222, @animal_333, @animal_444]
  #   @vector_animales_3 = [@animal_1111, @animal_2222, @animal_3333, @animal_4444]

  #   @granja_1 = Granja::Avicola.new("pollo","sacrificio",2,100,100,"ave macho robusto",@vector_animales_1,"establo")
  #   @granja_2 = Granja::Avicola.new("pollo","huevos",2,100,90,"ave macho robusto",@vector_animales_2,"establo")
  #   @granja_3 = Granja::Avicola.new("pollo","sacrificio",2,100,110,"ave macho robusto",@vector_animales_3,"establo")

  #   @conjunto_granja = [@granja_1, @granja_2, @granja_3]
  # end

  # context "Práctica 10." do
  #   context "Representación de la clase Avícola de una Granja - Granja::Avicola" do
  #     it "Se espera que una instancia de la clase Avícola sea una granja Avicola" do
  #       expect(@avicola.is_a?Granja::Avicola).to eq(true)
  #     end
  #     it "Se espera clase Avicola sea Enumerable" do
  #       expect(@avicola).to be_a(Enumerable)   
  #     end
  #     it "Se espera que sea un objeto de la clase Module" do
  #       expect((Granja::Funcion).is_a?Module).to eq(true)      
  #     end
  #     it "Se espera que una instancia de la clase Avícola sea un Object" do
  #       expect(@avicola.is_a?Object).to eq(true)
  #     end
  #     it "Se obtiene una cadena con la información de la granja avícola correctamente formateada" do
  #       expect(@avicola.to_s).to eq("pollo,huevos,2,100,200,ave macho robusto,corto,palmeadas,voladoras, grueso,palmeadas,nadadoras")
  #     end
  #     context "Funcionalidad para calcular el bienestar animal y unas condiciones de vida" do
  #       it "Existe la media del peso y la edad de los animales con condicion (CAMPO ABIERTO)" do
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_1, Granja::Funcion::CAMPO_ABIERTO)).to eq(59.090909090909086)
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_2, Granja::Funcion::CAMPO_ABIERTO)).to eq(89.44279595015577)
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_3, Granja::Funcion::CAMPO_ABIERTO)).to eq(59.74031392279947)
  #       end
  #       it "Existe la media del peso y la edad de los animales con condicion (JAULAS)" do
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_1, Granja::Funcion::JAULAS)).to eq(29.545454545454543)
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_2, Granja::Funcion::JAULAS)).to eq(44.721397975077885)
  #         expect(Granja::Funcion::set_BienestarAnimal(@granja_3, Granja::Funcion::JAULAS)).to eq(29.870156961399736)
  #       end
  #     end
  #     # precio_venta = si destino == sacrificio = media peso y precio_venta
  #     #             = else        == otrodestino = media edad y precio_venta
  #     context "Funcionalidad para calcular el beneficio neto de una granja" do
  #       it "Existe función del precio de venta con destino (SACRIFICIO)" do
  #         expect(Granja::Funcion::set_BeneficioNeto(@granja_1)).to eq(3.25)
  #       end
  #       it "Existe función del precio de venta con destino (HUEVOS)" do
  #         expect(Granja::Funcion::set_BeneficioNeto(@granja_2)).to eq(30.25)
  #       end
  #     end
  #     context "Funcionalidad para calcular el indicador de productividad" do
  #       it "Existe una funcionalidad para calcular el índice de productividad = 1" do
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_1, Granja::Funcion::CAMPO_ABIERTO)).to eq(1)
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_1, Granja::Funcion::JAULAS)).to eq(1)
  #       end
  #       it "Existe una funcionalidad para calcular el índice de productividad = 2" do
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_2, Granja::Funcion::CAMPO_ABIERTO)).to eq(2)
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_2, Granja::Funcion::JAULAS)).to eq(2)
  #       end
  #       it "Existe una funcionalidad para calcular el índice de productividad = 3" do
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_3, Granja::Funcion::CAMPO_ABIERTO)).to eq(2)
  #         expect(Granja::Funcion::set_IndicadorProductividad(@granja_3, Granja::Funcion::JAULAS)).to eq(2)
  #       end
  #     end
  #     context "Cooperativas conjuntos de Granjas" do  
  #       it "Existe un máximo indicador de productividad" do
  #         # expect(@conjunto_granja.max_by { |n| Granja::Funcion::set_IndicadorProductividad(n, Granja::Funcion::CAMPO_ABIERTO) }).to eq(@granja_3)
  #         # expect(@conjunto_granja.max_by { |n| Granja::Funcion::set_IndicadorProductividad(n, Granja::Funcion::JAULAS) }).to eq(@granja_3)
          
  #         @condiciones = [Granja::Funcion::CAMPO_ABIERTO, Granja::Funcion::JAULAS]
  #         @cooperativa = @conjunto_granja.zip(@condiciones)
          
  #         expect(@cooperativa.max_by{ |n| Granja::Funcion::set_IndicadorProductividad(n[0], n[1])}).to eq([@granja_2, Granja::Funcion::JAULAS])

  #         #@cooperativa = @conjunto_granja.zip([Granja::Funcion::CAMPO_ABIERTO, Granja::Funcion::JAULAS])
  #         #expect(@todo.collect { |n| n.max_by{Granja::Funcion::set_IndicadorProductividad(n[0], n[1])} }).to eq()
  #         #@all = @todo.max_by.collect { |n| Granja::Funcion::set_IndicadorProductividad(n[0], n[1])}
  #         #expect(@all).to eq(2)

  #       end
  #       it "Existe un incremento del precio de venta de las granjas" do
  #         @mayor = @conjunto_granja.max_by{ |n| Granja::Funcion::set_IndicadorProductividad(n, Granja::Funcion::CAMPO_ABIERTO)}
  #         @operacion = @mayor.precio_venta * 0.5
          
  #         expect(@conjunto_granja.collect { |n| n.precio_venta + @operacion}).to eq([145.0, 135.0, 155.0])
  #       end
  #     end

  #   end
  # end

end 