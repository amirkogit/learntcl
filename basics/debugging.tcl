# https://tcl.tk/man/tcl8.5/tutorial/Tcl36.html

# proc a {} {
#     b
# }
# proc b {} {
#     c
# }
# proc c {} {
#     d
# }
# proc d {} {
#     some_command
# }

# a

#Output:
# invalid command name "some_command"
#     while executing
# "some_command"
#     (procedure "d" line 2)
#     invoked from within
# "d"
#     (procedure "c" line 2)
#     invoked from within
# "c"
#     (procedure "b" line 2)
#     invoked from within
# "b"
#     (procedure "a" line 2)
#     invoked from within
# "a"
#     (file "debugging.tcl" line 16)

#======================================================

proc errorproc {x} {
    if {$x > 0} {
	error "Error generated by error" "Info String for error" $x
    }
}

catch errorproc
puts "after bad proc call: ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"

set errorInfo "";
catch {errorproc 0}
puts "after proc call with no error: ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"

catch {errorproc 2}
puts "after error generated in proc: ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"


proc returnErr { x } {
    return -code error -errorinfo "Return Generates This" -errorcode "-999"
}

catch {returnErr 2}
puts "after proc that uses return to generate an error: ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"

proc withError {x} {
    set x $a
}

catch {withError 2}
puts "after proc with an error: ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"

catch {open [file join no_such_directory no_such_file] r}
puts "after an error call to a nonexistent file:"
puts "ErrorCode: $errorCode"
puts "ERRORINFO:\n$errorInfo\n"

#Output:
# after bad proc call: ErrorCode: TCL WRONGARGS
# ERRORINFO:
# wrong # args: should be "errorproc x"
#     while executing
# "errorproc"

# after proc call with no error: ErrorCode: TCL WRONGARGS
# ERRORINFO:


# after error generated in proc: ErrorCode: 2
# ERRORINFO:
# Info String for error
#     (procedure "errorproc" line 1)
#     invoked from within
# "errorproc 2"

# after proc that uses return to generate an error: ErrorCode: -999
# ERRORINFO:
# Return Generates This
#     invoked from within
# "returnErr 2"

# after proc with an error: ErrorCode: TCL READ VARNAME
# ERRORINFO:
# can't read "a": no such variable
#     while executing
# "set x $a"
#     (procedure "withError" line 2)
#     invoked from within
# "withError 2"

# after an error call to a nonexistent file:
# ErrorCode: POSIX ENOENT {no such file or directory}
# ERRORINFO:
# couldn't open "no_such_directory/no_such_file": no such file or directory
#     while executing
# "open [file join no_such_directory no_such_file] r"