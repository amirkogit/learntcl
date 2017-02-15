#
# Example 7-4
# A random number generator. 
#

proc RandomInit { seed } {
	global randomSeed
	set randomSeed $seed
}
proc Random {} {
	global randomSeed
	set randomSeed [expr ($randomSeed*9301 + 49297) % 233280]
	return [expr $randomSeed/double(233280)]
}
proc RandomRange { range } {
	expr int([Random]*$range)	
}
RandomInit [pid]
#=> 5049
Random
#=> 0.517686899863
Random
#=> 0.217176783265
RandomRange 100
#=> 17


