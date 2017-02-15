#
# Example 13-8
# Tracing variables.
#

proc ReadOnlyVar {varName} {
	upvar 1 $varName var
	global ReadOnly
	set ReadOnly($varName) $var
	uplevel 1 [list trace variable $varName wu ReadOnlyTrace]
}
proc ReadOnlyTrace { varName index op } {
	global ReadOnly
	upvar 1 $varName var
	switch $op {
		w {
			set var $ReadOnly($varName)
		}
		u {
			set var $ReadOnly($varName)
			# Re-establish the trace using the true name
			uplevel 1 [list ReadOnlyVar $varName]
		}
	}
}


