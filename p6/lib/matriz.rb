class Matriz
    attr_reader :v1, :v2, :v3, :v4
    attr_writer :v1, :v2, :v3, :v4

    def initialize (v1,v2,v3,v4)
        @matriz = [[v1,v2],[v3,v4]]
        @v1, @v2, @v3, @v4 = v1,v2,v3,v4
        @filas = 1
        @columnas = 1
    end
    
    def to_s
        for i in (0..@filas)
            for j in (0..@columnas)
                print "#{@matriz[i][j]}   "
            end
            puts
        end
    end

    # Sobrecarga de operadores (Suma)
    def +(suma_obj)
        Matriz.new(@v1 + suma_obj.v1, @v2 + suma_obj.v2, @v3 + suma_obj.v3, @v4 + suma_obj.v4)
    end

    # Sobrecarga de operadores (Multiplicacion)
    def *(multiplicacion_obj)
        Matriz.new(@v1 * multiplicacion_obj.v1, @v2 * multiplicacion_obj.v2, @v3 * multiplicacion_obj.v3, @v4 * multiplicacion_obj.v4)
    end

    # Sobrecarga de operadores (Resta)
    def -(resta_obj)
        Matriz.new(@v1 - resta_obj.v1, @v2 - resta_obj.v2, @v3 - resta_obj.v3, @v4 * resta_obj.v4)
    end

    # Producto Escalar
    def prod_escalar(mult)
        for i in (0..@filas)
            for j in (0..@columnas)
                @matriz[i][j] = @matriz[i][j] * mult
            end
        end
        @v1, @v2, @v3, @v4 = @v1 * mult,  @v2 * mult, @v3 * mult, @v4 * mult
    end

    # #Traspuesta
    # # def traspuesta
    # #     @aux = @matriz
    # #     for i in (0..1)
    # #         for j in (0..1)
    # #             @matriz[i][j] = @aux[j][i]
    # #         end
    # #     end
    # # end

    # Traspuesta
    def traspuesta
        Matriz.new(@v1, @v3, @v2, @v4)
    end

    #Diagonal Principal
    def diagonal
        puts (0..1).collect { |i| @matriz[i][i] }
    end

    puts "Matriz 1:"
    m1 = Matriz.new(1,2,3,4)
    m5 = Matriz.new(1,2,3,4)
    m1.to_s
    puts 
    
    puts "Matriz 2:"
    m2 = Matriz.new(5,3,2,1)
    m6 = Matriz.new(5,3,2,1)
    m2.to_s
    puts
    
    puts "Suma M1 + M2:"
    suma_sol = m1 + m2
    suma_sol.to_s
    puts
    
    puts "Producto Escalar M1:"
    m1.prod_escalar(2)
    m1.to_s
    puts
    
    puts "Producto Escalar M2:"
    m2.prod_escalar(2)
    m2.to_s
    puts

    puts "Traspuesta M1:"
    tras_sol_m1 = m1.traspuesta
    tras_sol_m1.to_s
    puts
    
    puts "Traspuesta M2:"
    tras_sol_m2 = m2.traspuesta
    tras_sol_m2.to_s
    puts

    puts "- AGREGADO MÁS:"
    puts

    puts "Multiplicacion:"
    multiplicacion_sol = m1 * m2
    multiplicacion_sol.to_s
    puts
    
    puts "Resta:"
    resta_sol = m1 - m2
    resta_sol.to_s
    puts
    
    puts "Diagonal M1: "
    m5.diagonal
    puts

    puts "Diagonal M2: "
    m6.diagonal
end
