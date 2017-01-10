# https://tcl.tk/man/tcl8.5/tutorial/Tcl31.html

package require tutstack 1.0

set stack [tutstack::create]
foreach num {1 2 3 4 5} { tutstack::push $stack $num }

while { ![tutstack::empty $stack] } {
    puts "[tutstack::pop $stack]"
}

tutstack::destroy $stack