#
# Example 30-4
# Radiobuttons and checkbuttons.
#

proc ShowChoices { parent varname args } {
	set f [frame $parent.choices -borderwidth 5]
	set b 0
	foreach item $args {
		radiobutton $f.$b -variable $varname \
			-text $item -value $item
		pack $f.$b -side left
		incr b
	}
	pack $f -side top
}
proc ShowBooleans { parent args } {
	set f [frame $parent.booleans -borderwidth 5]
	set b 0
	foreach item $args {
		checkbutton $f.$b -text $item -variable $item
		pack $f.$b -side left
		incr b
	}
	pack $f -side top
}
set choice kiwi
ShowChoices {} choice apple orange peach kiwi strawberry
set Bold 1 ; set Italic 1
ShowBooleans {} Bold Italic Underline


