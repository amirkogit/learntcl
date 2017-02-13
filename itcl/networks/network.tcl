# Reference:http://www.andreadrian.de/itcl/chapter7.htm

package require Itcl
namespace import itcl::*

class Network {
    public {
        method Connections {}
        method = {aNetwork}
        method ConnectTo {nodeA nodeB}
        method Initialize {}
        method PathFromToAvoiding {nodeA nodeB nodeSet}
        method PrintOn {aStream}
    }

    private {
        variable _connections
    }

    constructor {} {}

    destructor {}
}

body Network::constructor {} {
    # puts "Created Network object"
}

body Network::destructor {} {
    # puts "Destroyed Network object"
}

body Network::Connections {} {
    return [array get _connections]
}

body Network::= {aNetwork} {
    # puts "Inside Network::="
    catch { unset _connections }
    array set _connections [$aNetwork Connections]
}

body Network::ConnectTo {nodeA nodeB} {
    # add a connection from nodeA to nodeB
    if {[info exists _connections($nodeA)]} {
        if {[lsearch $_connections($nodeA) $nodeB] < 0} {
            set _connections($nodeA) \
                    [lappend _connections($nodeA) $nodeB]
        }
    } else {
        set _connections($nodeA) $nodeB
    }

    if {[info exists _connections($nodeB)]} {
        if {[lsearch $_connections($nodeB) $nodeA] < 0} {
            set _connections($nodeB) \
                    [lappend _connections($nodeB) $nodeA]
        }
    } else {
        set _connections($nodeB) $nodeA
    }
}

body Network::Initialize {} {
    # initialize the connections to be empty
    #puts "Inside Network::Initialize"
    catch {unset _connections}
}

body Network::PathFromToAvoiding {nodeA nodeB nodeSet} {
    # a path of connections that connect nodeA to nodeB without going
    # through the nodes in nodeSet. This result is returned as a new
    # network. Answer null if there is no path

    if {[lsearch $nodeSet $nodeA] < 0} {
        lappend nodeSet $nodeA
    }

    foreach node $_connections($nodeA) {
        if {$node == $nodeB} {
            set ret [Network #auto]
            $ret Initialize
            $ret ConnectTo $nodeA $nodeB
            return $ret
        }

        if {[lsearch $nodeSet $node] < 0} {
            set answer [$this PathFromToAvoiding $node $nodeB $nodeSet]
            if {$answer != ""} {
                $answer ConnectTo $nodeA $node
                return $answer
            }
        }
    }

    return ""
}

body Network::PrintOn {aStream} {
    # print a description of the receiver on aStream
    # puts "Inside Network::PrintOn"

    foreach node [array names _connections] {
        $node PrintOn $aStream

        foreach neighbor $_connections($node) {
            puts -nonewline $aStream "\n>>"
            $neighbor PrintOn $aStream
        }
        puts $aStream ""
    }
}
