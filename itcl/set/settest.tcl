source set.tcl
puts "Testing set"
puts "***********"

Set s

puts "Contents of Set s"
s add: 1
s add: "anton"
s add: {"Mona" "Lisa"}
s add: 3
s add: "anton"
s add: 3.0

puts "Size of set: [s size]"
s do: element {puts "$element"}

puts "s includes: 3 ==> [s includes: 3]"
puts [s includes: 3]
puts [s includes: 3.0]
puts [s includes: "demo"]
puts [s includes: {"Mona" "Lisa"}]

puts "\nRemoving anton"
s remove:ifAbsent: "anton" {puts "nothing to delete"}
s do: element {puts "$element"}
s remove:ifAbsent: "anton" {puts "nothing to delete"}

puts "Size of set: [s size]"
