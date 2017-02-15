#
# Example 27-7
# PaneGeometry updates the layout.
#

proc PaneGeometry {master} {
	upvar #0 Pane$master pane
	if {$pane(D) == "X"} {
		place $pane(1) -relwidth $pane(-percent)
		place $pane(2) -relwidth [expr 1.0 - $pane(-percent)]
		place $pane(grip) -relx $pane(-percent)
		set pane(size) [winfo width $master]
	} else {
		place $pane(1) -relheight $pane(-percent)
		place $pane(2) -relheight [expr 1.0 - $pane(-percent)]
		place $pane(grip) -rely $pane(-percent)
		set pane(size) [winfo height $master]
	}
}
proc PaneTest {{p .p} {orient vert}} {
	catch {destroy $p}
	frame $p -width 200 -height 200
	label $p.1 -bg blue -text foo
	label $p.2 -bg green -text bar
	pack $p -expand true -fill both
	pack propagate $p off
	Pane_Create $p.1 $p.2 -in $p -orient $orient -percent 0.3
}


