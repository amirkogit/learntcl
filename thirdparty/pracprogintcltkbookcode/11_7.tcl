#
# Example 11-7
# Cgi_Parse and Cgi_Value store query data in the cgi array.
#

proc Cgi_Parse {} {
	global cgi cgilist
	catch {unset cgi cgilist}
	set query [Cgi_Query]
	regsub -all {\+} $query { } query
	foreach {name value} [split $query &=] {
		set name [CgiDecode $name]
		if {[info exists cgilist($name)] &&
				($cgilist($name) == 1)} {
			# Add second value and create list structure
			set cgi($name) [list $cgi($name) \
				[Url_Decode $value]]
		} elseif {[info exists cgi($name)]} {
			# Add additional list elements
			lappend cgi($name) [CgiDecode $value]
		} else {
			# Add first value without list structure
			set cgi($name) [CgiDecode $value]
			set cgilist($name) 0							;# May need to listify
		}
		incr cgilist($name)
	}
	return [array names cgi]
} 
proc Cgi_Value {key} {
	global cgi
	if {[info exists cgi($key)]} {
		return $cgi($key)
	} else {
		return {}
	}
}
proc Cgi_Length {key} {
	global cgilist
	if {[info exist cgilist($key)]} {
		return $cgilist($key)
	} else {
		return 0
	}
}


