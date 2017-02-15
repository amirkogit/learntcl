#
# Example 21-6
# Using a return variable with synchronous message sending.
#

thread::send $t {incr yourX 2} myY
#=> 0
puts $myY
#=> 44
thread::send $t {expr { acos($yourX) } } ret
#=> 1
puts $ret
#=> domain error: argument not in valid range
puts $errorInfo
#=> domain error: argument not in valid range
while executing
"expr { acos($yourX) } "


