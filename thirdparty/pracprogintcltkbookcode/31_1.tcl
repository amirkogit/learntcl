#
# Example 31-1
# Reading an option database file.
#

if [file exists $appdefaults] {
	if [catch {option readfile $appdefaults startup} err] {
		puts stderr " error in $appdefaults: $err" 
	}
}


