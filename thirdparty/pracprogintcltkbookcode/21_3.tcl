#
# Example 21-3
# Creating several threads in an application.
#

package require Thread

puts "*** I'm thread [thread::id]"

# Create 3 threads

for {set thread 1} {$thread <= 3} {incr thread} {
	set id [thread::create {

		# Print a hello message 3 times, waiting
		# a random amount of time between messages

		for {set i 1} {$i <= 3} {incr i} {
			after [expr { int(500*rand()) }]
			puts "Thread [thread::id] says hello"
		}

	}] ;# thread::create

	puts "*** Started thread $id"
} ;# for

puts "*** Existing threads: [thread::names]"

# Wait until all other threads are finished

while {[llength [thread::names]] > 1} {
	after 500
}

puts "*** That's all, folks!"


