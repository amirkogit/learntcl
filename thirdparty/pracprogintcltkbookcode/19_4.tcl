#
# Example 19-4
# Querying aliases.
#

proc Interp_ListAliases {name out} {
	puts $out "Aliases for $name"
	foreach alias [interp aliases $name] {
		puts $out [format "%-20s => (%s) %s" $alias \
				[interp target $name $alias] \
				[interp alias $name $alias]]
	}
}


