#
# Example 32-1
# Labelframe example.
#

labelframe .s -text Sizes
radiobutton .s.small -text Small -variable size -value small
radiobutton .s.med -text Medium -variable size -value medium
radiobutton .s.large -text Large -variable size -value large
.s.large select
pack .s.small .s.med .s.large -anchor w -padx 2 -pady 1
pack .s


