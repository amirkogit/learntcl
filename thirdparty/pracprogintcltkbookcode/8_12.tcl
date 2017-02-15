#
# Example 8-12
# A simple in-memory database.
#

namespace eval db {
	variable data						;# Array of data blobs
	variable uid 0						;# Index into data
	variable index						;# Cross references into data
}
proc db::insert {keylist datablob} {
	variable data
	variable uid
	variable index
	set data([incr uid]) $datablob
	foreach key $keylist {
		lappend index($key) $uid
	}
}
proc db::get {key} {
	variable data
	variable index
	set result {}
	if {![info exist index($key)]} {
		return {}
	}
	foreach uid $index($key) {
		lappend result $data($uid)
	}
	return $result
}
proc db::save {filename} {
	variable uid
	set out [open $filename w]
	puts $out [list namespace eval db \
		[list variable uid $uid]]
	puts $out [list array set db::data [array get db::data]]
	puts $out [list array set db::index [array get db::index]]
	close $out
}
proc db::load {filename} {
	source $filename
}


