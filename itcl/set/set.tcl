package require Itcl
namespace import itcl::*

class Set {

    public {
        method add: {anObject}
        method do: {varName aBlock}
        method includes: {anObject}
        method remove:ifAbsent: {anObject aBlock}
        method size {}

    }

    private {
        variable _contents ""
    }
}

body Set::add: {anObject} {
    # Add anObject to the receiver if the receiver does not already contain it.
    if {[lsearch $_contents $anObject] < 0} {
        lappend _contents $anObject
    }
    return $anObject
}

body Set::do: {varName aBlock} {
    # For each element in the receiver, evaluate aBlock with that element as the argument
    upvar $varName v
    foreach v $_contents {
        uplevel $aBlock
    }
}

body Set::includes: {anObject} {
    # true if the receiver includes anObject as one of its elements, else answer is false
    if {[lsearch $_contents $anObject] >= 0} {
        return 1
    } else {
        return 0
    }
}

body Set::remove:ifAbsent: {anObject aBlock} {
    # Remove the element anObject from the receiver collection. If anObject is not
    # an element of the receiver, aBlock is evaluated with no arguments

    set index [lsearch $_contents $anObject]
    if {$index < 0} {
        return [uplevel $aBlock]
    }

    set _contents [concat \
                [lrange $_contents 0 [expr $index -1]] \
                [lrange $_contents [expr $index + 1] end]]

    return $anObject
}

body Set::size {} {
    # returns the number of elements contained in the receiver
    return [llength $_contents]
}
