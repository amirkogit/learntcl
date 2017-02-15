#
# Example 6-12
# Multiple value lists with foreach.
#

foreach {k1 k2} {orange blue red green black} value {55 72 24} {
	puts "$k1 $k2: $value"
}
orange blue: 55
red green: 72
black : 24


