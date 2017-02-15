#
# Example 22-16
# Creating a New View.
#

mk::file open mydb mydb.tkd
#=> mydb
mk::view layout mydb.test {name blob:B i:I}
#=> mydb.test
mk::file close mydb


