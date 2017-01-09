proc UsingArrays {} {
    set arr(0) 1
    for {set i 1} {$i <= 10} {incr i} {
        set result [expr {$i * $arr([expr {$i -1}])}]
    #    puts $i
    #    puts $result
        set arr($i) [expr {$i * $arr([expr {$i -1}])}]
    }

    for {set i 1} { $i <= 10} {incr i} {
        puts $arr($i)
    }
}

#execute
puts "Demo: using arrays"
UsingArrays

