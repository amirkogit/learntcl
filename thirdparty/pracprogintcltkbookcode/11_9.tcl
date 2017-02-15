#
# Example 11-9
# Html_Parse.
#

proc Html_Parse {html cmd {start {}}} {

	# Map braces and backslashes into HTML entities
	regsub -all \{ $html {\&ob;} html
	regsub -all \} $html {\&cb;} html
	regsub -all {\\} $html {\&bsl;} html

	# This pattern matches the parts of an HTML tag
	set s" \t\r\n"					;# white space
	set exp <(/?)(\[^$s>]+)\[$s]*(\[^>]*)>

	# This generates a call to cmd with HTML tag parts
	# \1 is the leading /, if any
	# \2 is the HTML tag name
	# \3 is the parameters to the tag, if any
	# The curly braces at either end group of all the text
	# after the HTML tag, which becomes the last arg to $cmd.
	set sub "\}\n$cmd {\\2} {\\1} {\\3} \{"
	regsub -all $exp $html $sub html

	# This balances the curly braces,
	# and calls $cmd with $start as a pseudo-tag 
	# at the beginning and end of the script.
	eval "$cmd {$start} {} {} {$html}"
	eval "$cmd {$start} / {} {}"
}


