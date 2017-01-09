# https://tcl.tk/man/tcl8.5/tutorial/Tcl6a.html

# Compute 1 million times 1 million
puts [expr {1000000*1000000}]

# Compute 1 million times 1 million
puts [expr {1000000*1000000.}]

# Compute 1.0e+300/1.0-300
puts [expr {1.0e300/1.0e-300}]

#
# Division
#
puts "1/2 is [expr {1/2}]"
puts "-1/2 is [expr {-1/2}]"
puts "1/2 is [expr {1./2}]"
puts "1/3 is [expr {1./3}]"
puts "1/3 is [expr {double(1)/3}]"

puts "\n"

set tcl_precision 17  ;# One of Tcl's few magic variables:
                      ;# Show all decimals needed to exactly
                      ;# reproduce a particular number
puts "1/2 is [expr {1./2}]"
puts "1/3 is [expr {1./3}]"

set a [expr {1.0/3.0}]
puts "3*(1/3) is [expr {3.0*$a}]"

set b [expr {10.0/3.0}]
puts "3*(10/3) is [expr {3.0*$b}]"

set c [expr {10.0/3.0}]
set d [expr {2.0/3.0}]
puts "(10.0/3.0) / (2.0/3.0) is [expr {$c/$d}]"

set e [expr {1.0/10.0}]
puts "1.2 / 0.1 is [expr {1.2/$e}]"

#Output:
# 1000000000000
# 1000000000000.0
# Inf
# 1/2 is 0
# -1/2 is -1
# 1/2 is 0.5
# 1/3 is 0.3333333333333333
# 1/3 is 0.3333333333333333


# 1/2 is 0.5
# 1/3 is 0.33333333333333331
# 3*(1/3) is 1.0
# 3*(10/3) is 10.0
# (10.0/3.0) / (2.0/3.0) is 5.0000000000000009
# 1.2 / 0.1 is 11.999999999999998