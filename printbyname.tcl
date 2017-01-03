proc PrintByName { varName } {
    upvar 1 $varName var
    puts stdout "$varName = $var"
}

set x 10
PrintByName x
set result "some random text"
PrintByName result