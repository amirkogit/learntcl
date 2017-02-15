#
# Example 22-4
# The pkgIndex.tcl in a Starkit.
#

package ifneeded app-hello 1.0 \
	[list source [file join $dir hello.tcl]]


