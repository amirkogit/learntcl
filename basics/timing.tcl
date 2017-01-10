# https://tcl.tk/man/tcl8.5/tutorial/Tcl39.html

proc timetst1 {lst} {
    set x [lsearch $lst "5000"]
    return $x
}

proc timetst2 {array} {
    upvar $array a
    return $a(5000);
}

# Make a long list and a large array.
for {set i 0} {$i < 5001} {incr i} {
    set array($i) $i
    lappend list $i
}

puts "Time for list search: [ time {timetst1 $list} 10]"
puts "Time for array index: [ time {timetst2 array} 10]"

#Output:
# Time for list search: 46.1 microseconds per iteration
# Time for array index: 2.6 microseconds per iteration