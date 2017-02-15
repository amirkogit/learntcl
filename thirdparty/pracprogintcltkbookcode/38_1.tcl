#
# Example 38-1
# Paste the PRIMARY or CLIPBOARD selection.
#

proc Paste { text } {
	if [catch {selection get} sel] {
		if [catch {selection get -selection CLIPBOARD} sel] {
			# no selection or clipboard data
			return
		}
	}
	$text insert insert $sel
}


