# https://tcl.tk/man/tcl8.5/tutorial/Tcl41.html

set systemTime [clock seconds]

puts "The time is: [clock format $systemTime -format %H:%M:%S]"
puts "The date is: [clock format $systemTime -format %D]"
puts [clock format $systemTime -format {Today is: %A, the %d of %B, %Y}]
puts "\n the default format for the time is: [clock format $systemTime]\n"

set halBirthBook "Jan 12, 1997"
set halBirthMovie "Jan 12, 1992"
set bookSeconds [clock scan $halBirthBook -format {%b %d, %Y}]
set movieSeconds [set movieSeconds [clock scan $halBirthMovie -format {%b %d, %Y}]]

puts "The book and movie versions of '2001, A Space Oddysey' had a"
puts "discrepancy of [expr {$bookSeconds - $movieSeconds}] seconds in how"
puts "soon we would have sentient computers like the HAL 9000"

#Output:
# The time is: 13:26:02
# The date is: 01/10/2017
# Today is: Tuesday, the 10 of January, 2017

#  the default format for the time is: Tue Jan 10 13:26:02 EST 2017

# The book and movie versions of '2001, A Space Oddysey' had a
# discrepancy of 157852800 seconds in how
# soon we would have sentient computers like the HAL 9000
