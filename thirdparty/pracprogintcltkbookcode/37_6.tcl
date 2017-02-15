#
# Example 37-6
# Canvas bitmap items.
#

set o [$c create bitmap 10 10 -bitmap @candle.xbm -anchor nw\
	-background white -foreground blue]
set x [lindex [$c bbox $o] 2]									;# Right edge of bitmap
foreach builtin {error gray12 gray50 hourglass \
				info questhead question warning} {
	incr x 20
	set o [$c create bitmap $x 30 -bitmap $builtin -anchor c]
	set x [lindex [$c bbox $o] 2]
}


