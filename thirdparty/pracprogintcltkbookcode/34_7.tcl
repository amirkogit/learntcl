#
# Example 34-7
# Using the spinbox readonly state to allow spinning through values.
#

set months {Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}

spinbox .month -values $months -textvariable date(month) \
	-state readonly -width 8
spinbox .date -from 1 -to 31 -textvariable date(date) \
	-state readonly -width 8
spinbox .year -from 2003 -to 2010 -textvariable date(year) \
	-state readonly -width 8

label .l_month -text "Month:"
label .l_date -text "Date:"
label .l_year -text "Year:"

grid .l_month .month
grid .l_date .date
grid .l_year .year
grid .l_month .l_date .l_year -padx 2 -sticky e
grid .month .date .year -sticky ew


