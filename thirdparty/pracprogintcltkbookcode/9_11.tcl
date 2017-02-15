#
# Example 9-11
# Finding a file by name.
#

proc FindFile { startDir namePat } {
	set pwd [pwd]
	if {[catch {cd $startDir} err]} {
		puts stderr $err
		return
	}
	foreach match [glob -nocomplain -- $namePat] {
		puts stdout [file join $startDir $match]
	}
	foreach file {[glob -nocomplain *]} {
		if [file isdirectory $file] {
			FindFile [file join $startDir $file] $namePat
		}
	}
	cd $pwd
}


