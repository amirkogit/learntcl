#
# Example 10-2
# Generating procedures dynamically with a template.
#

proc TraceGen {procName} {
	rename $procName $procName-orig
	set arglist {}
	foreach arg [info args $procName-orig] {
		append arglist "\$$arg "
	}
	proc $procName [info args $procName-orig] [format {
		global _trace_count _trace_msec
		incr _trace_count(%1$s)
		incr _trace_msec(%1$s) [lindex [time {
			set result [%1$s-orig %2$s]
		} 1] 0]
		return $result
	} $procName $arglist]
}


