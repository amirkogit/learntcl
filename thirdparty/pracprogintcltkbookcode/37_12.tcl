#
# Example 37-12
# Simple edit bindings for canvas text items.
#

proc Canvas_EditBind { c } {
	bind $c <Button-1> \
		{CanvasFocus %W [%W canvasx %x] [%W canvasy %y]}
	bind $c <Button-2> \
		{CanvasPaste %W [%W canvasx %x] [%W canvasy %y]}
	bind $c <<Cut>> {CanvasTextCopy %W; CanvasDelete %W}
	bind $c <<Copy>> {CanvasTextCopy %W}
	bind $c <<Paste>> {CanvasPaste %W}
	$c bind text <Button-1> \
		{CanvasTextHit %W [%W canvasx %x] [%W canvasy %y]}
	$c bind text <B1-Motion> \
		{CanvasTextDrag %W [%W canvasx %x] [%W canvasy %y]}
	$c bind text <Delete> {CanvasDelete %W}
	$c bind text <Control-d> {CanvasDelChar %W}
	$c bind text <Control-h> {CanvasBackSpace %W}
	$c bind text <BackSpace> {CanvasBackSpace %W}
	$c bind text <Control-Delete> {CanvasErase %W}
	$c bind text <Return> {CanvasNewline %W}
	$c bind text <Any-Key> {CanvasInsert %W %A}
	$c bind text <Key-Right> {CanvasMoveRight %W}
	$c bind text <Control-f> {CanvasMoveRight %W}
	$c bind text <Key-Left> {CanvasMoveLeft %W}
	$c bind text <Control-b> {CanvasMoveLeft %W}
}
proc CanvasFocus {c x y} {
	focus $c
	set id [$c find overlapping [expr $x-2] [expr $y-2] \
			[expr $x+2] [expr $y+2]]
	if {($id == {}) || ([$c type $id] != "text")} {
		set t [$c create text $x $y -text "" \
			-tags text -anchor nw]
		$c focus $t
		$c select clear
		$c icursor $t 0
	}
}
proc CanvasTextHit {c x y {select 1}} {
	$c focus current
	$c icursor current @$x,$y
	$c select clear
	$c select from current @$x,$y
}
proc CanvasTextDrag {c x y} {
	$c select to current @$x,$y
}
proc CanvasDelete {c} {
	if {[$c select item] != {}} {
		$c dchars [$c select item] sel.first sel.last
	} elseif {[$c focus] != {}} {
		$c dchars [$c focus] insert
	}
}
proc CanvasTextCopy {c} {
	if {[$c select item] != {}} {
		clipboard clear
		set t [$c select item]
		set text [$c itemcget $t -text]
		set start [$c index $t sel.first]
		set end [$c index $t sel.last]
		clipboard append [string range $text $start $end]
	} elseif {[$c focus] != {}} {
		clipboard clear
		set t [$c focus]
		set text [$c itemcget $t -text]
		clipboard append $text
	}
}
proc CanvasDelChar {c} {
	if {[$c focus] != {}} {
		$c dchars [$c focus] insert
	}
}
proc CanvasBackSpace {c} {
	if {[$c select item] != {}} {
		$c dchars [$c select item] sel.first sel.last
	} elseif {[$c focus] != {}} {
		set _t [$c focus]
		$c icursor $_t [expr [$c index $_t insert]-1]
		$c dchars $_t insert
	}
}
proc CanvasErase {c} {
	$c delete [$c focus]
}
proc CanvasNewline {c} {
	$c insert [$c focus] insert \n
}
proc CanvasInsert {c char} {
	$c insert [$c focus] insert $char
}
proc CanvasPaste {c {x {}} {y {}}} {
	if {[catch {selection get} _s] &&
		 [catch {selection get -selection CLIPBOARD} _s]} {
		return		;# No selection
	}
	set id [$c focus]
	if {[string length $id] == 0 } {
		set id [$c find withtag current]
	}
	if {[string length $id] == 0 } {
		# No object under the mouse
		if {[string length $x] == 0} {
			# Keyboard paste
			set x [expr [winfo pointerx $c] - [winfo rootx $c]]
			set y [expr [winfo pointery $c] - [winfo rooty $c]]
		}
		CanvasFocus $c $x $y
	} else {
		$c focus $id
	}
	$c insert [$c focus] insert $_s
}

proc CanvasMoveRight {c} {
	$c icursor [$c focus] [expr [$c index current insert]+1]
}
proc CanvasMoveLeft {c} {
	$c icursor [$c focus] [expr [$c index current insert]-1]
}


