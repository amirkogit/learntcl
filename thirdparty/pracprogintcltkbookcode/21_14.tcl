#
# Example 21-14
# Standard condition variable use.
#

# Create the condition variable and accompnaying mutex.
# Share these tokens with all other threads that need to
# access the condition variable and mutex.

set cond [thread::cond create]
set mutex [thread::mutex create]

# When we' re ready to test the predicate, we must first
# obtain the mutex protecting it.

thread::mutex lock $mutex

# Now test the predicate. If it is false, we wait until
# the predicate becomes true.

while {!$predicate} {
	# Wait for notification on the condition variable.
	# thread::cond wait internally unlocks the mutex,
	# blocks until it receives notification, then locks
	# the mutex again before returning.

	thread::cond wait $cond $mutex
}

# We now hold the mutex and know the predicate is true. Do
# whatever processing is desired, and unlock the mutex when
# it is no longer needed.

thread::mutex unlock $mutex


