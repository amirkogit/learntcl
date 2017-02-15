#
# Example 13-3
# Mapping form data onto procedure arguments.
#

# cmd is the name of the procedure to invoke
# form is an array containing form values

set cmdOrig $cmd
set params [info args $cmdOrig]

# Match elements of the form array to parameters

foreach arg $params {
	if {![info exists form($arg)]} {
		if {[info default $cmdOrig $arg value]} {
			lappend cmd $value
		} elseif {[string equal $arg "args"]} {
			set needargs yes
		} else {
			lappend cmd {}
		}
	} else {
		lappend cmd $form($arg)
	}
}
# If args is a parameter, then append the form data
# that does not match other parameters as extra parameters

if {[info exists needargs]} {
	foreach {name value} [array get form] {
		if {[lsearch $params $name] < 0} {
			lappend cmd $name $value
		}
	}
}
# Eval the command

set code [catch $cmd result]


