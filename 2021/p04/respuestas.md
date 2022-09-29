# 35. ¿Qué diferencia hay entre "\t\n" y '\t\n'?
El "\t\n" son comillas dobles, un string vacío, permite secuencias de escape, en cambio '\t\n' son comillas simples y lo reconoce todo como un string. Esto significa que no admite una interpollación de cadena y no escapa a las secuencias.
 
"\t\n" => "\t\n" 
'\t\n' => "\\t\\n" 

# 36. ¿Cómo funciona %q? ¿Qué es %q{hello world\n}? ¿Qué es %q{’a’ ’b’ ’c’}?
%q(no interpolación)
%q{hello world\n} => "hello world\\n"
%q{’a’ ’b’ ’c’} => "’a’ ’b’ ’c’"

# 37. ¿Cómo funciona %Q? ¿Qué es %Q{hello world\n}? ¿Qué es %Q{"a" "b" "c"}?
%Q(interpolación y barras invertidas)
%Q{hello world\n} => "hello world\n"
%Q{"a" "b" "c"} => "\"a\" \"b\" \"c\"" 

# 38. ¿Qué queda en c?
=> "--4--\n--2--\n"

# 39. ¿Qué queda en c?
=> "--\#{a}--\n--\#{b}--\n" 

# 40. s = "hello". ¿Cuál es el valor de las siguientes expresiones?
s[0,2] => "hello"
s[-1,1] => "he"
s[0,10] => "hello"

# 41. ¿Qué queda en g?
g << " world" => hello word

# 42. ¿Qué queda en e?
e = ’.’*3 => "..." 

# 43. ¿Cuál es el resultado?
"#{a=a+1} "*3 => "2 2 2 "


# 44. ¿Qué es esto? 
Los elementos entre comillas simples, sin interpolación de variables, ni a las secuencias de escape.
%w[this is a test] => ["this", "is", "a", "test"]

# 45 ¿Qué es esto? 
Los elementos entre comillas simples, sin interpolación de variables, ni a las secuencias de escape.
%w[\t \n] => ["\\t", "\\n"] 

# 46. ¿Qué es esto? 
Se utiliza para elementos de matriz entre comillas dobles.
%W[\t \n] => ["\t", "\n"]

# 47. ¿Qué contiene nils? 
nils = Array.new(3) => [nil, nil, nil] 

# 48. ¿Qué contiene zeros? 
zeros = Array.new(3, 0) => [0, 0, 0] 

# 49. ¿Qué queda en b?
b = Array.new(x) => [[1, 2], [3, 4]] 

# 50. ¿Qué queda en c?
 c = Array.new(3) { |i| 2*i } => [0, 2, 4] 

# 51. ¿Cuál es el resultado de cada una de estas operaciones?
a[1,1] => ["b"] 
a[-2,2] => ["d", "e"] 
a[0..2] => ["a", "b", "c"] 
a[0...1] => ["a"] 
a[-2..-1] => ["d", "e"] 

# 52. ¿Cuál es el resultado de cada una de estas operaciones?
a => ["A", "B", "c", "d", "e"] 
a => ["A", "B", "C", "D", "E"] 
a => [1, 2, 3, "A", "B", "C", "D", "E"] 
a => [3, "A", "B", "C", "D", "E"]
a => [3, "A", "B", "C", "D", "Z"] 
a => [3, "A", "B", "C", nil] 

# 53. ¿Cuál es el resultado de cada una de estas operaciones?
a = (1...4).to_a => [1, 2, 3] 
a = a + [4, 5] => [1, 2, 3, 4, 5]
a += [[6, 7, 8]] => [1, 2, 3, 4, 5, [6, 7, 8]] 
a = a + 9 => TypeError (no implicit conversion of Integer into Array)
-> Corregido: a = a + [ 9 ] => [1, 2, 3, 4, 5, [6, 7, 8], 9]  

# 54. ¿Cuál es el resultado de cada una de estas operaciones?
x = %w{a b c b a} => ["a", "b", "c", "b", "a"] 
x = x - %w{b c d} => ["a", "a"] 

# 55. ¿Cuál es el resultado de cada una de estas operaciones?
z = [0]*8 => [0, 0, 0, 0, 0, 0, 0, 0] 

# 56. ¿Cuál es el resultado de cada una de estas operaciones?
a << 1 => [1]
a << 2 << 3 => [1, 2, 3] 
a << [4, 5, 6] => [1, 2, 3, [4, 5, 6]] 
a.concat [7, 8] => [1, 2, 3, [4, 5, 6], 7, 8] 

# 57. ¿Cuál es el resultado de cada una de estas operaciones?
c = a | b => [1, 2, 3, 4, 5] 
d = b | a => [5, 4, 3, 2, 1] 
e = a & b => [2, 3, 4] 
f = b & a => [4, 3, 2]

# 58. ¿Qué resultados dan las siguientes operaciones?
a.to_a => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b = 1...10 => 1...10
b.to_a => [1, 2, 3, 4, 5, 6, 7, 8, 9]
b.include? 10 => false
b.include? 8 => true
b.step(2) {|x| print "#{x} " } => 1...10
1..3.to_a => NoMethodError: undefined method `to_a' for 3:Integer
-> Corregido: (1..3).to_a => [1, 2, 3]

# 59. ¿Qué resultados dan las siguientes operaciones?
r.member? 50 => true 
r.include? 99.9 => true
r.member? 99.9 => true

# 60. ¿Qué resultados dan las siguientes operaciones?
true.class => TrueClass 
false.class => FalseClass
puts "hello" if 0 -> hello => nil 
puts "hello" if nil => nil 
puts "hello" if "" => nil

# 61. ¿Qué resultados dan las siguientes operaciones?
x.class => Symbol 
x == 'sym'=> false 
x == :sym => true 
z.class => Symbol 
x == 'sym'.to_sym => true 
x.to_s == 'sym' => true 

# 62. ¿Qué resultados se dan?
t = s => "Ruby"
t[-1] = "" => ""
print s -> Rub => nil
t = "Java" => "Java" 
print s, t -> RubJava => nil 

# 63. ¿Cuál es el resultado?
"%d %s" % [3, "rubies"] => "3 rubies"

# 64. ¿Cuales son los resultados?
x, y = 4, 5 => [4, 5]
z = x > y ? x : y => 5 
x,y,z = [1,2,3] => [1, 2, 3] 

# 65. ¿Qué resultados dan las siguientes operaciones?
x.keys => [:a, :b]
x.values => [1, 2]
x => {:a=>1, :b=>2, :c=>3}
x => {:a=>1, :b=>2, :c=>3}
x => {:b=>2, :c=>3}
x.delete_if { |k,v| v % 2 == 0 } => {:a=>1}
x => {:a=>1}

# 66. ¿Qué hace la siguiente sentencia? counts = Hash.new(0) ¿Qué diferencia hay con la asignación counts = {}?
=> {}

Hash.new(0) establece el valor predeterminado para cualquier clave en 0, mientras que {} establece nil

# 67. ¿Qué retorna esta expresón regular? 'hello world, hello LPP'.scan /\w+/
=> ["hello", "world", "hello", "LPP"] 
