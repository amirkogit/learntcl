#
# Example 22-14
# Examining data in a Metakit view.
#

mk::view layout tclhttpd.dirs
#=> name parent:I {files {{name size:I date:I contents:B}}
mk::view size tclhttpd.dirs
#=> 48
mk::get tclhttpd.dirs!0
#=> name <root> parent -1
mk::get tclhttpd.dirs!1
#=> name tcllib1.3 parent 0
mk::get tclhttpd.dirs!1 name
#=> tcllib1.3
mk::get tclhttpd.dirs!0.files!0 name
#=> main.tcl


