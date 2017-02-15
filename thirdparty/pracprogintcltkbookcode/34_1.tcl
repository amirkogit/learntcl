#
# Example 34-1
# Associating entry widgets with variables and commands.
#

foreach {field label} {name Name address1 Address
			address2 {} phone Phone} {
	label .l$field -text $label -anchor w
	entry .e$field -textvariable address($field) -relief sunken
	grid .l$field .e$field -sticky news
	bind .e$field <Return> UpdateAddress
}


