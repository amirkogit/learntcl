#
# Example 18-14
# Processing mail sent by /mail/forminfo.
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
# Process the message.
eval $X


