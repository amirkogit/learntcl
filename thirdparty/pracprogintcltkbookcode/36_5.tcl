#
# Example 36-5
# Using embedded images for a bulleted list.
#

proc BList_Setup { t imagefile } {
	global blist
	set blist(image) [image create photo -file $imagefile]
	$t tag configure bulletlist -tabs ".5c center 1c left" \
		-lmargin1 0 -lmargin2 1c
}
proc BList_Item { t text {mark insert}} {
	global blist
	# Assume we are at the beginning of the line
	$t insert $mark \t bulletlist
	$t image create $mark -image $blist(image)
	$t insert $mark \t$text bulletlist
}


