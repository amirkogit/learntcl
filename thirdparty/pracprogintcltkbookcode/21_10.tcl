#
# Example 21-10
# Deferring socket transfer until after the connection callback returns.
#

proc _ClientConnect {sock host port} {
after 0 [list ClientConnect $sock $host $port]
}

proc ClientConnect {sock host port} {
# Create the client thread and transfer the channel
}


