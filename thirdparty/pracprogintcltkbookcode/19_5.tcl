#
# Example 19-5
# Dumping aliases as Tcl commands.
#

proc Interp_DumpAliases {name out} {
	puts $out "# Aliases for $name"
	foreach alias [interp aliases $name] {
		puts $out [format "interp alias %s %s %s %s" \
			$name $alias [list [interp target $name $alias]] \
			[interp alias $name $alias]]
	}
}


