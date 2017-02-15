#
# Example 10-1
# Using list to construct commands.
#

set string "Hello, World!"
set cmd [list puts stdout $string]
#=> puts stdout {Hello, World!}
unset string
eval $cmd
#=> Hello, World!


