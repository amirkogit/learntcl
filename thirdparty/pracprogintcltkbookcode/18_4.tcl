#
# Example 18-4
# Alternate types for Application Direct URLs.
#

Direct_Url /faces Faces
proc Faces/byemail {email} {
	global Faces/byemail
	set filename [Faces_ByEmail $email]
	set Faces/byemail [Mtype $filename]
	set in [open $filename]
	fconfigure $in -translation binary
	set X [read $in]
	close $in
	return $X
}


