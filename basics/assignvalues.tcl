#  In Tcl, everything may be represented as a string, although internally it may be represented as a list, integer, double, or other type, in order to make the language fast.

# The assignment command in Tcl is set.

# When set is called with two arguments, as in:

# set fruit Cauliflower

# it places the second argument (Cauliflower) in the memory space referenced by the first argument (fruit). Set always returns the contents of the variable named in the first argument. Thus, when set is called with two arguments, it places the second argument in the memory space referenced by the first argument and then returns the second argument. In the above example, for instance, it would return "Cauliflower", without the quotes.

# The first argument to a set command can be either a single word, like fruit or pi , or it can be a member of an array. Arrays will be discussed in greater detail later, for the time being just remember that many data can be collected under a single variable name, and an individual datum can be accessed by its index within that array. Indexing into an array in Tcl is handled by putting the index within parentheses after the name of the variable.

# Set can also be invoked with only one argument. When called with just one argument, it will return the contents of that argument.

# Here's a summary of the set command.

# set varName ?value?
#     If value is specified, then the contents of the variable varName are set equal to value . 
#     If varName consists only of alphanumeric characters, and no parentheses, it is a scalar variable. 
#     If varName has the form varName(index) , it is a member of an associative array. 

# If you look at the example code, you'll notice that in the set command the first argument is typed with only its name, but in the puts statement the argument is preceded with a $.

# The dollar sign tells Tcl to use the value of the variable - in this case X or Y.

# Tcl passes data to subroutines either by name or by value. Commands that don't change the contents of a variable usually have their arguments passed by value. Commands that do change the value of the data must have the data passed by name. 

set X "This is a string"

set Y 1.24

puts $X
puts $Y

puts "..............................."

set label "The value in Y is: "
puts "$label $Y"