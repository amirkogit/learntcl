# https://tcl.tk/man/tcl8.5/tutorial/Tcl17.html

set string "this is my test string"

puts "There are [string length $string] characters in \"$string\""

puts "[string index $string 1] is the second character in \"$string\""

puts "\"[string range $string 5 10]\" are characters between the 5'th and 10'th"
    
#Output:
# There are 22 characters in "this is my test string"
# h is the second character in "this is my test string"
# "is my " are characters between the 5'th and 10'th