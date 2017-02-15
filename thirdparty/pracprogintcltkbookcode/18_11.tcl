#
# Example 18-11
# The SiteLink procedure.
#

proc SiteLink {label} {
	global site
	array set map $site(pages)
	if {[info exist map($label)]} {
		return "<a href=\" $map($label)\" >$label</a>"
	} else {
		return $label
	}
}


