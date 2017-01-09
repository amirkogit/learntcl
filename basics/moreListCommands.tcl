# https://tcl.tk/man/tcl8.5/tutorial/Tcl16.html

set list [list {Washington 1789} {Adams 1797} {Jefferson 1801} \
               {Madison 1809} {Monroe 1817} {Adams 1825} ]

set x [lsearch $list Washington*]
set y [lsearch $list Madison*]
incr x
incr y -1                        ;# Set range to be not-inclusive

set subsetlist [lrange $list $x $y]

puts "The following presidents served between Washington and Madison"
foreach item $subsetlist {
    puts "Starting in [lindex $item 1]: President [lindex $item 0] "
}

set x [lsearch $list Madison*]

set srtlist [lsort $list]
set y [lsearch $srtlist Madison*]

puts "\n$x Presidents came before Madison chronologically"
puts "$y Presidents came before Madison alphabetically"

#Output:
# The following presidents served between Washington and Madison
# Starting in 1797: President Adams
# Starting in 1801: President Jefferson

# 3 Presidents came before Madison chronologically
# 3 Presidents came before Madison alphabetically