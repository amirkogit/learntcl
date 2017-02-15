#
# Example 36-1
# Tag configurations for basic character styles.
#

proc TextStyles { t } {
	$t tag configure bold -font {times 12 bold}
	$t tag configure italic -font {times 12 italic}
	$t tag configure fixed -font {courier 12}
	$t tag configure underline -underline true
	$t tag configure super -offset 6 -font {helvetica 8}
	$t tag configure sub -offset -6 -font {helvetica 8}
}


