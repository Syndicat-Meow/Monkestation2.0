/datum/supply_pack/critter
	group = "Livestock"
	crate_type = /obj/structure/closet/crate/critter

/datum/supply_pack/critter/parrot
	name = "Bird Crate"
	desc = "Contains five expert telecommunication birds."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/mob/living/basic/parrot)
	crate_name = "parrot crate"

/datum/supply_pack/critter/parrot/generate()
	. = ..()
	for(var/i in 1 to 4)
		new /mob/living/basic/parrot(.)

/datum/supply_pack/critter/butterfly
	name = "Butterflies Crate"
	desc = "Not a very dangerous insect, but they do give off a better image than, say, flies or cockroaches."//is that a motherfucking worm reference
	contraband = TRUE
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_THEATRE
	contains = list(/mob/living/basic/butterfly)
	crate_name = "entomology samples crate"

/datum/supply_pack/critter/butterfly/generate()
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/basic/butterfly(.)

/datum/supply_pack/critter/calico
	name = "Calico Crate"
	desc = "The cat goes meow! Comes with a collar and a nice cat toy! Cheeseburger not included."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "Calico crate"

/datum/supply_pack/critter/calico/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/_proc(.)

/datum/supply_pack/critter/tabby
	name = "Tabby Crate"
	desc = "The cat goes meow! Comes with a collar and a nice cat toy! Cheeseburger not included."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/tabby,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "Tabby crate"

/datum/supply_pack/critter/tabby/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/tabby/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/tabbym(.)

/datum/supply_pack/critter/void
	name = "Black Crate"
	desc = "Apparently comes with the cutest darkness available"//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/void,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "Crate of pure darkness"

/datum/supply_pack/critter/void/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/void/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/voidm(.)

/datum/supply_pack/critter/siamese
	name = "Siamese Crate"
	desc = "The cat goes meow! Comes with a collar and a nice cat toy! Cheeseburger not included."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/siamese,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "Siamese crate"

/datum/supply_pack/critter/siamese/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/siamese/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/siamesem(.)

/datum/supply_pack/critter/white
	name = "Snowball Crate"
	desc = "They just keep calling it snowball, but is it really just a white cat."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/white,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "White cat crate"

/datum/supply_pack/critter/white/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/white/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/whitem(.)

/datum/supply_pack/critter/rusblue
	name = "Russian Blue Crate"
	desc = "The cat goes meow! Comes with a collar and a nice cat toy! Cheeseburger not included."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 10 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/rusblue,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "Russian Blue crate"

/datum/supply_pack/critter/rusblue/generate()
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/rusblue/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/rusbluem(.)

/datum/supply_pack/critter/chick
	name = "Chicken Crate"
	desc = "The chicken goes bwaak!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/chicken,
					/mob/living/basic/chicken)
	crate_name = "chicken crate"

/datum/supply_pack/critter/corgi
	name = "Corgi Crate"
	desc = "Considered the optimal dog breed by thousands of research scientists, this Corgi is but \
		one dog from the millions of Ian's noble bloodline. Comes with a cute collar!"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/mob/living/basic/pet/dog/corgi,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "corgi crate"

/datum/supply_pack/critter/corgi/generate()
	. = ..()
	if(prob(50))
		var/mob/living/basic/pet/dog/corgi/D = locate() in .
		if(D.gender == FEMALE)
			qdel(D)
			new /mob/living/basic/pet/dog/corgi/lisa(.)

/datum/supply_pack/critter/cow
	name = "Cow Crate"
	desc = "The cow goes moo! Contains one cow."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/mob/living/basic/cow)
	crate_name = "cow crate"

/datum/supply_pack/critter/sheep
	name = "Sheep Crate"
	desc = "The sheep goes BAAAA! Contains one sheep."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/mob/living/basic/sheep)
	crate_name = "sheep crate"

/datum/supply_pack/critter/pig
	name = "Pig Crate"
	desc = "The pig goes oink! Contains one pig."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/mob/living/basic/pig)
	crate_name = "pig crate"

/datum/supply_pack/critter/pony
	name = "Pony Crate"
	desc = "Ponies, yay! (Just the one.)"
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_SERVICE
	contains = list(/mob/living/basic/pony)
	crate_name = "pony crate"

/datum/supply_pack/critter/crab
	name = "Crab Rocket"
	desc = "CRAAAAAAB ROCKET. CRAB ROCKET. CRAB ROCKET. CRAB CRAB CRAB CRAB CRAB CRAB CRAB \
		CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB \
		CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB \
		CRAB CRAB CRAB CRAB CRAB CRAB ROCKET. CRAFT. ROCKET. BUY. CRAFT ROCKET. CRAB ROOOCKET. \
		CRAB ROOOOCKET. CRAB CRAB CRAB CRAB CRAB CRAB CRAB CRAB ROOOOOOOOOOOOOOOOOOOOOOCK \
		EEEEEEEEEEEEEEEEEEEEEEEEE EEEETTTTTTTTTTTTAAAAAAAAA AAAHHHHHHHHHHHHH. CRAB ROCKET. CRAAAB \
		ROCKEEEEEEEEEGGGGHHHHTT CRAB CRAB CRAABROCKET CRAB ROCKEEEET."//fun fact: i actually spent like 10 minutes and transcribed the entire video.
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/mob/living/basic/crab)
	crate_name = "look sir free crabs"
	drop_pod_only = TRUE

/datum/supply_pack/critter/crab/generate()
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/basic/crab(.)

/datum/supply_pack/critter/corgis/exotic
	name = "Exotic Corgi Crate"
	desc = "Corgi fit for a king, this corgi comes in a unique color to signify their superiority. \
		Comes with a cute collar!"
	cost = CARGO_CRATE_VALUE * 11
	contains = list(/mob/living/basic/pet/dog/corgi/exoticcorgi,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "exotic corgi crate"

/datum/supply_pack/critter/fox
	name = "Fox Crate"
	desc = "The fox goes...? Contains one fox. Comes with a collar!"//what does the fox say
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/mob/living/basic/pet/fox,
		/obj/item/clothing/neck/petcollar,
	)
	crate_name = "fox crate"

/datum/supply_pack/critter/goat
	name = "Goat Crate"
	desc = "The goat goes baa! Contains one goat. Warranty void if used as a replacement for Pete."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/mob/living/basic/goat)
	crate_name = "goat crate"

/datum/supply_pack/critter/rabbit
	name = "Rabbit Crate"
	desc = "What noise do rabbits even make? Contains one rabbit."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/rabbit)
	crate_name = "rabbit crate"

/datum/supply_pack/critter/mothroach
	name = "Mothroach Crate"
	desc = "Put the mothroach on your head and find out what true cuteness looks like. \
		Contains one mothroach."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/mothroach)
	crate_name = "mothroach crate"

/datum/supply_pack/critter/monkey
	name = "Monkey Cube Crate"
	desc = "Stop monkeying around! Contains seven monkey cubes. Just add water!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list (/obj/item/storage/box/monkeycubes)
	crate_type = /obj/structure/closet/crate
	crate_name = "monkey cube crate"

/datum/supply_pack/critter/pug
	name = "Pug Crate"
	desc = "Like a normal dog, but... squished. Contains one pug. Comes with a nice collar!"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/mob/living/basic/pet/dog/pug,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "pug crate"

/datum/supply_pack/critter/bullterrier
	name = "Bull Terrier Crate"
	desc = "Like a normal dog, but with a head the shape of an egg. Contains one bull terrier. \
		Comes with a nice collar!"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/mob/living/basic/pet/dog/bullterrier,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "bull terrier crate"

/datum/supply_pack/critter/snake
	name = "Snake Crate"
	desc = "Tired of these MOTHER FUCKING snakes on this MOTHER FUCKING space station? \
		Then this isn't the crate for you. Contains three venomous snakes."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/mob/living/basic/snake = 3)
	crate_name = "snake crate"

/datum/supply_pack/critter/amphibians
	name = "Amphibian Friends Crate"
	desc = "Two disgustingly cute slimey friends. Cytologists love them! \
		Contains one frog and one axolotl. Warning: Frog may have hallucinogenic properties."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/mob/living/basic/axolotl,
		/mob/living/basic/frog,
	)
	crate_name = "amphibian crate"

/datum/supply_pack/critter/lizard
	name = "Lizard Crate"
	desc = "Hisss! Containssss a friendly lizard. Not to be confusssed with a lizardperssson."
	cost = CARGO_CRATE_VALUE * 4
	access_view = ACCESS_JANITOR
	contains = list(/mob/living/basic/lizard)
	crate_name = "lizard crate"

/datum/supply_pack/critter/garden_gnome
	name = "Garden Gnome Crate"
	desc = "Collect them all for your garden. Comes with three!"
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 20
	contains = list(/mob/living/basic/garden_gnome)
	crate_name = "garden gnome crate"

/datum/supply_pack/critter/garden_gnome/generate()
	. = ..()
	for(var/i in 1 to 2)
		new /mob/living/basic/garden_gnome(.)
