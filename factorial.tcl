# calculate the factorial of a given number

proc Factorial {x} {
    set i 1; 
    set product 1;
    while {$i <= $x} {
        set product [expr {$product * $i}]
        incr i
    }
    return $product
}
puts "Factorial of 10 is: [Factorial 10]"