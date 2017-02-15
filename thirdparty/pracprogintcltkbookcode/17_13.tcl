#
# Example 17-13
# Basic Authentication using http::geturl.
#

package require base64
package require http
proc BasicAuthentication {url promptProc} {
	set token [http::geturl $url]
	http::wait $token
	if {[string match *401* [http::code $token]]} {
		upvar #0 $token data

		# Extract the realm from the Www-Authenticate line

		array set reply $data(meta)
		if {[regexp {realm=(.*)} $reply(Www-Authenticate) \
				x realm]} {

			# Call back to prompt for username, password

			set answer [$promptProc $realm]
			http::cleanup $token

			# Encode username:password and pass this in
			# the Authorization header

			set auth [base64::encode \
				[lindex $answer 0]:[lindex $answer 1]]
			set token [http::geturl $url -headers \
				[list Authorization "Basic $auth"]]
			http::wait $token
		}
	}
	return $token
}


