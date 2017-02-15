#
# Example 9-1
# Using exec on a process pipeline.
#

set n [exec sort < /etc/passwd | uniq | wc -l 2> /dev/null]


