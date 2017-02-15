#
# Example 19-3
# A command alias for exit.
#

interp create foo
interp alias foo exit {} interp delete foo
interp eval foo exit
# Child foo is gone.


