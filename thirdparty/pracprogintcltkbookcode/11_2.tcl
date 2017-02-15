#
# Example 11-2
# Using regular expressions to parse a string.
#

set env(DISPLAY) sage:0.1
regexp {([^:]*):} $env(DISPLAY) match host
#=> 1
set match
#=> sage:
set host
#=> sage


