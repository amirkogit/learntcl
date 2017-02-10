package require Itcl
namespace import itcl::*

# Base class for all
class Animal {
    public {
        method Answer {aString}
        method Name {aString}
        method Talk {}
        method Habitat {aHabitat}
        method LearnAction {aString aBlock}
        method Reset {}
        method ReactTo {aWord}
    }

    private {
        variable _name
        variable _knowledge
        variable _habitat
        variable _topSpeed
        variable _color
        variable _picture
    }
}

class Bird {
    inherit Animal

    private {
        variable flying
    }
}

class Parrot {
    inherit Bird

    public {
        method Talk {}
        method Vocabulary {aString}
    }

    private {
        variable _vocabulary
    }
}

class Penguin {
    inherit Bird
}

class Mammal {
    inherit Animal
}

class Dog {
    inherit Mammal

    public {
        method Bark {}
        method BeNoisy {}
        method BeQuiet {}
        method Talk {}
    }

    private {
        variable _barksALot
    }

}

class Whale {
    inherit Mammal
}

# method definitions for Animal class
body Animal::Answer {aString} {
    puts "[$this info class] $_name: $aString"
}

body Animal::Name {aString} {
    set _name $aString
}

body Animal::Talk {} {
    # this will call Animal::Answer with param ".."
    $this Answer "I can't talk"
}

# method definitions for Parrot class
body Parrot::Talk {} {
    # calls the base method Animal::Answer
    $this Answer $_vocabulary
}

body Parrot::Vocabulary {aString} {
    set _vocabulary $aString
}

# method definitions for Dog class
body Dog::Bark {} {
    if {$_barksALot} {
        $this Answer "Barks many times...."
    } else {
        $this Answer "Woof"
    }
}

body Dog::BeNoisy {} {
    set _barksALot 1
    $this Answer "Setting _barksALot to 1"
}

body Dog::BeQuiet {} {
    set _barksALot 0
    $this Answer "Setting _barksALot to 0"
}

body Dog::Talk {} {
    if {[info exists _barksALot]} {
        $this Bark
    } else {
        chain
    }
}
