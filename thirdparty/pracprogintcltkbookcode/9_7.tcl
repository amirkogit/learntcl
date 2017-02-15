#
# Example 9-7
# Prompting for input.
#

puts -nonewline "Enter value: "
flush stdout				;# Necessary to get partial line output
set answer [gets stdin]


