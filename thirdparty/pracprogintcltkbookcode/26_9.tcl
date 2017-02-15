#
# Example 26-9
# Row padding compared to widget padding.
#

. config -bg black
label .f1 -text left -bg #ccc
label .f2 -text right -bg #aaa
grid .f1 .f2 -sticky news
grid .f1 -padx 10 -pady 10
grid rowconfigure . 0 -pad 20


