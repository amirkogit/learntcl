# https://tcl.tk/man/tcl8.5/tutorial/Tcl28.html

puts "This is how many commands have been executed: [info cmdcount]"
puts "Now  *THIS* many commands have been executed: [info cmdcount]"

puts "\nThis interpreter is revision level: [info tclversion]"
puts "This interpreter is at patch level: [info patchlevel]"

puts "The process id for this program is [pid]"

proc factorial {val} {
    puts "Current level: [info level] - val: $val"
    set lvl [info level]
    if {$lvl == $val} {
        return $val
    }
    return [expr {($val-$lvl) * [factorial $val]}]
}

set count1 [info cmdcount]
set fact [factorial 3]
set count2 [info cmdcount]
puts "The factorial of 3 is $fact"
puts "Before calling the factorial proc, $count1 commands had been executed"
puts "After calling the factorial proc, $count2 commands had been executed"
puts "It took [expr $count2-$count1] commands to calculate this factorial"

#
# Use [info script] to determine where the other files of interest
# reside
#
set sysdir [file dirname [info script]]
source [file join $sysdir "utils.tcl"]

# Output:
# This is how many commands have been executed: 128
# Now  *THIS* many commands have been executed: 131

# This interpreter is revision level: 8.6
# This interpreter is at patch level: 8.6.5
# The process id for this program is 25196
# Current level: 1 - val: 3
# Current level: 2 - val: 3
# Current level: 3 - val: 3
# The factorial of 3 is 6
# Before calling the factorial proc, 143 commands had been executed
# After calling the factorial proc, 170 commands had been executed
# It took 27 commands to calculate this factorial
# couldn't read file "./utils.tcl": no such file or directory
#     while executing
# "source [file join $sysdir "utils.tcl"]"
#     (file "infoDemo2.tcl" line 33)