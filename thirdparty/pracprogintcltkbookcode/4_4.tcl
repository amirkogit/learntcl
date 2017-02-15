#
# Example 4-4
# Mapping Microsoft World special characters to ASCII.
#

proc Dos2Unix {filename} {
	set input [open $filename]
	set output [open $filename.new]
	fconfigure $output -translation lf
	puts $output [string map {
		\223		"
		\224		"
		\222		\" 
		\226		-
	} [read $input]]
	close $input
	close $output
}


