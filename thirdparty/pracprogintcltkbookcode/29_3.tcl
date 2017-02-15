#
# Example 29-3
# Emacs-like binding convention for Meta and Escape.
#

proc BindSequence { w seq cmd } {
	bind $w $seq $cmd
	# Double-bind Meta-key and Escape-key
	if [regexp {<Meta-(.*)>} $seq match letter] {
		bind $w <Escape><$letter> $cmd
	}
	# Make leading keystroke harmless
	if [regexp {(<.+>)<.+>} $seq match prefix] {
		bind $w $prefix break
	}
}


