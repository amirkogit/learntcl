#
# Example 42-4
# Font selection dialog.
#

proc Font_Select {{top .fontsel}} {
	global font

	# Create File, Font, Size, and Format menus

	toplevel $top -class Fontsel -bd 10
	set menubar [menu $top.menubar]
	$top config -menu $menubar
	foreach x {File Font Size Format} {
		set menu [menu $menubar.[string tolower $x]]
		$menubar add cascade -menu $menu -label $x
	}
	$menubar.file add command -label Reset -command FontReset
	$menubar.file add command -label OK \
		-command {set font(ok) ok}
	$menubar.file add command -label Cancel \
		-command {set font(ok) cancel}

	# The Fonts menu lists the available Font families.

	set allfonts [font families]
	set numfonts [llength $allfonts]
	set limit 20
	if {$numfonts < $limit} {

		# Display the fonts in a single menu

		foreach family $allfonts {
			$menubar.font add radio -label $family \
				-variable font(-family) \
				-value $family \
				-command FontUpdate
		}
	} else {

		# Too many fonts. Create a set of cascaded menus to 
		# display all the font possibilities

		set c 0 ; set l 0
		foreach family $allfonts {
			if {$l == 0} {
				$menubar.font add cascade -label $family... \
					-menu $menubar.font.$c
				set m [menu $menubar.font.$c]
				incr c
			}
			$m add radio -label $family \
				-variable font(-family) \
				-value $family \
				-command FontUpdate
			set l [expr ($l +1) % $limit]
		}
	}

	# Complete the other menus

	foreach size {7 8 10 12 14 18 24 36 72} {
		$menubar.size add radio -label $size \
			-variable font(-size) \
			-value $size \
			-command FontUpdate
	}
	$menubar.size add command -label Other... \
			-command [list FontSetSize $top]
	$menubar.format add check -label Bold \
			-variable font(-weight) \
			-onvalue bold -offvalue normal \
			-command FontUpdate
	$menubar.format add check -label Italic \
			-variable font(-slant) \
			-onvalue italic -offvalue roman \
			-command FontUpdate
	$menubar.format add check -label underline \
		-variable font(-underline) \
		-command FontUpdate
	$menubar.format add check -label overstrike \
		-variable font(-overstrike) \
		-command FontUpdate

	# FontReset initializes the font array, which causes
	# the radio menu entries to get highlighted.

	FontReset

	# This label displays the current font

	label $top.font -textvar font(name) -bd 5
	# This message displays a sampler of the font.

	message $top.msg -aspect 1000 \
					-borderwidth 10 -font fontsel \
					-text "
ABCDEFGHIJKLMNOPQRSTUVWXYZ
abcdefghijklmnopqrstuvwxyz
0123456789
!@#$%^&*()_+-=[]{};:\"'` ~,.<>/?\\|
"

	# Lay out the dialog

	pack $top.font $top.msg -side top
	set f [frame $top.buttons]
	button $f.ok -text Ok -command {set font(ok) 1}
	button $f.cancel -text Cancel -command {set font(ok) 0}
	pack $f.ok $f.cancel -padx 10 -side left
	pack $f -side top

	# Dialog_Wait is defined in Example 37-1 on page 572

	set font(ok) cancel
	Dialog_Wait $top font(ok)
	destroy $top
	if {$font(ok) == "ok"} {
		return [array get font -*]
	} else {
		return {}
	}
}

# FontReset recreates a default font

proc FontReset {} {
	catch {font delete fontsel}
	font create fontsel
	FontSet
}

# FontSet initializes the font array with the settings
# returned by the font actual command

proc FontSet {} {
	global font

	# The name is the font configuration information
	# with a line break so it looks nicer

	set font(name) [font actual fontsel]
	regsub -- "-slant" $font(name) "\n-slant" font(name)

	# Save the actual parameters after any font substitutions

	array set font [font actual fontsel]
}

# FontSetSize adds an entry widget to the dialog so you
# can enter a specific font size.

proc FontSetSize {top} {
	set f [frame $top.size -borderwidth 10]
	pack $f -side top -fill x
	label $f.msg -text "Size:"
	entry $f.entry -textvariable font(-size)
	bind $f.entry <Return> FontUpdate
	pack $f.msg -side left
	pack $f.entry -side top -fill x
}

# FontUpdate is called when any of the font settings
# are changed, either from the menu or FontSetSize

proc FontUpdate { } {
	global font

	# The elements of font that have a leading - are
	# used directly in the font configuration command.

	eval {font configure fontsel} [array get font -*]
	FontSet
}


