# https://tcl.tk/man/tcl8.5/tutorial/Tcl35.html

set dirs [list TEMPDIR]

puts "[format "%-15s  %-20s " "FILE" "DIRECTORY"]"

foreach dir $dirs {
    catch {cd $dir}
    set c_files [glob -nocomplain c*]

    foreach name $c_files {
        puts "[format "%-15s  %-20s " $name [pwd]]"
    }
}

# Output: all files begining with c*
# FILE             DIRECTORY
# computersandnumbers.tcl  /home/ashrestha/projects/mygit/learntcl/basics
# changeWorkingDir.tcl  /home/ashrestha/projects/mygit/learntcl/basics
# commands.tcl     /home/ashrestha/projects/mygit/learntcl/basics