#
# Example 32-4
# Macintosh window styles.
#

set x {documentProc dBoxProc plainDBox altDBoxProc \
	movableDBoxProc zoomDocProc rDocProc floatProc \
	floatZoomProc floatSideProc floatSideZoomProc}
foreach y $x {
	toplevel .$y
	label .$y.l -text $y
	pack .$y.l -padx 40 -pady 20
	if [catch {unsupported1 style .$y $y} err] {
		puts "$y: $err"
	}
}


