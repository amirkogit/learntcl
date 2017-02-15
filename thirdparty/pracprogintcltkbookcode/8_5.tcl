#
# Example 8-5
# Using arrays for records, version 1.
#

proc Emp_AddRecord {id name manager phone} {
	global employeeID employeeManager \
		employeePhone employeeName
	set employeeID($name) $id
	set employeeManager($name) $manager
	set employeePhone($name) $phone
	set employeeName($id) $name
}
proc Emp_Manager {name} {
	global employeeManager
	return $employeeManager($name)
}


