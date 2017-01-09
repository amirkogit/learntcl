# https://tcl.tk/man/tcl8.5/tutorial/Tcl22.html

# very simple example
set name(first) "Mary"
set name(last)  "Poppins"

puts "Full name: $name(first) $name(last)"

#Output:
#Full name: Mary Poppins

puts "\n"
# ==============================================================

proc addname {first last} {
    global name

    # Create a new ID (stored in the name array too for easy access)

    incr name(ID)
    set id $name(ID)

    set name($id,first) $first   ;# The index is simply a string!
    set name($id,last)  $last    ;# So we can use both fixed and
                                 ;# varying parts
}

#
# Initialise the array and add a few names
#
global name
set name(ID) 0

addname Mary Poppins
addname Uriah Heep
addname Rene Descartes
addname Leonardo "da Vinci"

#
# Check the contents of our database
# The parray command is a quick way to
# print it
#
parray name

#[exit] ;# for debugging

#
# Some array commands
#
array set array1 [list {123} {Abigail Aardvark} \
                       {234} {Bob Baboon} \
                       {345} {Cathy Coyote} \
                       {456} {Daniel Dog} ]

puts "\nContents of array1"
parray array1

puts "Array1 has [array size array1] entries\n"

puts "Array1 has the following entries: \n [array names array1] \n"

puts "ID Number 123 belongs to $array1(123)\n"

if {[array exist array1]} {
    puts "array1 is an array"
} else {
    puts "array1 is not an array"
}

if {[array exist array2]} {
    puts "array2 is an array"
} else {
    puts "array2 is not an array"
}

proc existence {variable} {
    upvar $variable testVar
    if { [info exists testVar] } {
	puts "$variable Exists"
    } else {
	puts "$variable Does Not Exist"
    }
}

# Create an array
for {set i 0} {$i < 5} {incr i} { set a($i) test }

puts "\ntesting unsetting a member of an array"
existence a(0)
puts "a0 has been unset"
unset a(0)
existence a(0)

puts "\ntesting unsetting several members of an array, with an error"
existence a(3)
existence a(4)
catch {unset a(3) a(0) a(4)}
puts "\nAfter attempting to delete a(3), a(0) and a(4)"
existence a(3)
existence a(4)

puts "\nUnset all the array's elements"
existence a
array unset a *

puts "\ntesting unsetting an array"
existence a
puts "a has been unset"
unset a
existence a

#Output:
# Full name: Mary Poppins


# name(1,first) = Mary
# name(1,last)  = Poppins
# name(2,first) = Uriah
# name(2,last)  = Heep
# name(3,first) = Rene
# name(3,last)  = Descartes
# name(4,first) = Leonardo
# name(4,last)  = da Vinci
# name(ID)      = 4
# name(first)   = Mary
# name(last)    = Poppins

# Contents of array1
# array1(123) = Abigail Aardvark
# array1(234) = Bob Baboon
# array1(345) = Cathy Coyote
# array1(456) = Daniel Dog
# Array1 has 4 entries

# Array1 has the following entries:
#  345 234 123 456

# ID Number 123 belongs to Abigail Aardvark

# array1 is an array
# array2 is not an array

# testing unsetting a member of an array
# a(0) Exists
# a0 has been unset
# a(0) Does Not Exist

# testing unsetting several members of an array, with an error
# a(3) Exists
# a(4) Exists

# After attempting to delete a(3), a(0) and a(4)
# a(3) Does Not Exist
# a(4) Exists

# Unset all the array's elements
# a Exists

# testing unsetting an array
# a Exists
# a has been unset
# a Does Not Exist