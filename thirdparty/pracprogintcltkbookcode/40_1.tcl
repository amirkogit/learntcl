#
# Example 40-1
# Equal-sized labels.
#

proc EqualSizedLabels { parent width height strings args } {
	set l 0
	foreach s $strings {
		frame $parent.$l -width $width -height $height
		pack propagate $parent.$l false
		pack $parent.$l -side left
		eval {label $parent.$l.l -text $s} $args
		pack $parent.$l.l -fill both -expand true
		incr l
	}
}
frame .f ; pack .f
EqualSizedLabels .f 1i 1c {apple orange strawberry kiwi} \
	-relief raised


