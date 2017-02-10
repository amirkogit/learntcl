# Reference: http://www.andreadrian.de/itcl/chapter7.htm

package require Itcl
namespace import itcl::*

class AnimalHabitat {
    public {
        method Add {anAnimal}
        method Play {}
        method Script {aString}
        method PrintScript {}
    }

    private {
        variable _animals ""
        variable _scriptString
        variable _script
        variable _browser
    }
}

body AnimalHabitat::Add {anAnimal} {
    # add anAnimal as an inhabitant of the receiver
    if {[lsearch $_animals $anAnimal] < 0} {
        lappend _animals $anAnimal
        puts "Added \[$anAnimal\] to the list."
    }

    # notify anAnimal of its new habitat
    $anAnimal Habitat $this
}

body AnimalHabitat::Play {} {
    # play the script of all _animals
    foreach animal $_animals {
        $animal Reset
    }

    foreach word $_script {
        puts "$word"
        set word [string tolower $word]

        foreach animal $_animals {
            $animal ReactTo $word
        }
    }
}

body AnimalHabitat::Script {aString} {
    # change script to a list on words in aString
    set _script [split $aString]
}

body AnimalHabitat::PrintScript {} {
    puts "$_script"
}