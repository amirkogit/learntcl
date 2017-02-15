#
# Example 8-6
# Using arrays for records, version 2.
#

proc Emp_AddRecord {id name manager phone} {
	global employee
	set employee(id,$name) $id
	set employee(manager,$name) $manager
	set employee(phone,$name) $phone
	set employee(name,$id) $name
}
proc Emp_Manager {name} {
	global employee
	return $employee(manager,$name)
}


