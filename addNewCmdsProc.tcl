# https://tcl.tk/man/tcl8.5/tutorial/Tcl11.html

proc sum {arg1 arg2} {
    set x [expr {$arg1 + $arg2}];
    return $x
}

puts " The sum of 2 + 3 is: [sum 2 3]\n\n"

proc for {a b c} {
    puts "The for command has been replaced by a puts";
    puts "The arguments were: $a\n$b\n$c\n"
}

for {set i 1} {$i < 10} {incr i}

#Output:
# The sum of 2 + 3 is: 5

# The for command has been replaced by a puts
# The arguments were: set i 1
# $i < 10
# incr i