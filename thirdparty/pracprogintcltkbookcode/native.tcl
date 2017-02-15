# This re-writes a file, which in the process converts all
# the end-of-line characters to that of the current platform.
# The exsource directory has all UNIX-style files, where lines
# end with newline (\n).  Some PC programs cannot deal with this
# and want \r\n sequences.  This fixes them.

proc FixNewline {{pat *} {src .} {dst {}}} {
    # pat is a glob pattern
    # src is source directory
    # dst is destination directory
    if {[string length $dst] == 0} {
	set dst $src
    }
    cd $src
    foreach f [glob $pat] {
	puts $f ; update
	set in [open $f]
	set X [read $in]
	close $in
	set out [open [file join $dst $f] w]
	puts -nonewline $out $X
	close $out
    }
    cd $dst
}
