#
# Example 22-18
# Storing Data in a Starkit.
#

package require starkit
starkit::startup
mk::file open self $argv0
mk::view layout self.audit {action timestamp:I}
mk::row append self.audit "Run as pid [pid]" [clock seconds]
puts "$argv0 has been run [mk::view size self.audit] times"
mk::file close self


