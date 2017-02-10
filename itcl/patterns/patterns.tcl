# Reference: http://www.andreadrian.de/itcl/chapter7.htm

package require Itcl
namespace import itcl::*

class Pattern {
    public {
        method MatchBlock {aBlock} {
            # set the match block of the receiver to aBlock. This block will be
            # evaluated when the pattern is fully matched.
            set _matchBlock $aBlock
        }

        method Match {anObject} {
            # compare anObject against the pattern. If anObject completed the matching
            # of the pattern, evaluate the match block.
            append _state " " $anObject
            if {[regexp $_input $_state]} {
                eval $_matchBlock
                set _state ""
            }
        }

        method Reset {} {
            # Reset the receiver to start matching at the beginning of the pattern
            set _state ""
        }
    }

    private {
        # contains the string to be used as the pattern
        variable _input

        # contains a block of code to be executed when a match occurs
        variable _matchBlock

        # contains a string denoting the current state of the pattern collection
        variable _state
    }

    constructor {aString} {
        set _input $aString
        set _matchBlock ""
        set _state ""
    }
}
