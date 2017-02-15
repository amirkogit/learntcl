#
# Example 1-16
# Embedded variable references.
#

set foo filename
set object $foo.o
#=> filename.o
set a AAA
set b abc${a}def
#=> abcAAAdef
set .o yuk!
set x ${.o}y
#=> yuk!y


