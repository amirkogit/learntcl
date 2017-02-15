#
# Example 22-17
# Adding Data to a View.
#

mk::set mydb.test!0 name hello
#=> mydb.test!0
mk::get mydb.test!0
#=> hello {} 0
mk::row append mydb.test "line two" 0x0 65
#=> mydb.test!1
mk::view size mydb.test
#=> 2
mk::set mydb.test!100 i 1234
#=> mydb.test!100
mk::view size mydb.test
#=> 101


