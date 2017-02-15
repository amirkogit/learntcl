#
# Example 18-9
# SitePage template procedure, version 1.
#

proc SitePage {title} {
	global site
	set html "<html><head><title>$title</title></head>\n"
	append html "<body bgcolor=white text=black>\n"
	append html "<h1>$title</h1>\n"
	set sep ""
	foreach {label url} $site(pages) {
		append html $sep
		if {[string compare $label $title] == 0} {
			append html "$label"
		} else {
			append html "<a href=\" $url\" >$label</a>"
		}
		set sep " | "
	}
	return $html
}


