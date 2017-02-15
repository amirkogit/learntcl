#
# Example 24-2
# A platform-specific cancel event.
#

proc Platform_CancelEvent {} {
	global tcl_platform
	switch $tcl_platform(platform) {
		unix {
			event add <<Cancel>> <Control-c>
		}
		windows {
			event add <<Cancel>> <Escape>
		}
		macintosh {
			event add <<Cancel>> <Command-period>
		}
	}
}
bind .top.entry <<Cancel>> Stop


