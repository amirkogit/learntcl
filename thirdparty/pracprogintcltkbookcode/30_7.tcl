#
# Example 30-7
# A menu bar in Tk 8.0.
#

menu .menubar
# attach it to the main window
. config -menu .menubar
# Create more cascade menus
foreach m {File Edit Help} {
	set $m [menu .menubar.m$m]
	.menubar add cascade -label $m -menu .menubar.m$m
}
$File add command -label Quit -command exit
# add more menu items...


