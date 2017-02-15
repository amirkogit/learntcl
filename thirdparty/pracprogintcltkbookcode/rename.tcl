set chap 48
file mkdir OLD
while {$chap >= 28} {
  foreach f [glob -nocomplain ${chap}_*] {
    regexp {(.*)_(.*)} $f x c rest
    set newc [expr $c+1]
    puts "mv ${c}_$rest ${newc}_$rest"
    set in [open ${c}_$rest]
    set X [read $in]
    close $in
    regsub "Example ${c}-" $X "Example ${newc}-" X
    set out [open ${newc}_$rest w]
    puts -nonewline $out $X
    close $out
    file rename ${c}_$rest OLD/${c}_$rest
  }
  incr chap -1
}
