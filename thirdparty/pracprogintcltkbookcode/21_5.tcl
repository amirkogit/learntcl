#
# Example 21-5
# Examples of synchronous message sending.
#

set t [thread::create];# Create a thread
#=> 1572
set myX 42;# Create a variable in the main thread
#=> 42
# Copy the value to a variable in the worker thread
thread::send $t [list set yourX $myX]
#=> 42
# Perform a calculation in the worker thread
thread::send $t {expr { $yourX / 2 } }
#=> 21
thread::send $t {expr { $yourX / 0 } }
#=> divide by zero
catch {thread::send $t {expr { $yourX / 0 } } } ret
#=> 1
puts $ret
#=> divide by zero
puts $errorInfo
#=> divide by zero
while executing
"expr { $yourX / 0 } "
invoked from within
"thread::send $t {expr { $yourX / 0 } } "


