#
# Example 19-10
# Restricted puts using hidden commands.
#

proc Tempfile_PolicyInit {slave} {
	global tempfile				
	interp alias $slave open {} \
		TempfileOpenAlias $slave $tempfile(directory) \
			$tempfile(maxfile)
	interp hide $slave tell
	interp alias $slave tell {} TempfileTellAlias $slave
	interp hide $slave puts
	interp alias $slave puts {} TempfilePutsAlias $slave \
		$tempfile(maxsize)
	# no special exit alias required
}
proc TempfileOpenAlias {slave dir maxfile name {m r} {p 0777}} {
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
	if [catch {interp invokehidden $slave \
			open $real $m $p} out] {
		return -code error "$name: permission denied"
	}
	return $out
}
proc TempfileTellAlias {slave chan} {
	interp invokehidden $slave tell $chan
}
proc TempfilePutsAlias {slave max chan args} {
	if {[llength $args] > 2} {
		error "invalid arguments"
	}
	if {[llength $args] == 2} {
		if {![string match -n* [lindex $args 0]]} {
			error "invalid arguments"
		}
		set string [lindex $args 1]
	} else {
		set string [lindex $args 0]\n
	}
	set size [interp invokehidden $slave tell $chan]
	incr size [string length $string]
	if {$size > $max} {
		error "File size exceeded"
	} else {
		interp invokehidden $slave \
			puts -nonewline $chan $string
	}
}


