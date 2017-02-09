package require Itcl
namespace import itcl::*

class Point {
    variable x
    variable y

    constructor {{aNumberX 0} {aNumberY 0}} {
        set x $aNumberX
        set y $aNumberY
        return $this
    }

    method x: {aNumber}
    method y: {aNumber}
    method x {}
    method y {}
    method is {aNumberX aNumberY}
    method printOn: {aStream}
    method printString
    method = {aPoint}
    method += {aPoint}
    method + {aPoint}
}

body Point::x: {aNumber} {
    set x $aNumber
}

body Point::y: {aNumber} {
    set y $aNumber
}

body Point::x {} {
    return $x
}

body Point::y {} {
    return $y
}

body Point::is {aNumberX aNumberY} {
    set x $aNumberX
    set y $aNumberY
}

body Point::printString {} {
    return "($x , $y)"
}

body Point::printOn: {aStream} {
    puts -nonewline $aStream "($x , $y)"
}

body Point::= {aPoint} {
    set x [$aPoint x]
    set y [$aPoint y]
}

body Point::+= {aPoint} {
    set x [expr $x + [$aPoint x]]
    set y [expr $y + [$aPoint y]]
}

body Point::+ {aPoint} {
    set sum [Point #auto]
    $sum x: [expr $x + [$aPoint x]]
    $sum y: [expr $y + [$aPoint y]]
    return $sum
}