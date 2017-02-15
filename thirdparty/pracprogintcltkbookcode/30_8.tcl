#
# Example 30-8
# Using the <<MenuSelect>> virtual event.
#

proc MenuChanged {w} {
	puts "Menu $w selection: [$w entrycget active -label]"
}
bind .mbar.file <<MenuSelect>> {MenuChanged %W}


