#
# Example 21-8
# Creating a custom thread error handler.
#

set errorFile [open errors.txt a]

proc logError {id error} {
	global errorFile
	puts $errorFile "Error in thread $id"
	puts $errorFile $error
	puts $errorFile ""
}

thread::errorproc logError


