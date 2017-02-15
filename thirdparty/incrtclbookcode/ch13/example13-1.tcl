# Load the Iwidgets package and create an instance of the
# mainwindow [incr Widget].
package require Iwidgets
::iwidgets::mainwindow .mw -menubarfont {{MS Sans Serif} 8} \
  -title "Create this screen in less than 40 lines of code!"

# Add some toolbar buttons. The 107-pixel wide frame is used to
# move the toolbar over to the right the number of pixels equal
# to the width of the vertical toolbar. This number is the image
# width of the toolbar images plus a few extra pixels for the
# borderwidth.
set dir ${iwidgets::library}/demos/images
.mw toolbar add frame spacer1 -width 107 -relief raised -bd 2
.mw toolbar add button new -balloonstr "Create New File" \
  -image [image create photo -file $dir/new.gif]
.mw toolbar add button open -balloonstr "Open File" \
  -image [image create photo -file $dir/open.gif]
.mw toolbar add button close -balloonstr "Close File" \
  -image [image create photo -file $dir/close.gif]
.mw toolbar add frame spacer2 -width 16 -relief raised -bd 2
.mw toolbar add button cut -balloonstr "Cut Selected Text" \
  -image [image create photo -file $dir/cut.gif]
.mw toolbar add button paste -balloonstr "Paste Text From Clipboard" \
  -image [image create photo -file $dir/paste.gif]
.mw toolbar add button copy -balloonstr "Copy Selected Text" \
  -image [image create photo -file $dir/copy.gif]
.mw toolbar add button erase -balloonstr "Erase Selected Text" \
  -image [image create photo -file $dir/clear.gif]

# Add some mousebar buttons.
.mw mousebar add button save -balloonstr "Save File" \
  -image [image create photo -file $dir/save.gif]
.mw mousebar add button print -balloonstr "Print File" \
  -image [image create photo -file $dir/print.gif]
.mw mousebar add button exit -balloonstr "Close File and Exit" \
  -image [image create photo -file $dir/exit.gif]
.mw mousebar add frame spacer -width 107 -height 16 \
  -relief raised -bd 2
.mw mousebar add button help -balloonstr "Help me!" \
  -image [image create photo -file $dir/help.gif]

# Add the menu items.  Using -underline provides for convenient
# keyboard traversal of the menus.
.mw menubar add menubutton file -text File -underline 0
.mw menubar add menubutton edit -text Edit -underline 0
.mw menubar add menubutton format -text Format -underline 2
.mw menubar add menubutton tools -text Tools -underline 0
.mw menubar add menubutton help -text Help -underline 0

# Create the scrolled text region and load the source code for
# the mainwindow [incr Widget].
set st [::iwidgets::scrolledtext [.mw childsite].st]
$st import $dir/../../scripts/mainwindow.itk
pack $st -fill both -expand 1

# Active the window.
.mw activate
