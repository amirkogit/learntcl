#
# Example 6-9
# Parsing command-line arguments.
#

# argv is set by the Tcl shells
# possible flags are:
# -max integer
# -force
# -verbose
set state flag
set force 0
set verbose 0
set max 10
foreach arg $argv {
	switch -- $state {
		flag {
			switch -glob -- $arg {
				-f*		{set force 1}
				-v*		{set verbose 1}
				-max		{set state max}
				default {error "unknown flag $arg"}
			}
		}
		max {
			set max $arg
			set state flag
		}
	}
}


