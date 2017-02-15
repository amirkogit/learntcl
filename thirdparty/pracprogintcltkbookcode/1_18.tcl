#
# Example 1-18
# Controlling precision with tcl_precision.
#

expr 1 / 3
#=> 0
expr 1 / 3.0
#=> 0.333333333333
set tcl_precision 17
#=> 17
expr 1 / 3.0
# The trailing 1 is the IEEE rounding digit
#=> 0.33333333333333331


