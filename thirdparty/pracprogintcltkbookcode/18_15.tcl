#
# Example 18-15
# Processing mail sent by /mail/forminfo, Safe-Tcl version.
#

# Assume the mail message is on standard input

set X [read stdin]

# Strip off the mail headers, when end with a blank line
if {[regsub {.*?\n\ndata} $X {data} X] != 1} {
	error "Malformed mail message"
}
proc data {fields} {
	foreach {name value} $fields {
		# Do something
	}
}
# Create the safe interpreter
set i [interp create -safe]

# Link the data command in the safe interpreter to the
# data procedure in this interpreter
interp alias $i data {} data

# Process the message in the safe interpreter
interp eval $i $X


