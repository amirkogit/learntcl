source patterns.tcl
source inherit.tcl
source animalhabitat.tcl

puts "Patterns demo"
puts "------------------"

# creating animals
puts "Creating animals..."
Animal animal
animal Name "SomeAnimal"
animal Answer "Some animal description"
animal Talk

# creating Dogs
Dog snoopy
snoopy Name "Snoopy"
snoopy BeQuiet
snoopy Talk

Dog lassie
lassie Name "Lassie"
lassie BeNoisy
lassie Talk

# create Penguin
Penguin wally
wally Name "Wally"
wally Talk

# create Parrot
Parrot polly
polly Name "Polly"
polly Vocabulary "Polly want a cracker !!"
polly Talk

# create Whale
Whale moby
moby Name "Moby"
moby Talk

puts ""
puts "Creating AnimalHabitat..."

# create AnimalHabitat
AnimalHabitat habitat

# create a script for AnimalHabitat
habitat Script \
        "Snoopy is upset about the way that Polly is\
        behaving. It is as if whenever anyone asks\
        Polly to talk, Polly will be nasty. Maybe if\
        instead of Snoopy barking at Polly when he\
        wants Polly to talk, Snoopy quietly asks Polly\
        to be pleasant for a change, things would go\
        better. Now maybe Snoopy barking quietly will\
        not make Polly nasty."

# output the script set to AnimalHabitat
puts "Current script text:"
habitat PrintScript

puts ""
puts "Adding animals to habitat..."
habitat Add snoopy
habitat Add polly

#give the animals some knowledge before playing script
snoopy LearnAction "barking" {snoopy Talk}
snoopy LearnAction "quietly" {snoopy BeQuiet; snoopy Talk}
snoopy LearnAction "is upset" {snoopy BeNoisy; snoopy Talk}
polly LearnAction  "to be pleasant" \
       {polly Vocabulary "Have a nice day"; polly Talk}
polly LearnAction ".* nasty" \
       {polly Vocabulary "Why are you bothering me"; \
        polly Talk}

snoopy ReactTo "snoopy barking"
snoopy ReactTo "snoopy quietly"
polly ReactTo "polly to be pleasant"
polly ReactTo "polly will be nasty"

habitat Play