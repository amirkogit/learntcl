#
# Example 16-1
# A read event file handler.
#

proc Reader { pipe } {
	global done
	if {[eof $pipe]} {
		catch {close $pipe}
		set done 1
		return
	}
	gets $pipe line
	# Process the line here...
}
set pipe [open "|some command"]
fileevent $pipe readable [list Reader $pipe]
vwait done


