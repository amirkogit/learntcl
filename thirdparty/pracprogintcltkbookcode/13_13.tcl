#
# Example 13-13
# Time Stamps in log records.
#

proc Log {args} {
	global log
	if [info exists log(file)] {
		set now [clock clicks]
		puts $log(file) [format "%s (%d)\t%s" \
			[clock format [clock seconds]] \
			[expr $now - $log(last)] \
			[join $args " "]]
		set log(last) $now
	}
}
proc Log_Open {file} {
	global log
	catch {close $log(file)}
	set log(file) [open $file w]
	set log(last) [clock clicks]
}
proc Log_Flush {} {
	global log
	catch {flush $log(file)}
}
proc Log_Close {} {
	global log
	catch {close $log(file)}
	catch {unset log(file)}
}


