# https://tcl.tk/man/tcl8.5/tutorial/Tcl25.html

# Retrieving all the files with extension ".tcl" in the current directory:
set tclfiles [glob *.tcl]
puts "Name - date of last modification"
foreach f $tclfiles {
    puts "$f - [clock format [file mtime $f] -format %x]"
}

#=================================================================

#
# Report all the files and subdirectories in the current directory
# For files: show the size
# For directories: show that they _are_ directories
#

set dirs [glob -nocomplain -type d *]
if { [llength $dirs] > 0 } {
    puts "Directories:"
    foreach d [lsort $dirs] {
        puts "    $d"
    }
} else {
    puts "(no subdirectories)"
}

set files [glob -nocomplain -type f *]
if { [llength $files] > 0 } {
    puts "Files:"
    foreach f [lsort $files] {
        puts "    [file size $f] - $f"
    }
} else {
    puts "(no files)"
}