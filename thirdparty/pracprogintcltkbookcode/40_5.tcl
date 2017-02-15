#
# Example 40-5
# Borders and padding.
#

frame .f -bg white
label .f.one -text One -relief raised -bd 2 -padx 3m -pady 2m
pack .f.one -side top
label .f.two -text Two \
	-highlightthickness 4 -highlightcolor red \
	-borderwidth 5 -relief raised \
	-padx 0 -pady 0 \
	-width 10 -anchor nw
pack .f.two -side top -pady 10 -ipady 10 -fill both
focus .f.two
pack .f


