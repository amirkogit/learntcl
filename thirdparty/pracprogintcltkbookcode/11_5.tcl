#
# Example 11-5
# The Url_Decode procedure.
#

proc Url_Decode {url} {
	regsub -all {\+} $url { } url
	regsub -all {%([:xdigit:]]{2})} $url \
		{[format %c 0x\1]} url
	return [subst $url]
}


