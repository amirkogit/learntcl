#
# Example 21-1
# Creating a separate thread to perform a lengthy operation.
#

package require Thread

# Create a separate thread to search the current directory
# and all its subdirectories, recursively, for all files
# ending in the extension ".tcl". Store the results in the
# file "files.txt".

thread::create {
	# Load the Tcllib fileutil package to use its
	# findByPattern procedure.

	package require fileutil

	set files [fileutil::findByPattern [pwd] *.tcl]

	set fid [open files.txt w]
	puts $fid [join $files \n]
	close $fid
}

# The main thread can perform other tasks in parallel...


