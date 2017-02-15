#
# Example 42-3
# A gridded, resizable listbox.
#

wm minsize . 5 3
button .quit -text Quit -command exit
pack .quit -side top -anchor e
Scrolled_Listbox .f -width 10 -height 5 -setgrid true
pack .f -side top -fill both -expand true


