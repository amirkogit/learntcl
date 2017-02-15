#
# Example 19-9
# The Tempfile security policy.
#

# Policy parameters:
# 	directory is the location for the files
# 	maxfile is the number of files allowed in the directory
# 	maxsize is the max size for any single file.

array set tempfile {
	maxfile				4
	maxsize				65536
}
# tempfile(directory) is computed dynamically based on
# the source of the script

proc Tempfile_PolicyInit {slave} {
	global tempfile				
	interp alias $slave open {} \
		TempfileOpenAlias $slave $tempfile(directory) \
			$tempfile(maxfile)
	interp alias $slave puts {} TempfilePutsAlias $slave \
		$tempfile(maxsize)
	interp alias $slave exit {} TempfileExitAlias $slave
}
proc TempfileOpenAlias {slave dir maxfile name {m r} {p 0777}} {
	global tempfile
	# remove sneaky characters
	regsub -all {|/:} [file tail $name] {} real
	set real [file join $dir $real]
	# Limit the number of files
	set files [glob -nocomplain [file join $dir *]]
	set N [llength $files]
	if {($N >= $maxfile) && (\
			[lsearch -exact $files $real] < 0)} {
		error "permission denied"
	}
	if [catch {open $real $m $p} out] {
		return -code error "$name: permission denied"
	}
	lappend tempfile(channels,$slave) $out
	interp share {} $out $slave
	return $out
}
proc TempfileExitAlias {slave} {
	global tempfile
	interp delete $slave
	if [info exists tempfile(channels,$slave)] {
		foreach out $tempfile(channels,$slave) {
			catch {close $out}
		}
		unset tempfile(channels,$slave)
	}
}
# See also the puts alias in Example 23-4 on page 359
proc TempfilePutsAlias {slave max chan args} {
	# max is the file size limit, in bytes
	# chan is the I/O channel
	# args is either a single string argument,
	# or the -nonewline flag plus the string.

	if {[llength $args] > 2} {
		error "invalid arguments"
	}
	if {[llength $args] == 2} {
		if {![string match -n* [lindex $argv 0]]} {
			error "invalid arguments"
		}
		set string [lindex $args 1]
	} else {
		set string [lindex $args 0]\n
	}
	set size [expr [tell $chan] + [string length $string]]
	if {$size > $max} {
		error "File size exceeded"
	} else {
		puts -nonewline $chan $string
	}
}


