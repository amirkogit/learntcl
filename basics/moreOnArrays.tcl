# https://tcl.tk/man/tcl8.5/tutorial/Tcl23.html 

#
# The example of the previous lesson revisited - to get a
# more general "database"
#

proc addname {db first last} {
    upvar $db name

    # Create a new ID (stored in the name array too for easy access)

    incr name(ID)
    set id $name(ID)

    set name($id,first) $first   ;# The index is simply a string!
    set name($id,last)  $last    ;# So we can use both fixed and
                                 ;# varying parts
}

proc report {db} {
    upvar $db name

    # Loop over the last names: make a map from last name to ID

    foreach n [array names name "*,last"] {
        #
        # Split the name to get the ID - the first part of the name!
        #
        regexp {^[^,]+} $n id

        #
        # Store in a temporary array:
        # an "inverse" map of last name to ID)
        #
        set last       $name($n)
        set tmp($last) $id
    }

    #
    # Now we can easily print the names in the order we want!
    #
    foreach last [lsort [array names tmp]] {
        set id $tmp($last)
        puts "   $name($id,first) $name($id,last)"
    }
}

#
# Initialise the array and add a few names
#
set fictional_name(ID) 0
set historical_name(ID) 0

addname fictional_name Mary Poppins
addname fictional_name Uriah Heep
addname fictional_name Frodo Baggins

addname historical_name Rene Descartes
addname historical_name Richard Lionheart
addname historical_name Leonardo "da Vinci"
addname historical_name Charles Baudelaire
addname historical_name Julius Caesar

# For debugging purpose
parray fictional_name
puts "\n"
parray historical_name
#[exit]

puts "\n"

#
# Some simple reporting
#
puts "Fictional characters:"
report fictional_name
puts "Historical characters:"
report historical_name

## Output:
# fictional_name(1,first) = Mary
# fictional_name(1,last)  = Poppins
# fictional_name(2,first) = Uriah
# fictional_name(2,last)  = Heep
# fictional_name(3,first) = Frodo
# fictional_name(3,last)  = Baggins
# fictional_name(ID)      = 3


# historical_name(1,first) = Rene
# historical_name(1,last)  = Descartes
# historical_name(2,first) = Richard
# historical_name(2,last)  = Lionheart
# historical_name(3,first) = Leonardo
# historical_name(3,last)  = da Vinci
# historical_name(4,first) = Charles
# historical_name(4,last)  = Baudelaire
# historical_name(5,first) = Julius
# historical_name(5,last)  = Caesar
# historical_name(ID)      = 5

# Fictional characters:
#    Frodo Baggins
#    Uriah Heep
#    Mary Poppins
# Historical characters:
#    Charles Baudelaire
#    Julius Caesar
#    Rene Descartes
#    Richard Lionheart
#    Leonardo da Vinci
