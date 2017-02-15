# This assembles programs out of the example code

all: browse.tcl evalsrv.tcl shell.tcl bindui.tcl

browse.tcl: Header Scrolled_Text.tcl 23_3.tcl 23_4.tcl
	cat Header Scrolled_Text.tcl 23_3.tcl 23_4.tcl > $@
	chmod +x $@

evalsrv.tcl: Header Scrolled_Text.tcl 23_4.tcl 41_3.tcl
	cat Header Scrolled_Text.tcl 23_4.tcl 41_3.tcl > $@
	chmod +x $@

shell.tcl: Header Scrolled_Text.tcl 23_4.tcl
	cat Header Scrolled_Text.tcl 23_4.tcl > $@
	chmod +x $@

# bindui.tcl takes some hand-editing to remove global code.

bindui.tcl: Header 44_1.tcl 44_2.tcl 44_3.tcl 44_4.tcl 44_5.tcl 44_6.tcl 44_7.tcl
	cat Header 44_1.tcl 44_2.tcl 44_3.tcl 44_4.tcl 44_5.tcl 44_6.tcl 44_7.tcl > $@
	echo "Bind_Interface Text" >> $@
	chmod +x $@

check:
	procheck -suppress warnRedefine -suppress warnExpr *.tcl > procheck.out

checkall:
	procheck -verbose *.tcl > procheck.out

# Rename miscellaneous examples that are not .tcl files
rename:
	-mv 18_12.tcl 18_12.htm
	-mv 18_13.tcl 18_13.txt
	-mv 18_17.tcl 18_17.htm
	-mv 18_18.tcl 18_18.tml
	-mv 27_2.tcl 27_2.txt
	-mv 29_2.tcl 29_2.txt
	-mv 29_3.tcl 29_3.txt
	-mv 29_6.tcl 29_6.txt
	-mv 3_2.tcl 3_2.htm
	-mv 3_6.tcl 3_6.htm
	-mv 3_7.tcl 3_7.htm
	-mv 3_8.tcl 3_8.htm
	-for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15;\
	    do \
		mv 45_$$i.tcl 45_$$i.c; \
	    done;
	-mv 47_2.tcl 47_2.h
	-for i in 1 3 4 5 6 7 8 9  10 11 12 13 14 15 16 17;\
	    do \
		mv 47_$$i.tcl 47_$$i.c; \
	    done;
