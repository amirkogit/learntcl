#
# Example 21-9
# A basic implementation of a logging thread.
#

set logger [::thread::create {
	proc OpenLog {file} {
		global fid
		set fid [open $file a]
	}
	proc CloseLog {} {
		global fid
		close $fid
	}
	proc AddLog {msg} {
		global fid
		puts $fid $msg
	}
	::thread::wait
}]


