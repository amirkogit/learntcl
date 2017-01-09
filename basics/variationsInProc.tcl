# https://tcl.tk/man/tcl8.5/tutorial/Tcl12.html

proc example {first {second ""} args} {
    if {$second eq ""} {
        puts "There is only one argument and it is: $first"
        return 1
    } else {
        if {$args eq ""} {
            puts "There are two arguments - $first and $second"
            return 2
        } else {
            puts "There are many arguments - $first and $second and $args"
            return "many"
        }
    }
}

set count1 [example ONE]
set count2 [example ONE TWO]
set count3 [example ONE TWO THREE ]
set count4 [example ONE TWO THREE FOUR]

puts "The example was called with $count1, $count2, $count3, and $count4 Arguments"

#Output:
# X : 5    Y: 5

# one: Z: 5
# two: Z: 5 A: 5

# X: 2  Y: 1

# testing unsetting a simple variable
# x Exists
# x has been unset
# x Does Not Exist