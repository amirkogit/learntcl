#
# Example 46-7
# Defining and saving bindings.
#

proc BindDefine { f } {
	if [catch {
		bind [$f.top.e get] [$f.edit.key.e get] \
			[$f.edit.cmd.e get]
	} err] {
		Status $err
	} else {
		# Remove the edit window
		pack forget $f.edit
	}
}
proc Bind_Save { dotfile args } {
	set out [open $dotfile.new w]
	foreach w $args {
		foreach seq [bind $w] {
			# Output a Tcl command
			puts $out [list bind $w $seq [bind $w $seq]]
		}
	}
	close $out
	file rename -force $dotfile.new $dotfile
}
proc Bind_Read { dotfile } {
	if [catch {
		if [file exists $dotfile] {
			# Read the saved Tcl commands
			source $dotfile
		}
	} err] {
		Status "Bind_Read $dotfile failed: $err"
	}
}


