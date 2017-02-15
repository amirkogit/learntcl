#
# Example 9-5
# A more careful use of open.
#

if [catch {open /tmp/data r} fileId] {
	puts stderr "Cannot open /tmp/data: $fileId"
} else {
	# Read and process the file, then...
	close $fileId
}


