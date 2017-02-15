#
# Example 26-10
# Gridding a text widget and scrollbar.
#

text .text -yscrollcommand ".yscroll set" \
	-xscrollcommand ".xscroll set"	-width 40 -height 10
scrollbar .yscroll -command ".text yview" -orient vertical
scrollbar .xscroll -command ".text xview" -orient horizontal
grid .text .yscroll -sticky news
grid .xscroll -sticky ew
grid rowconfigure . 0 -weight 1
grid columnconfigure . 0 -weight 1


