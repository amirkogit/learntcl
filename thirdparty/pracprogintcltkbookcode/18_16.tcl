#
# Example 18-16
# A self-checking form procedure.
#

proc Form_Simple {id fields nextpage} {
	global page
	if {![html::varEmpty formid]} {
		# Incoming form values, check them
		set check 1
	} else {
		# First time through the page
		set check 0
	}
	set html "<!-- Self-posting. Next page is $nextpage -->\n"
	append html "<form action=\"$page(url)\" method=post>\n"
	append html "<input type=hidden name=formid value=$id>\n"
	append html "<table border=1>\n"
	foreach {required key label} $fields {
		append html "<tr><td>"
		if {$check && $required && [html::varEmpty $key]} {
			lappend missing $label
			append html "<font color=red>*</font>"
		}
		append html "</td><td>$label</td>\n"
		append html "<td><input [html::formValue $key]></td>\n"
		append html "</tr>\n"
	}
	append html "</table>\n"
	if {$check} {
		if {![info exist missing]} {

			# No missing fields, so advance to the next page.
			# In practice, you must save the existing fields 
			# at this point before redirecting to the next page.

			Doc_Redirect $nextpage
		} else {
			set msg "<font color=red>Please fill in "
			append msg [join $missing ", "]
			append msg "</font>"
			set html <p>$msg\n$html
		}
	}
	append html "<input type=submit>\n</form>\n"
	return $html
}


