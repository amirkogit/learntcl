# This re-writes a file, which in the process converts all
# the end-of-line characters to Windows-style cr-lf.

proc ToDos {pat} {
    # pat is a glob pattern
    foreach f [glob $pat] {
	puts $f ; update
	set in [open $f]
	set X [read $in]
	close $in
	set out [open $f w]
        fconfigure $out -trans crlf
	puts -nonewline $out $X
	close $out
    }
}
