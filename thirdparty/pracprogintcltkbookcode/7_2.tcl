#
# Example 7-2
# Variable number of arguments.
#

proc ArgTest {a {b foo} args} {
	foreach param {a b args} {
		puts stdout "\t$param = [set $param]"
	}
}
set x one
set y {two things}
set z \[special\$
ArgTest $x
#=>	a = one
	b = foo
	args = 
ArgTest $y $z
#=>	a = two things
	b = [special$
	args = 
ArgTest $x $y $z
#=>	a = one
	b = two things
	args = {[special$}
ArgTest $z $y $z $x
#=>	a = [special$
	b = two things
	args = {[special$} one


