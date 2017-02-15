#
# Example 10-3
# Using eval with $args.
#

# PackedButton creates and packs a button.
proc PackedButton {path txt cmd {pack {-side right}} args} {
	eval {button $path -text $txt -command $cmd} $args
	eval {pack $path} $pack
}


