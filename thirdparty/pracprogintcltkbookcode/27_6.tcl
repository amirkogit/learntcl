#
# Example 27-6
# PaneDrag adjusts the percentage.
#

proc PaneDrag {master D} {
	upvar #0 Pane$master pane
	if [info exists pane(lastD)] {
		set delta [expr double($pane(lastD) - $D) \
									/ $pane(size)]
		set pane(-percent) [expr $pane(-percent) - $delta]
		if {$pane(-percent) < 0.0} {
			set pane(-percent) 0.0
		} elseif {$pane(-percent) > 1.0} {
			set pane(-percent) 1.0
		}
		PaneGeometry $master
	}
	set pane(lastD) $D
}
proc PaneStop {master} {
	upvar #0 Pane$master pane
	catch {unset pane(lastD)}
}


