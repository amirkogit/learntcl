#
# Example 19-11
# A safe after command.
#

# SafeAfter_PolicyInit creates a child with 
# a safe after command

proc SafeAfter_PolicyInit {slave max} {
	# max limits the number of outstanding after events
	global after
	interp alias $slave after {} SafeAfterAlias $slave $max
	interp alias $slave exit {} SafeAfterExitAlias $slave
	# This is used to generate after IDs for the slave.
	set after(id,$slave) 0
}

# SafeAfterAlias is an alias for after. It disallows after
# with only a time argument and no command.

proc SafeAfterAlias {slave max args} {
	global after
	set argc [llength $args]
	if {$argc == 0} {
		error "Usage: after option args"
	}
	switch -- [lindex $args 0] {
		cancel {
			# A naive implementation would just
			# eval after cancel $args
			# but something dangerous could be hiding in args.
			set myid [lindex $args 1]
			if {[info exists after(id,$slave,$myid)]} {
				set id $after(id,$slave,$myid)
				unset after(id,$slave,$myid)
				after cancel $id
			}
			return ""
		}
		default {
			if {$argc == 1} {
				error "Usage: after time command args..."
			}
			if {[llength [array names after id,$slave,*]]\
					>= $max} {
				error "Too many after events"
			}
			# Maintain concat semantics
			set command [concat [lrange $args 1 end]]
			# Compute our own id to pass the callback.
			set myid after#[incr after(id,$slave)]
			set id [after [lindex $args 0] \
				[list SafeAfterCallback $slave $myid $command]]
			set after(id,$slave,$myid) $id
			return $myid
		}
	}
}

# SafeAfterCallback is the after callback in the master.
# It evaluates its command in the safe interpreter.

proc SafeAfterCallback {slave myid cmd} {
	global after
	unset after(id,$slave,$myid)
	if [catch {
		interp eval $slave $cmd
	} err] {
		catch {interp eval $slave bgerror $error}
	}
}

# SafeAfterExitAlias is an alias for exit that does cleanup.

proc SafeAfterExitAlias {slave} {
	global after
	foreach id [array names after id,$slave,*] {
		after cancel $after($id)
		unset after($id)
	}
	interp delete $slave
}


