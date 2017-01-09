# https://tcl.tk/man/tcl8.5/tutorial/Tcl20a.html

set pattern  {(^|[ \t])([-+]?(\d+|\.\d+|\d+\.\d*))($|[^+-.])}

set examples {"1.0"    " .02"  "  +0."
              "1"      "+1"    " -0.0120"
              "+0000"  " - "   "+."
              "0001"   "0..2"  "++1"
              "A1.0B"  "A1"}

foreach e $examples {
    if { [regexp $pattern $e whole \
              char_before number digits_before_period] } {
        puts ">>$e<<: $number ($whole)"
    } else {
        puts ">>$e<<: Does not contain a valid number"
    }
}

puts "\n"
set string "Again and again and again ..."
if { [regexp {(\y\w+\y).+\1} $string => word] } {
    puts "The word $word occurs at least twice"
}

#Output:
# >>1.0<<: 1.0 (1.0)
# >> .02<<: .02 ( .02)
# >>  +0.<<: +0. ( +0.)
# >>1<<: 1 (1)
# >>+1<<: +1 (+1)
# >> -0.0120<<: -0.0120 ( -0.0120)
# >>+0000<<: +0000 (+0000)
# >> - <<: Does not contain a valid number
# >>+.<<: Does not contain a valid number
# >>0001<<: 0001 (0001)
# >>0..2<<: Does not contain a valid number
# >>++1<<: Does not contain a valid number
# >>A1.0B<<: Does not contain a valid number
# >>A1<<: Does not contain a valid number