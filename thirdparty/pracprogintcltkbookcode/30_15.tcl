#
# Example 30-15
# Keeping the accelerator display up to date.
#

proc Menu_Bind { what sequence accText menuName label } {
	variable menu
	set m [MenuGet $menuName]
	if {[catch {$m index $label} index]} {
		error "$label not in menu $menuName" 
	}
	bind $what $sequence [list MenuInvoke $m $index]
	$m entryconfigure $index 		-accelerator $accText
}
proc MenuInvoke {m index} {
	set state [$m entrycget $index -state]
	if {[string equal $state normal]} {
		$m invoke $index
	} 
}


