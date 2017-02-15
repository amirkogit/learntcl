#
# Example 44-2
# Telling other applications what your name is.
#

foreach app [winfo interps] {
	catch {send $app [list Iam [tk appname]]}
}


