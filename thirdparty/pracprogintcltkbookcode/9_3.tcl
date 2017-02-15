#
# Example 9-3
# Determining whether pathnames reference the same file.
#

proc fileeq { path1 path2 } {
	file stat $path1 stat1
	file stat $path2 stat2
	expr {$stat1(ino) == $stat2(ino) && \
			$stat1(dev) == $stat2(dev)}
}


