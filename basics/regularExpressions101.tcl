# https://tcl.tk/man/tcl8.5/tutorial/Tcl20.html

set sample "Where there is a will, There is a way."

#
# Match the first substring with lowercase letters only
#
set result [regexp {[a-z]+} $sample match]
puts "Result: $result match: $match"

#
# Match the first two words, the first one allows uppercase
set result [regexp {([A-Za-z]+) +([a-z]+)} $sample match sub1 sub2 ]
puts "Result: $result Match: $match 1: $sub1 2: $sub2"

#
# Replace a word
#
regsub "way" $sample "lawsuit" sample2
puts "New: $sample2"

#
# Use the -all option to count the number of "words"
#
puts "Number of words: [regexp -all {[^ ]+} $sample]"
    
# Output:
# Result: 1 match: here
# Result: 1 Match: Where there 1: Where 2: there
# New: Where there is a will, There is a lawsuit.
# Number of words: 9