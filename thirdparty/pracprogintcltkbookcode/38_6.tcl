#
# Example 38-6
# The copy and cut operations.
#

proc CanvasCopy { w } {
	global canvas
	if [info exists canvas(select,$w)] {
		set id $canvas(select,$w)
		clipboard clear
		clipboard append [CanvasDescription $w $id]
	}
}
proc CanvasDelete {w} {
	global canvas
	catch {
		$w delete highlight
		$w delete $canvas(select,$w)
		unset canvas(select,$w)
	}
}
proc CanvasCut { w } {
	CanvasCopy $w
	CanvasDelete $w
}


