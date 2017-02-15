#
# Example 37-7
# Canvas image items.
#

image create bitmap hourglass2 \
	-file hourglass.bitmap -maskfile hourglass.mask \
	-background white -foreground blue
for {set x 20} {$x < 300} {incr x 20} {
	$c create image $x 10 -image hourglass2 -anchor nw
	incr x [image width hourglass2]
}


