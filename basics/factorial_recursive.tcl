# recursive version of a factorial
proc Factorial {x} {
    if {$x <=1} {
        return 1
    } else {
        return [expr {$x * [Factorial [expr {$x -1}]]}]
    }
}

puts "Factorial of 10 using recursive version: [Factorial 10]"