#
# Example 30-5
# A command on a radiobutton or checkbutton.
#

proc PrintByName { varname } {
	upvar #0 $varname var
	puts stdout "$varname = $var"
}
checkbutton $f.$b -text $item -variable $item \
	-command [list PrintByName $item]
radiobutton $f.$b -variable $varname \
	-text $item -value $item \
	-command [list PrintByName $varname]


