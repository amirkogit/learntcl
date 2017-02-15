#
# Example 19-6
# Substitutions and hidden commands.
#

interp alias slave open {} safeopen slave
proc safeopen {slave filename {mode r}} {
	# do some checks, then...
	interp invokehidden $slave open $filename $mode
}
interp eval slave {open \[exit\]}


