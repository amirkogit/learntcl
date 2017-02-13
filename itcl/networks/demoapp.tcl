# usage: use wish to launch interpeter not tclsh !
# %wish demoapp.tcl

source network.tcl
source networknode.tcl
source point.tcl

puts "Networks demo"
puts "--------------"

Network net
net Initialize

NetworkNode n1 "one" [Point #auto 100 100]
NetworkNode n2 "two" [Point #auto 150 150]
NetworkNode n3 "three" [Point #auto 200 120]
NetworkNode n4 "four" [Point #auto 50 50]
NetworkNode n5 "five" [Point #auto 125 220]
NetworkNode n6 "six" [Point #auto 260 120]

puts "Inputs nodes"
puts "-------------"
n1 PrintOn stdout ; puts ""
n2 PrintOn stdout ; puts ""
n3 PrintOn stdout ; puts ""
n4 PrintOn stdout ; puts ""
n5 PrintOn stdout ; puts ""
n6 PrintOn stdout ; puts ""

puts ""

net ConnectTo n1 n2
net ConnectTo n2 n3
net ConnectTo n4 n5
net ConnectTo n5 n1
net ConnectTo n3 n6
net ConnectTo n3 n5
net ConnectTo n3 n1

puts "List of all nodes and their connections in net"
puts "----------------------------------------------"
net PrintOn stdout

puts "\nFinding a path from n1 to n5"
puts "-------------------------------"
Network ret
ret = [net PathFromToAvoiding n1 n5 ""]
ret PrintOn stdout

puts "\nTo see a path from n1 to n5 that does not go through n3"
puts "----------------------------------------------------------"
ret = [net PathFromToAvoiding n1 n5 n3]
ret PrintOn stdout
