#
# Example 29-4
# Virtual events for cut, copy, and paste.
#

switch $tcl_platform(platform) {
	 "unix" {
		event add <<Cut>> <Control-Key-x> <Key-F20> 
		event add <<Copy>> <Control-Key-c> <Key-F16>
		event add <<Paste>> <Control-Key-v> <Key-F18>
	}
	"windows" {
		event add <<Cut>> <Control-Key-x> <Shift-Key-Delete>
		event add <<Copy>> <Control-Key-c> <Control-Key-Insert>
		event add <<Paste>> <Control-Key-v> <Shift-Key-Insert>
	}
	"macintosh" {
		event add <<Cut>> <Control-Key-x> <Key-F2> 
		event add <<Copy>> <Control-Key-c> <Key-F3>
		event add <<Paste>> <Control-Key-v> <Key-F4>
	}
}


