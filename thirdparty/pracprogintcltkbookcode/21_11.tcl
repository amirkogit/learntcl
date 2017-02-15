#
# Example 21-11
# Working around Tcl' s socket transfer bug by initializing socket support.
#

set t [thread::create {
	# Initialize socket support by opening and closing
	# a server socket.

	close [socket -server {} 0]

	# Now sockets can be transferred safely into this thread.

	thread::wait
}]


