#
# Example 13-7
# Using info script to find related files.
#

# Get the directory containing the current script.
set dir [file dirname [info script]]

# Source a file in the same directory
source [file join $dir helper.tcl]

# Add an adjacent script library directory to auto_path
# The use of ../lib with file join is cross-platform safe.
lappend auto_path [file join $dir ../lib]


