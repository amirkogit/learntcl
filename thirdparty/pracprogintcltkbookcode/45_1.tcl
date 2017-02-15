#
# Example 45-1
# Preferences initialization.
#

proc Pref_Init { userDefaults appDefaults } {
	global pref

	set pref(uid) 0	;# for a unique identifier for widgets
	set pref(userDefaults) $userDefaults
	set pref(appDefaults) $appDefaults
	PrefReadFile $appDefaults startup
	if [file exists $userDefaults] {
		PrefReadFile $userDefaults user
	}
}
proc PrefReadFile { basename level } {
	if [catch {option readfile $basename $level} err] {
		Status "Error in $basename: $err"
	}
	if {[string match *color* [winfo visual .]]} {
		if [file exists $basename-color] {
			if [catch {option readfile \
					$basename-color $level} err] {
				Status "Error in $basename-color: $err"
			}
		}
	} else {
		if [file exists $basename-mono] {
			if [catch {option readfile $basename-mono \
					$level} err] {
				Status "Error in $basename-mono: $err"
			}
		}
	}
}


