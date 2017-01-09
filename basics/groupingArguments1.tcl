# Grouping arguments with ""
# ------------------------------------

# This lesson is the first of three which discuss the way Tcl handles substitution during command evaluation.

# In Tcl, the evaluation of a command is done in 2 phases. The first phase is a single pass of substitutions. The second phase is the evaluation of the resulting command. Note that only one pass of substitutions is made. Thus in the command

# puts $varName

# the contents of the proper variable are substituted for $varName, and then the command is executed. Assuming we have set varName to "Hello World", the sequence would look like this: puts $varName ⇒ puts "Hello World", which is then executed and prints out Hello World.

# During the substitution phase, several types of substitutions occur.

# A command within square brackets ([]) is replaced with the result of the execution of that command. (This will be explained more fully in the lesson "Results of a Command - Math 101.")

# Words within double quotes or braces are grouped into a single argument. However, double quotes and braces cause different behavior during the substitution phase. In this lesson, we will concentrate on the behavior of double quotes during the substitution phase.

# Grouping words within double quotes allows substitutions to occur within the quotations - or, in fancier terms, "interpolation". The substituted group is then evaluated as a single argument. Thus, in the command:

# puts "The current stock value is $varName" 

# the current contents of varName are substituted for $varName, and then the entire string is printed to the output device, just like the example above.

# In general, the backslash (\) disables substitution for the single character immediately following the backslash. Any character immediately following the backslash will stand without substitution.

# However, there are specific "Backslash Sequence" strings which are replaced by specific values during the substitution phase. The following backslash strings will be substituted as shown below.
# String 	Output 	Hex Value
# \a 	Audible Bell 	0x07
# \b 	Backspace 	0x08
# \f 	Form Feed (clear screen) 	0x0c
# \n 	New Line 	0x0a
# \r 	Carriage Return 	0x0d
# \t 	Tab 	0x09
# \v 	Vertical Tab 	0x0b
# \0dd 	Octal Value 	d is a digit from 0-7
# \uHHHH 	H is a hex digit 0-9,A-F,a-f. This represents a 16-bit Unicode character.
# \xHH.... 	Hex Value 	H is a hex digit 0-9,A-F,a-f. Note that the \x substitution "keeps going" as long as it has hex digits, and only uses the last two, meaning that \xaa and \xaaaa are equal, and that \xaaAnd anyway will "eat" the A of "And". Using the \u notation is probably a better idea.

# The final exception is the backslash at the end of a line of text. This causes the interpreter to ignore the newline, and treat the text as a single line of text. The interpreter will insert a blank space at the location of the ending backslash. 

set Z Albany
set Z_LABEL "The Capitol of New York is: "

puts "$Z_LABEL $Z"   ;# Prints the value of Z
puts "$Z_LABEL \$Z"  ;# Prints a literal $Z instead of the value of Z

puts "\nBen Franklin is on the \$100.00 bill"

set a 100.00
puts "Washington is not on the $a bill"    ;# This is not what you want
puts "Lincoln is not on the $$a bill"      ;# This is OK
puts "Hamilton is not on the \$a bill"     ;# This is not what you want
puts "Ben Franklin is on the \$$a bill"    ;# But, this is OK

puts "\n................. examples of escape strings"
puts "Tab\tTab\tTab"
puts "This string prints out \non two lines"
puts "This string comes out\
on a single line"