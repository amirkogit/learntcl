# Grouping arguments with {}
# ------------------------------------
# During the substitution phase of command evaluation, the two grouping operators, the brace ({) and the double quote ("), are treated differently by the Tcl interpreter.

# In the last lesson you saw that grouping words with double quotes allows substitutions to occur within the double quotes. By contrast, grouping words within double braces disables substitution within the braces. Characters within braces are passed to a command exactly as written. The only "Backslash Sequence" that is processed within braces is the backslash at the end of a line. This is still a line continuation character.

# Note that braces have this effect only when they are used for grouping (i.e. at the beginning and end of a sequence of words). If a string is already grouped, either with quotes or braces, and braces occur in the middle of the grouped string (i.e. "foo{bar"), then the braces are treated as regular characters with no special meaning. If the string is grouped with quotes, substitutions will occur within the quoted string, even between the braces. 

set Z Albany
set Z_LABEL "The Capitol of New York is: "

puts "\n................. examples of differences between  \" and \{"
puts "$Z_LABEL $Z"
puts {$Z_LABEL $Z}

puts "\n....... examples of differences in nesting \{ and \" "
puts "$Z_LABEL {$Z}"
puts {Who said, "What this country needs is a good $0.05 cigar!"?}

puts "\n................. examples of escape strings"
puts {There are no substitutions done within braces \n \r \x0a \f \v}
puts {But, the escaped newline at the end of a\
string is still evaluated as a space}