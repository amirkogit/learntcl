# https://tcl.tk/man/tcl8.5/tutorial/Tcl16a.html

# Matches
puts [string match f* foo]

# Matches
puts [string match f?? foo]

# Doesn't match
puts [string match f foo]

# Returns a big list of files on my Debian system.
set bins [glob /usr/bin/*]

#puts $bins

#Output:
# 1
# 1
# 0