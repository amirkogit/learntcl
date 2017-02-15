#
# Example 17-2
# Opening a server socket.
#

set listenSocket [socket -server Accept 2540]
proc Accept {newSock addr port} {
	puts "Accepted $newSock from $addr port $port"
}
vwait forever


