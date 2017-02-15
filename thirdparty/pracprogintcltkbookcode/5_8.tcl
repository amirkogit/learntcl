#
# Example 5-8
# Sorting a list using a comparison function.
#

proc NameCompare {a b} {
	set alast [lindex $a end]
	set blast [lindex $b end]
	set res [string compare $alast $blast]
	if {$res != 0} {
		return $res
	} else {
		return [string compare $a $b]
	}
}
set list {{Brent B. Welch} {John Ousterhout} {Miles Davis}}
#=> {Brent B. Welch} {John Ousterhout} {Miles Davis}
lsort -command NameCompare $list
#=> {Miles Davis} {John Ousterhout} {Brent B. Welch}


