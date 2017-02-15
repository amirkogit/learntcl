#
# Example 13-10
# Interactive history usage.
#

% set a 5
5
% set a [expr $a+7]
12
% history
	1 set a 5
	2 set a [expr $a+7]
	3 history
% !2
19
% !!
26
% ^7^13
39
% !h
	1 set a 5
	2 set a [expr $a+7]
	3 history
	4 set a [expr $a+7]
	5 set a [expr $a+7]
	6 set a [expr $a+13]
	7 history


