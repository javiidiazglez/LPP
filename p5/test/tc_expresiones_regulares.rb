# Test. Representar expresiones regulares: Concatenación, alternativa y cierre de Kleen.

require 'test/unit'
require 'lib/expresiones_regulares'

class Test_expresiones_regulares < Test::Unit::TestCase

  def setup

    @expresion1 = Expresiones_regulares.new("c")
    @expresion2 = Expresiones_regulares.new("d")

    @exp_1 = Expresiones_regulares.new("a")
    @exp_2 = Expresiones_regulares.new("b")

    @exp_3 = Expresiones_regulares.new("aa")
    @exp_4 = Expresiones_regulares.new("bb")

    @exp_5 = Expresiones_regulares.new("aaa")
    @exp_6 = Expresiones_regulares.new("bbb")

  end
    #exp_l3 = @expresion1.concatenacion(@expresion2)

  # Test de concatenacion
  def test_concatenacion 

    @exp_l1 = (@exp_1).concatenacion(@exp_2)
    assert_equal("a.b", @exp_l1.to_s) 
    puts "\nConcatenación(1): " + @exp_l1.to_s


    @exp_l2 = (@exp_3).concatenacion(@exp_4)
    assert_equal("aa.bb", @exp_l2.to_s) 
    puts "Concatenación(2): " + @exp_l2.to_s


    @exp_l3 = (@exp_5).concatenacion(@exp_6)
    assert_equal("aaa.bbb", @exp_l3.to_s) 
    puts "Concatenación(3): " + @exp_l3.to_s

  end

  # Test de alternativa
  def test_alternativa 
    @exp_l4 = (@exp_1).alternativa(@exp_2)
    assert_equal("a|b", @exp_l4.to_s) 
    puts "\nAlternativa(1): " + @exp_l4.to_s


    @exp_l5 = (@exp_3).alternativa(@exp_4)
    assert_equal("aa|bb", @exp_l5.to_s) 
    puts "Alternativa(2): " + @exp_l5.to_s


    @exp_l6 = (@exp_5).alternativa(@exp_6)
    assert_equal("aaa|bbb", @exp_l6.to_s) 
    puts "Alternativa(3): " + @exp_l6.to_s
 
  end

   # Test de Cierre de Kleen
  def test_cierre_kleen
    @exp_l7 = (@exp_1).cierre_kleen
    assert_equal("a*", @exp_l7.to_s)
    puts "\nCierre de Kleen(a): " + @exp_l7.to_s

    @exp_l8 = (@exp_2).cierre_kleen
    assert_equal("b*", @exp_l8.to_s)
    puts "Cierre de Kleen(b): " + @exp_l8.to_s

    @exp_l9 = (@exp_3).cierre_kleen
    assert_equal("aa*", @exp_l9.to_s)
    puts "Cierre de Kleen(aa): " + @exp_l9.to_s

    @exp_l10 = (@exp_4).cierre_kleen
    assert_equal("bb*", @exp_l10.to_s)
    puts "Cierre de Kleen(bb): " + @exp_l10.to_s

    @exp_l11 = (@exp_5).cierre_kleen
    assert_equal("aaa*", @exp_l11 .to_s)
    puts "Cierre de Kleen(aaa): " + @exp_l11 .to_s

    @exp_l12 = (@exp_6).cierre_kleen
    assert_equal("bbb*", @exp_l12.to_s)
    puts "Cierre de Kleen(bbb): " + @exp_l12.to_s

  end

end