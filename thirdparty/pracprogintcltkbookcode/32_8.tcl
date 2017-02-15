#
# Example 32-8
# A scale widget.
#

scale .scale -from -10 -to 20 -length 200 -variable x \
	-orient horizontal -label "The value of X" \
	-tickinterval 5 -showvalue true
pack .scale


