#
# Example 34-6
# Enumerating spinbox values and wrapping.
#

set states [list Arizona California Nevada "New Mexico"]
spinbox .s3 -values $states -wrap 1
pack .s3


