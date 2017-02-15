#
# Example 22-5
# A Starkit that examines its Virtual File System.
#

package require starkit
starkit::startup

puts "Contents of VFS before"
foreach f [glob $starkit::topdir/*] {
	puts "[file size $f] $f"
}
puts "Reading data file"
set in [open $starkit::topdir/data]
set X [read $in]
puts $X
close $in
set out [open $starkit::topdir/data.new w]
puts $out $X
close $out
puts "Contents of VFS after"
foreach f [glob $starkit::topdir/*] {
	puts "[file size $f] $f"
}


