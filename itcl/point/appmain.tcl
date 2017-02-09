source point.tcl

puts "test point"

Point a 5 10
Point b

a x: 1
a y: 2

puts "[a x]"
puts "[a y]"

puts "Another way of initializing..."
a is 3 4
puts "[a x]"
puts "[a y]"
puts "[a printString]"
a printOn: stdout
b printOn: stdout

b = a
puts "\n"
puts "[a printString] ; [b printString]"

a += b
puts "[a printString]"

Point c
c = [a + b]
puts "[c printString] = [a printString ] + [b printString]"