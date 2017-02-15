#
# Example 35-3
# Using the <<ListboxSelect>> virtual event.
#

proc ListboxChanged {w} {
puts -nonewline "Listbox $w selection is now: "
foreach index [$w curselection] {
puts -nonewline "[$w get $index] "
}
puts ""
}
bind .lbox <<ListboxSelect>> {ListboxChanged %W}


