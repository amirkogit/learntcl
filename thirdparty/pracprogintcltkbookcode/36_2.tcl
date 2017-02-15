#
# Example 36-2
# Line spacing and justification in the text widget.
#

proc TextExample { f } {
	frame $f
	pack $f -side top -fill both -expand true
	set t [text $f.t -setgrid true -wrap word \
		-width 42 -height 14 \
		-yscrollcommand "$f.sy set"]
	scrollbar $f.sy -orient vert -command "$f.t yview"
	pack $f.sy -side right -fill y
	pack $f.t -side left -fill both -expand true

	$t tag configure para -spacing1 0.25i -spacing2 0.1i \
		-lmargin1 0.5i -lmargin2 0.1i -rmargin 0.5i
	$t tag configure hang -lmargin1 0.1i -lmargin2 0.5i

	$t insert end "Here is a line with no special settings\n"
	$t insert end "Now is the time for all good women and men to come to the aid of their country. In this great time of need, no one can avoid their responsibility.\n"
	$t insert end "The quick brown fox jumps over the lazy dog."

	$t tag add para 2.0 2.end
	$t tag add hang 3.0 3.end
}


