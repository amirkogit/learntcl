# https://tcl.tk/man/tcl8.5/tutorial/Tcl24.html

#
# Count the number of lines in a text file
#
set infile [open "myfile.txt" r]
set number 0

#
# gets with two arguments returns the length of the line,
# -1 if the end of the file is found
#
while { [gets $infile line] >= 0 } {
    incr number
}
close $infile

puts "Number of lines: $number"

#
# Also report it in an external file
#
set outfile [open "report.out" w]
puts $outfile "Number of lines: $number"
close $outfile