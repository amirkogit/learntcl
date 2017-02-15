#
# Example 38-2
# Separate paste actions.
#

bind Text <<Paste>> {
	catch {%W insert insert \
		[selection get -selection CLIPBOARD]
	}
}
bind Text <ButtonRelease-2> {
	%W mark set insert @%x,%y
	catch {%W insert insert \
		[selection get -selection PRIMARY]
	}
}


