#
# Example 15-1
# MIME character sets.and file encodings.
#

proc Mime_SetEncoding {file charset} {
	regsub -all {(iso|jis|us)-} $charset {\1} charset
	set charset [string tolower charset]
	regsub usascii $charset ascii charset
	fconfigure $file -encoding $charset
}


