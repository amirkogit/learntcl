#
# Example 36-4
# Delayed creation of embedded widgets.
#

$t window create end -create [list MakeGoBack $t]
proc MakeGoBack { t } {
	button $t.goback -text "Go to Line 1" \
		-command [list $t see 1.0]
}


