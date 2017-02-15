#
# Example 35-2
# Choosing items from a listbox.
#

proc List_Select { parent values } {
	# Create two lists side by side
	frame $parent
	set choices [Scrolled_Listbox $parent.choices \
		-width 20 -height 5 ]
	set picked [Scrolled_Listbox $parent.picked \
		-width 20 -height 5]
	pack $parent.choices $parent.picked -side left \
		-expand true -fill both

	# Selecting in choices moves items into picked
	bind $choices <ButtonRelease-1> \
		[list ListTransferSel %W $picked]

	# Selecting in picked deletes items
	bind $picked <ButtonRelease-1> \
		{ListDeleteSel %W %y}

	# Insert all the choices
	foreach x $values {
		$choices insert end $x
	}
}
proc ListTransferSel {src dst} {
	foreach i [$src curselection] {
		$dst insert end [$src get $i]
	}
}
proc ListDeleteSel {w y} {
	foreach i [lsort -integer -decreasing [$w curselection]] {
		$w delete $i
	}
}
proc List_SelectValues {parent} {
	set picked $parent.picked.list
	set result {}
	foreach i [$w curselection] {
		lappend result [$w get $i]
	}
}
List_Select .f {apples oranges bananas \
				grapes mangos peaches pears}
pack .f -expand true -fill both


