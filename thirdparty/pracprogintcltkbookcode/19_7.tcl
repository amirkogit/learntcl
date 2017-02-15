#
# Example 19-7
# Opening a file for an unsafe interpreter.
#

proc TempfileAlias {slave} {
	set i 0
	while {[file exists Temp$slave$i]} {
		incr i
	}
	set out [open Temp$slave$i w+]
	interp transfer {} $out $slave
	return $out
}
proc TempfileExitAlias {slave} {
	foreach file [glob -nocomplain Temp$slave*] {
		file delete -force $file
	}
	interp delete $slave
}
interp create -safe foo
interp alias foo Tempfile {} TempfileAlias foo
interp alias foo exit {} TempfileExitAlias foo


