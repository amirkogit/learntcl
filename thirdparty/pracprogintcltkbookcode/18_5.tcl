#
# Example 18-5
# A sample document type handler.
#

# Add this line to mime.types
Mtype_Add application/myjunk .junk

# Define the document handler procedure
#	path is the name of the file on disk
#	suffix is part of the URL after the domain prefix
#	sock is the handle on the client connection

proc Doc_application/myjunk {path suffix sock} {
	upvar #0 Httpd$sock data
	# data(url) is more useful than the suffix parameter.

	# Use the contents of file $path to compute a page
	set contents [somefunc $path]

	# Determine your content type
	set type text/html

	# Return the page
	Httpd_ReturnData $sock $type $data
}


