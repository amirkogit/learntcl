#
# Example 21-2
# Initializing a thread before entering its event loop with thread::wait.
#

set httpThread [thread::create {
package require http
thread::wait
}]


