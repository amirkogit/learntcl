#
# Example 15-4
# Using msgcat::mcunknown to share message catalogs.
#

proc msgcat::mcunknown {local src} {
	variable insideUnknown
	if {![info exist insideUnknown]} {

		# Try the global namespace, being careful to note
		# that we are already inside this procedure.

		set insideUnknown true
		set result [namespace eval :: [list \
			msgcat::mc $src \
		]]
		unset insideUnknown
		return $result
	} else {

		# Being called because the message isn\" t found
		# in the global namespace

		return $src
	}
}


