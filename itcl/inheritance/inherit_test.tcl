source inherit.tcl

puts "Inheritance demo"
puts "------------------"

# creating animals
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

Penguin wally
wally Name "Wally"
wally Talk

Parrot polly
polly Name "Polly"
polly Vocabulary "Polly want a cracker !!"
polly Talk

Whale moby
moby Name "Moby"
moby Talk