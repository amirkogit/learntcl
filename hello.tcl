#
# Defining a procedure.
#
proc Diag {a b} {
    expr { sqrt($a*$a + $b*$b)}
}
puts "Diagonal of a 3,4 right triangle is [Diag 3 4]"