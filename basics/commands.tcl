# https://tcl.tk/man/tcl8.5/tutorial/Tcl32.html

set cmd {puts "Evaluating a puts"}
puts "CMD IS: $cmd"
eval $cmd

if {[string match [info procs newProcA] ""] } {
    puts "\nDefining newProcA for this invocation"
    set num 0;
    set cmd "proc newProcA "
    set cmd [concat $cmd "{} {\n"]
    set cmd [concat $cmd "global num;\n"]
    set cmd [concat $cmd "incr num;\n"]
    set cmd [concat $cmd " return \"/tmp/TMP.[pid].\$num\";\n"]
    set cmd [concat $cmd "}"]
    eval  $cmd
}

puts "\nThe body of newProcA is: \n[info body newProcA]\n"

puts "newProcA returns: [newProcA]"
puts "newProcA returns: [newProcA]"

#
# Define a proc using lists
#

if {[string match [info procs newProcB] ""] } {
    puts "\nDefining newProcB for this invocation"
    set cmd "proc newProcB "
    lappend cmd {}
    lappend cmd {global num; incr num; return $num;}

    eval  $cmd
}

puts "\nThe body of newProcB is: \n[info body newProcB]\n"
puts "newProcB returns: [newProcB]"

# Output:
# CMD IS: puts "Evaluating a puts"
# Evaluating a puts

# Defining newProcA for this invocation

# The body of newProcA is:
#  global num; incr num; return "/tmp/TMP.28974.$num";

# newProcA returns: /tmp/TMP.28974.1
# newProcA returns: /tmp/TMP.28974.2

# Defining newProcB for this invocation

# The body of newProcB is:
# global num; incr num; return $num;

# newProcB returns: 3