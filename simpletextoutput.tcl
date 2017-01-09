#  The traditional starting place for a tutorial is the classic "Hello, World" program. Once you can print out a string, you're well on your way to using Tcl for fun and profit!

# The command to output a string in Tcl is the puts command.

# A single unit of text after the puts command will be printed to the standard output device. The default behavior is to print a newline character ("return") appropriate for the system after printing the text.

# If the string has more than one word, you must enclose the string in double quotes or braces ({}). A set of words enclosed in quotes or braces is treated as a single unit, while words separated by whitespace are treated as multiple arguments to the command. Quotes and braces can both be used to group several words into a single unit. However, they actually behave differently. In the next lesson you'll start to learn some of the differences between their behaviors. Note that in Tcl, single quotes are not significant, as they are in other programming languages such as C, Perl and Python.

# Many commands in Tcl (including puts) can accept multiple arguments. If a string is not enclosed in quotes or braces, the Tcl interpreter will consider each word in the string as a separate argument, and pass each individually to the puts command. The puts command will try to evaluate the words as optional arguments. This will probably result in an error.

# A command in Tcl is a list of words terminated by a newline or semicolon. Tcl comments are a # at the beginning of the line, or after the command is closed with a ; semicolon

puts "Hello, World - In quotes"    ;# This is a comment after the command.
# This is a comment at beginning of a line
puts {Hello, World - In Braces}
puts {Bad comment syntax example}   # *Error* - there is no semicolon!

puts "This is line 1"; puts "this is line 2"

puts "Hello, World; - With  a semicolon inside the quotes"

# Words don't need to be quoted unless they contain white space:
puts HelloWorld