#
# Example 11-6
# The Cgi_List and Cgi_Query procedures.
#

proc Cgi_List {} {
	set query [Cgi_Query]
	regsub -all {\+} $query { } query
	set result {}
	foreach {x} [split $query &=] {
		lappend result [Url_Decode $x]
	}
	return $result
}
proc Cgi_Query {} {
	global env
	if {![info exists env(QUERY_STRING)] ||
			[string length $env(QUERY_STRING)] == 0} {
		if {[info exists env(CONTENT_LENGTH)] &&
				[string length $env(CONTENT_LENGTH)] != 0} {
			set query [read stdin $env(CONTENT_LENGTH)]
		} else {
			gets stdin query
		}
		set env(QUERY_STRING) $query
		set env(CONTENT_LENGTH) 0
	}
	return $env(QUERY_STRING)
}


