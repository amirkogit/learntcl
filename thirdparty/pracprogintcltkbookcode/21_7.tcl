#
# Example 21-7
# Executing commands after thread::wait returns.
#

set t [thread::create {
puts "Starting worker thread"
thread::wait
# This is executed after the thread is released
puts "Exiting worker thread"
}]


