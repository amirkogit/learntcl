#
# Example 22-1
# Accessing a Zip file with VFS
#

package require zipvfs
#=> 1.0
# Mount the zip file on "xyz"
vfs::zip::Mount c:/downloads/tclhttpd343.zip xyz
#=> filecb15a8
# Examine the contents
glob xyz/*
#=> xyz/tclhttpd3.4.3
# Open and read file inside the zip archive
set in [open xyz/tclhttpd3.4.3/README]
#=> rechan16
gets $in
This HTTPD is written in Tcl and Tk.


