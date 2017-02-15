#
# Example 18-19
# The /debug/source Application Direct URL implementation.
#

proc Debug/source {source} {
	global Httpd Config errorInfo
	set source [file tail $source]
	set dirlist $Httpd(library)									;# TclHttpd implementation
	lappend dirlist $Config(lib)									;# Application custom code
	foreach dir $dirlist {
		set file [file join $dir $source]
		if {[file exists $file]} break
	}
	set error [catch {uplevel #0 [list source $file]} result]
	set html "<title>Source $source</title>\n"
	if {$error} {
		append html "<H1>Error in $source</H1>\n"
		append html "<pre>$result<p>$errorInfo</pre>"
	} else {
		append html "<H1>Reloaded $source</H1>\n"
		append html "<pre>$result</pre>"
	}
	return $html
}


