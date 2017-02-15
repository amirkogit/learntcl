#
# Example 16-2
# Using vwait to activate the event loop.
#

proc Stdin_Start {prompt} {
	global Stdin
	set Stdin(line) ""
	puts -nonewline $prompt
	flush stdout
	fileevent stdin readable [list StdinRead $prompt]
	vwait Stdin(wait)
}
proc StdinRead {prompt} {
	global Stdin
	if {[eof stdin]} {
		exit
	}
	append Stdin(line) [gets stdin]
	if {[info complete $Stdin(line)]} {
		catch {uplevel #0 $Stdin(line)} result
		puts $result
		puts -nonewline $prompt
		flush stdout
		set Stdin(line) {}
	} else {
		append Stdin(line) \n
	}
}


