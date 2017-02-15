#
# Example 41-3
# Specifying an image for a widget.
#

set im [image create bitmap \
	-file glyph.bitmap -maskfile glyph.mask \
	-background white -foreground blue]
button .foo -image $im


