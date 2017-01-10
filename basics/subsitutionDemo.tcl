# https://tcl.tk/man/tcl8.5/tutorial/Tcl34.html

set a "alpha"
set b a

puts {a and b with no substitution: $a $$b}
puts "a and b with one pass of substitution: $a $$b"
puts "a and b with subst in braces: [subst {$a $$b}]"
puts "a and b with subst in quotes: [subst "$a $$b"]\n"

puts "format with no subst [format {$%s} $b]"
puts "format with subst: [subst [format {$%s} $b]]"
eval "puts \"eval after format: [format {$%s} $b]\""

set num 0;
set cmd "proc tempFileName {} "
set cmd [format "%s {global num; incr num;" $cmd]
set cmd [format {%s return "/tmp/TMP.%s.$num"} $cmd [pid] ]
set cmd [format "%s }" $cmd ]
eval $cmd

puts "[info body tempFileName]"

set a arrayname
set b index
set c newvalue
eval [format "set %s(%s) %s" $a $b $c]

puts "Index: $b of $a was set to: $arrayname(index)"