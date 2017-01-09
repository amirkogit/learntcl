# https://tcl.tk/man/tcl8.5/tutorial/Tcl14.html

set x "a b c"
puts "Item at index 2 of the list {$x} is: [lindex $x 2]\n"

set y [split 7/4/1776 "/"]
puts "We celebrate on the [lindex $y 1]'th day of the [lindex $y 0]'th month\n"

set z [list puts "arg 2 is $y" ]
puts "A command resembles: $z\n"

set i 0
foreach j $x {
    puts "$j is item number $i in list x"
    incr i
}

puts "\n"
set i 0
set lst {1 2 3 4}
foreach j $lst {
    puts "$j is item number $i in list lst"
    incr i
}

puts "\n"
set csvValue [split "header1,header2,header3" ","]
puts "Contents of csvValue {"
foreach j $csvValue {
    puts "$j,"
}
puts "}"
puts "value at index 1 is [lindex $csvValue 1]"

#Output:
# Item at index 2 of the list {a b c} is: c

# We celebrate on the 4'th day of the 7'th month

# A command resembles: puts {arg 2 is 7 4 1776}

# a is item number 0 in list x
# b is item number 1 in list x
# c is item number 2 in list x


# 1 is item number 0 in list lst
# 2 is item number 1 in list lst
# 3 is item number 2 in list lst
# 4 is item number 3 in list lst


# Contents of csvValue {
# header1,
# header2,
# header3,
# }
# value at index 1 is header2