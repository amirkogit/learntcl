# Reference:http://www.andreadrian.de/itcl/chapter7.htm

package require Itcl
namespace import itcl::*

class NetworkNode {
    public {
        method Name {}
        method NamePosition {aString aPoint}
        method PrintOn {aStream}
    }

    private {
        variable _name
        variable _position
    }

    constructor {aString aPoint} {
        set _name $aString
        set _position $aPoint
    }
}

body NetworkNode::Name {} {
    return $_name
}

body NetworkNode::NamePosition {aString aPoint} {
    set _name $aString
    set _position $aPoint
}

body NetworkNode::PrintOn {aStream} {
    puts -nonewline $aStream "Node($_name [$_position PrintString])"
}