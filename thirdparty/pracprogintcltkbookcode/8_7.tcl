#
# Example 8-7
# Using arrays for records, version 3.
#

proc Emp_AddRecord {id name manager phone} {
	global employee
	set employee($name) [list $name $id $manager $phone]
	set employee($id) $name
}
proc Emp_Manager {name} {
	global employee
	return [lindex $employee($name) 2]
}


