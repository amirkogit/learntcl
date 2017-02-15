#
# Example 13-1
# Calculating clicks per second.
#

set t1 [clock clicks]
after 10000 ;# See page 226
set t2 [clock clicks]
puts "[expr ($t2 - $t1)/10] Clicks/second"
#=> 1001313 Clicks/second


