#
# Example 35-1
# Using listvariable to link a listbox and variable.
#

listbox .choices -height 5 -width 20 -listvariable states
pack .choices
lappend states Arizona
lappend states California "New Mexico"


