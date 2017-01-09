# Evaluation & Substitutions 3: Grouping arguments with []
#  You obtain the results of a command by placing the command in square brackets ([]). This is the functional equivalent of the back single quote (`) in sh programming, or using the return value of a function in C.

# As the Tcl interpreter reads in a line it replaces all the $variables with their values. If a portion of the string is grouped with square brackets, then the string within the square brackets is evaluated as a command by the interpreter, and the result of the command replaces the square bracketed string.

# Let's take the following code segment, for example:

# puts [readsensor [selectsensor]]

#     The parser scans the entire command, and sees that there is a command substitution to perform: readsensor [selectsensor] , which is sent to the interpreter for evaluation.
#     The parser once again finds a command to be evaluated and substituted, selectsensor
#     The fictitious selectsensor command is evaluated, and it presumably returns a sensor to read.
#     At this point, readsensor has a sensor to read, and the readsensor command is evaluated.
#     Finally, the value of readsensor is passed on back to the puts command, which prints the output to the screen.

# The exceptions to this rule are as follows:

#     A square bracket that is escaped with a \ is considered as a literal square bracket.
#     A square bracket within braces is not modified during the substitution phase.

set x abc
puts "A simple substitution: $x\n"

set y [set x "def"]
puts "Remember that set returns the new value of the variable: X: $x Y: $y\n"

set z {[set x "This is a string within quotes within braces"]}
puts "Note the curly braces: $z\n"

set a "[set x {This is a string within braces within quotes}]"
puts "See how the set is executed: $a"
puts "\$x is: $x\n"

set b "\[set y {This is a string within braces within quotes}]"
# Note the \ escapes the bracket, and must be doubled to be a
# literal character in double quotes
puts "Note the \\ escapes the bracket:\n \$b is: $b"
puts "\$y is: $y"