#
# Example 18-3
# Application Direct URLs.
#

Direct_Url /demo Demo
proc Demo {} {
	return "<html><head><title>Demo page</title></head>\n\
		<body><h1>Demo page</h1>\n\
		<a href=/demo/time>What time is it?</a>\n\
		<form action=/demo/echo>\n\
		Data: <input type=text name=data>\n\
		<br>\n\
		<input type=submit name=echo value=\" Echo Data\" >\n\
		</form>\n\
		</body></html>"
}
proc Demo/time {{format "%H:%M:%S"}} {
	return [clock format [clock seconds] -format $format]
}
proc Demo/echo {args} {
	# Compute a page that echoes the query data
	set html "<head><title>Echo</title></head>\n"
	append html "<body>"
	append html [html::tableFromList $args "border=1"]
	return $html
}


