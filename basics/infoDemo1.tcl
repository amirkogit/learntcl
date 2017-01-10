# https://tcl.tk/man/tcl8.5/tutorial/Tcl27.html

proc safeIncr {val {amount 1}} {
    upvar $val v
    if { [info exists v] } {
        incr v $amount
    }  else {
        set v $amount
    }
}

if {[info procs safeIncr] eq "safeIncr"} {
     safeIncr a
}

puts "After calling SafeIncr with a non existent variable: $a"

set a 100
safeIncr a
puts "After calling SafeIncr with a variable with a value of 100: $a"

safeIncr b -3
puts "After calling safeIncr with a non existent variable by -3: $b"

set b 100
safeIncr b -3
puts "After calling safeIncr with a variable whose value is 100 by -3: $b"

puts "\nThese variables have been defined: [lsort [info vars]]"
puts "\nThese globals have been defined:   [lsort [info globals]]"

set exist [info procs localproc]
if {$exist == ""} {
    puts "\nlocalproc does not exist at point 1"
}

proc localproc {} {
    global argv

    set loc1 1
    set loc2 2
    puts "\nLocal variables accessible in this proc are: [lsort [info locals]]"
    puts "\nVariables accessible from this proc are:     [lsort [info vars]]"
    puts "\nGlobal variables visible from this proc are: [lsort [info globals]]"
}

set exist [info procs localproc]
if {$exist != ""} {
    puts "localproc does exist at point 2"
}

localproc

# Output:
# After calling SafeIncr with a non existent variable: 1
# After calling SafeIncr with a variable with a value of 100: 101
# After calling safeIncr with a non existent variable by -3: -3
# After calling safeIncr with a variable whose value is 100 by -3: 97

# These variables have been defined: a argc argv argv0 auto_path b env tcl_interactive tcl_library tcl_patchLevel tcl_pkgPath tcl_platform t
# cl_rcFileName tcl_version

# These globals have been defined:   a argc argv argv0 auto_path b env tcl_interactive tcl_library tcl_patchLevel tcl_pkgPath tcl_platform t
# cl_rcFileName tcl_version

# localproc does not exist at point 1
# localproc does exist at point 2

# Local variables accessible in this proc are: loc1 loc2

# Variables accessible from this proc are:     argv loc1 loc2

# Global variables visible from this proc are: a argc argv argv0 auto_path b env exist tcl_interactive tcl_library tcl_patchLevel tcl_pkgPat
# h tcl_platform tcl_rcFileName tcl_version