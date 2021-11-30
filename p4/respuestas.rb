"\t\n"

'\t\n'

%q{hello world\n}

%q{’a’ ’b’ ’c’}

%Q{hello world\n}

%Q{"a" "b" "c"}

s = "hello"
s[0,2]
s[-1,1]
s[0,10]

e = '.'*3

g = "hello"

g << " world"

a=1

"#{a=a+1} "*3

%w[this is a test]


%w[\t \n]

%W[\t \n]

nils = Array.new(3)

zeros = Array.new(3, 0)

x = [[1,2],[3,4]]
b = Array.new(x)

c = Array.new(3) { |i| 2*i }

a = ('a'..'e').to_a
a[1,1]
a[-2,2]
a[0..2]
a[0...1]
a[-2..-1]

a
a[0,2] = %w{A B}
a
a[2..5] = %w{C D E}
a
a[0,0] = [1,2,3]
a
a[0,2] = []
a
a[-1,1] = [ 'Z' ]
a
a[-2,2] = nil
a

a = (1...4).to_a
a = a + [4, 5]
a += [[6, 7, 8]]
a = a + [ 9 ]

x = %w{a b c b a}
x = x - %w{b c d}

z = [0]*8

a = []
a << 1
a << 2 << 3
a << [4, 5, 6]
a.concat [7, 8]

a = [1, 1, 2, 2, 3, 3, 4]
b = [5, 5, 4, 4, 3, 3, 2]
c = a | b
d = b | a
e = a & b
f = b & a

a = 1..10
a.class
a.to_a
b = 1...10
b.to_a
b.include? 10
b.include? 8
b.step(2) {|x| print "#{x} " }
(1..3).to_a

r = 0...100
r.member? 50
r.include? 99.9
r.member? 99.9

true.class
false.class
puts "hello" if 0
puts "hello" if nil
puts "hello" if ""

x = :sym
x.class
x == 'sym'
x == :sym
z = :'a long symbol'
z.class
x == 'sym'.to_sym
x.to_s == 'sym'

s = "Ruby"
t = s
t[-1] = ""
print s
t = "Java"
print s, t

"%d %s" % [3, "rubies"]

x, y = 4, 5
z = x > y ? x : y
x,y,z = [1,2,3]

x = { :a => 1, :b => 2 }
x.keys
x.values
x[:c] = 3
x
x.delete('a')
x
x.delete(:a)
x
x = { :a => 1, :b => 2, :c => 4 }
x.delete_if { |k,v| v % 2 == 0 }
x


counts = Hash.new(0)
counts = {}

'hello world, hello LPP'.scan /\w+/
