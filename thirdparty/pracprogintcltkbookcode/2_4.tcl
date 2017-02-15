#
# Example 2-4
# The EchoArgs script.
#

# Tcl script to echo command line arguments
puts "Program: $argv0"
puts "Number of arguments: $argc"
set i 0
foreach arg $argv {
	puts "Arg $i: $arg"
	incr i
}


