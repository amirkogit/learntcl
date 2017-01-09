# https://tcl.tk/man/tcl8.5/tutorial/Tcl10.html

# for start test next body

for {set i 0} {$i < 10} {incr i} {
    puts "I inside first loop: $i"
}

for {set i 3} {$i < 2} {incr i} {
    puts "I inside second loop: $i"
}

puts "Start"
set i 0
while {$i < 10} {
    puts "I inside third loop: $i"
    incr i
    puts "I after incr: $i"
}

set i 0
incr i
# This is equivalent to:
set i [expr {$i + 1}]

#Output:
# I inside first loop: 0
# I inside first loop: 1
# I inside first loop: 2
# I inside first loop: 3
# I inside first loop: 4
# I inside first loop: 5
# I inside first loop: 6
# I inside first loop: 7
# I inside first loop: 8
# I inside first loop: 9
# Start
# I inside third loop: 0
# I after incr: 1
# I inside third loop: 1
# I after incr: 2
# I inside third loop: 2
# I after incr: 3
# I inside third loop: 3
# I after incr: 4
# I inside third loop: 4
# I after incr: 5
# I inside third loop: 5
# I after incr: 6
# I inside third loop: 6
# I after incr: 7
# I inside third loop: 7
# I after incr: 8
# I inside third loop: 8
# I after incr: 9
# I inside third loop: 9
# I after incr: 10