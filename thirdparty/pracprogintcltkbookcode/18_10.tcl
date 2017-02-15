#
# Example 18-10
# SiteMenu and SiteFooter template procedures.
#

array set site {
	bg			white
	fg			black
	mainlogo			/images/mainLogo.gif
}
proc SitePage {title} {
	global site
	set html "<html><head><title>$title</title></head>\n\
		<body bgcolor=$site(bg) text=$site(fg)>\n\
		<!-- Two Column Layout -->\n\
		<table cellpadding=0>\n\
		<tr><td>\n\
		<!-- Left Column -->\n\
		<img src=\" $site(mainlogo)\" >\n\
		<font size=+1>\n\
		[SiteMenu <br> $site(pages)]\n\
		</font>\n\
		</td><td>\n\
		<!-- Right Column -->\n\
		<h1>$title</h1>\n\
		<p>\n"
	return $html
}
proc SiteFooter {} {
	global site
	set html "<p><hr>\n\
		<font size=-1>[SiteMenu | $site(pages)]</font>\n\
		<!-- Close Right Column -->\n\
		</td></tr></table>\n"
	return $html
}
proc SiteMenu {sep list} {
	global page
	set s ""
	set html ""
	foreach {label url} $list {
		if {[string compare $page(url) $url] == 0} {
			append html $s$label
		} else {
			append html "$s<a href=\" $url\" >$label</a>"
		}
		set s $sep
	}
	return $html
}


