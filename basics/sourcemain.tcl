# https://tcl.tk/man/tcl8.5/tutorial/Tcl30.html

set filename "sourcedata.tcl"
puts "Global variables visible before sourcing $filename:"
puts "[lsort [info globals]]\n"

if {[info procs testproc] eq ""} {
    puts "testproc does not exist.  sourcing $filename"
    source $filename
}

puts "\nNow executing testproc"
testproc

puts "Global variables visible after sourcing $filename:"
puts "[lsort [info globals]]\n"