#
# Example 11-8
# Html_DecodeEntity.
#

proc Html_DecodeEntity {text} {
	if {![regexp & $text]} {return $text}
	regsub -all {[][$\\]} $text {\\&} new
	regsub -all {&#([0-9][0-9]?[0-9]?);?}  $new {\
		[format %c [scan \1 %d tmp;set tmp]]} new
	regsub -all {&([a-zA-Z]+)(;?)} $new \
		{[HtmlMapEntity \1 \\\2 ]} new
	return [subst $new]
}
proc HtmlMapEntity {text {semi {}}} {
	global htmlEntityMap
	if {[info exist htmlEntityMap($text)]} {
		return $htmlEntityMap($text)
	} else {
		return $text$semi
	}
} 
# Some of the htmlEntityMap
array set htmlEntityMap {
	lt	<	gt	>	amp	&
	aring		\xe5		atilde		\xe3
	copy		\xa9		ecirc		\xea		egrave		\xe8
}


