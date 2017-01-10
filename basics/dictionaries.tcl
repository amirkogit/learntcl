# https://tcl.tk/man/tcl8.5/tutorial/Tcl23a.html

#
# Create a dictionary:
# Two clients, known by their client number,
# with forenames, surname
#
dict set clients 1 forenames Joe
dict set clients 1 surname   Schmoe
dict set clients 2 forenames Anne
dict set clients 2 surname   Other

#
# Print a table
#
puts "Number of clients: [dict size $clients]"
dict for {id info} $clients {
    puts "Client $id:"
    dict with info {
       puts "   Name: $forenames $surname"
    }
}

#=================================================================
puts "\n"

#
# The example of the previous lesson revisited - using dicts.
#

proc addname {dbVar first last} {
    upvar 1 $dbVar db

    # Create a new ID (stored in the name array too for easy access)
    dict incr db ID
    set id [dict get $db ID]

    # Create the new record
    dict set db $id first $first
    dict set db $id last  $last
}

proc report {db} {

    # Loop over the last names: make a map from last name to ID

    dict for {id name} $db {
        # Create a temporary dictionary mapping from
        # last name to ID, for reverse lookup
        if {$id eq "ID"} { continue }
        set last       [dict get $name last]
        dict set tmp $last $id
    }

    #
    # Now we can easily print the names in the order we want!
    #
    foreach last [lsort [dict keys $tmp]] {
        set id [dict get $tmp $last]
        puts "   [dict get $db $id first] $last"
    }
}

#
# Initialise the array and add a few names
#
dict set fictional_name ID 0
dict set historical_name ID 0

addname fictional_name Mary Poppins
addname fictional_name Uriah Heep
addname fictional_name Frodo Baggins

addname historical_name Rene Descartes
addname historical_name Richard Lionheart
addname historical_name Leonardo "da Vinci"
addname historical_name Charles Baudelaire
addname historical_name Julius Caesar

#
# Some simple reporting
#
puts "Fictional characters:"
report $fictional_name
puts "Historical characters:"
report $historical_name

# Output:
# Number of clients: 2
# Client 1:
#    Name: Joe Schmoe
# Client 2:
#    Name: Anne Other


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