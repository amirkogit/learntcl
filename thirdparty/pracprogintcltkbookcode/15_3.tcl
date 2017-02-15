#
# Example 15-3
# Three sample message catalog files.
#

## en.msg
namespace import -force msgcat::mcset

mcset en Hello Hello_en
mcset en Goodbye Goodbye_en
mcset en String String_en
# end of en.msg

## en_US.msg
namespace import -force msgcat::mcset

mcset en_US Hello Hello_en_US
mcset en_US Goodbye Goodbye_en_US
# end of en_US.msg

## en_US_Texan.msg
namespace import -force msgcat::mcset

mcset en_US_Texan Hello Howdy!
# end of en_US_Texan.msg


