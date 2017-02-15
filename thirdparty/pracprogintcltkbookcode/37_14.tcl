#
# Example 37-14
# Generating Postscript from a canvas.
#

proc Setup {} {
	global fontMap
	canvas .c
	pack .c -fill both -expand true
	set x 10
	set y 10
	set last [.c create text $x $y -text "Font sampler" \
		-font fixed -anchor nw]
	
	# Create several strings in different fonts and sizes

	foreach family {times courier helvetica} {
		set weight bold
		switch -- $family {
			times { set fill blue; set psfont Times}
			courier { set fill green; set psfont Courier }
			helvetica { set fill red; set psfont Helvetica }
		}
		foreach size {10 14 24} {
			set y [expr 4+[lindex [.c bbox $last] 3]]
			
			# Guard against missing fonts
			if {[catch {.c create text $x $y \
					-text $family-$weight-$size \
					-anchor nw -fill $fill \
					-font -*-$family-$weight-*-*-*-$size-*} \
			it] == 0} {
				set fontMap(-*-$family-$weight-*-*-*-$size-*)\
					[list $psfont $size]
				set last $it
			}
		}
	}
	set fontMap(fixed) [list Courier 12]
}
proc Postscript { c file } {
	global fontMap
	# Tweak the output color
	set colorMap(blue) {0.1 0.1 0.9 setrgbcolor}
	set colorMap(green) {0.0 0.9 0.1 setrgbcolor}
	# Position the text at the upper-left corner of
	# an 8.5 by 11 inch sheet of paper
	$c postscript -fontmap fontMap -colormap colorMap \
		-file $file \
		-pagex 0.i -pagey 11.i -pageanchor nw
}


