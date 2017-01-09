# https://tcl.tk/man/tcl8.5/tutorial/Tcl15.html

set b [list a b {c d e} {f {g h}}]
puts "Treated as a list: $b\n"

set b [split "a b {c d e} {f {g h}}"]
puts "Transformed by split: $b\n"

set a [concat a b {c d e} {f {g h}}]
puts "Concated: $a\n"

lappend a {ij K lm}                        ;# Note: {ij K lm} is a single element
puts "After lappending: $a\n"

set b [linsert $a 3 "1 2 3"]               ;# "1 2 3" is a single element
puts "After linsert at position 3: $b\n"

set b [lreplace $b 3 5 "AA" "BB"]
puts "After lreplacing 3 positions with 2 values at position 3: $b\n"

#Output:
# Treated as a list: a b {c d e} {f {g h}}

# Transformed by split: a b \{c d e\} \{f \{g h\}\}

# Concated: a b c d e f {g h}

# After lappending: a b c d e f {g h} {ij K lm}

# After linsert at position 3: a b c {1 2 3} d e f {g h} {ij K lm}

# After lreplacing 3 positions with 2 values at position 3: a b c AA BB f {g h} {ij K lm}