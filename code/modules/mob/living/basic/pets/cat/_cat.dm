/mob/living/basic/pet/cat
	name = "cat"
	desc = "Kitty!!"
	icon = 'icons/mob/simple/pets.dmi'
	icon_state = "cat2"
	icon_living = "cat2"
	icon_dead = "cat2_dead"
	speak_emote = list("purrs", "meows")
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	unsuitable_atmos_damage = 0.5
	butcher_results = list(
		/obj/item/food/meat/slab = 1,
		/obj/item/stack/sheet/animalhide/cat = 1
	)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	gold_core_spawnable = FRIENDLY_SPAWN
	can_be_held = TRUE
	ai_controller = /datum/ai_controller/basic_controller/cat
	faction = list(FACTION_CAT)
	held_state = "cat2"
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW
	///can this cat breed?
	var/can_breed = TRUE
	///can hold items?
	var/can_hold_item = TRUE
	///can this cat interact with stoves?
	var/can_interact_with_stove = FALSE
	///list of items we can carry
	var/static/list/huntable_items = list(
		/obj/item/fish,
		/obj/item/food/deadmouse,
		/obj/item/food/fishmeat,
	)
	///list of pet commands we follow
	var/static/list/pet_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/follow,
	)

	///item we are currently holding
	var/obj/item/held_food
	///mutable appearance for held item
	var/mutable_appearance/held_item_overlay
	///icon state of our cult icon
	var/cult_icon_state = "cat_cult"

/datum/emote/cat
	mob_type_allowed_typecache = /mob/living/basic/pet/cat
	mob_type_blacklist_typecache = list()

/datum/emote/cat/meow
	key = "meow"
	key_third_person = "meows"
	message = "meows!"
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	vary = TRUE
	sound = SFX_CAT_MEOW

/datum/emote/cat/purr
	key = "purr"
	key_third_person = "purrs"
	message = "purrs."
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	vary = TRUE
	sound = SFX_CAT_PURR

/mob/living/basic/pet/cat/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/obeys_commands, pet_commands)
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/pet_bonus, null, /datum/mood_event/pet_animal, "purr")
	AddElement(/datum/element/footstep, footstep_type = FOOTSTEP_MOB_CLAW)
	add_cell_sample()
	add_verb(src, /mob/living/proc/toggle_resting)
	add_traits(list(TRAIT_VENTCRAWLER_ALWAYS, TRAIT_WOUND_LICKER), INNATE_TRAIT)
	ai_controller.set_blackboard_key(BB_HUNTABLE_PREY, typecacheof(huntable_items))
	if(can_breed)
		add_breeding_component()

/mob/living/basic/pet/cat/proc/add_cell_sample()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CAT, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)

/mob/living/basic/pet/cat/melee_attack(atom/target, list/modifiers, ignore_cooldown)
	. = ..()
	if(!.)
		return FALSE

	if(istype(target, /obj/machinery/oven/range) && can_interact_with_stove)
		target.attack_hand(src)
		return FALSE

	if(!can_hold_item)
		return TRUE

	if(!is_type_in_list(target, huntable_items) || held_food)
		return TRUE
	var/atom/movable/movable_target = target
	movable_target.forceMove(src)
	return FALSE

/mob/living/basic/pet/cat/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone != held_food)
		return
	held_food = null
	update_appearance(UPDATE_OVERLAYS)

/mob/living/basic/pet/cat/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	if(is_type_in_list(arrived, huntable_items))
		held_food = arrived
		update_appearance(UPDATE_OVERLAYS)
	return ..()

/mob/living/basic/pet/cat/update_overlays()
	. = ..()
	if(stat == DEAD || resting || !held_food)
		return
	if(istype(held_food, /obj/item/fish))
		held_item_overlay = mutable_appearance(icon, "cat_fish_overlay")
	if(istype(held_food, /obj/item/food/deadmouse))
		held_item_overlay = mutable_appearance(icon, "cat_mouse_overlay")
	. += held_item_overlay

/mob/living/basic/pet/cat/update_resting()
	. = ..()
	if(stat == DEAD)
		return
	update_appearance(UPDATE_ICON_STATE)

/mob/living/basic/pet/cat/update_icon_state()
	. = ..()
	if (resting)
		icon_state = "[icon_living]_rest"
		return
	icon_state = "[icon_living]"

/mob/living/basic/pet/cat/proc/add_breeding_component()
	AddComponent(\
		/datum/component/breed,\
		can_breed_with = typecacheof(list(/mob/living/basic/pet/cat)),\
		baby_path = /mob/living/basic/pet/cat/kitten,\
	)

/mob/living/basic/pet/cat/space
	name = "space cat"
	desc = "They're a cat... in space!"
	icon_state = "spacecat"
	icon_living = "spacecat"
	icon_dead = "spacecat_dead"
	unsuitable_atmos_damage = 0
	held_state = "spacecat"
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/breadcat
	name = "bread cat"
	desc = "They're a cat... with a bread!"
	icon_state = "breadcat"
	icon_living = "breadcat"
	icon_dead = "breadcat_dead"
	ai_controller = /datum/ai_controller/basic_controller/cat/bread
	held_state = "breadcat"
	can_interact_with_stove = TRUE
	butcher_results = list(
		/obj/item/food/meat/slab = 2,
		/obj/item/food/breadslice/plain = 1
	)
	collar_icon_state = null
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/breadcat/add_cell_sample()
	return

/mob/living/basic/pet/cat/original
	name = "Batsy"
	desc = "The product of alien DNA and bored geneticists."
	gender = FEMALE
	icon_state = "original"
	icon_living = "original"
	icon_dead = "original_dead"
	unique_pet = TRUE
	held_state = "original"
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/original/add_cell_sample()
	return

/mob/living/basic/pet/cat/kitten
	name = "kitten"
	desc = "D'aaawwww."
	icon_state = "kitten"
	icon_living = "kitten"
	icon_dead = "kitten_dead"
	density = FALSE
	pass_flags = PASSMOB
	mob_size = MOB_SIZE_SMALL
	can_breed = FALSE
	ai_controller = /datum/ai_controller/basic_controller/cat/kitten
	can_hold_item = FALSE
	collar_icon_state = "kitten"
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/kitten/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/basic_eating, food_types = huntable_items)

/mob/living/basic/pet/cat/_proc
	name = "Proc"
	gender = MALE
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/jerry //Holy shit we left jerry on donut ~ Arcane ~Fikou
	name = "Jerry"
	desc = "Tom is VERY amused."
	gender = MALE
	faction = list(FACTION_CAT)

/mob/living/basic/pet/cat/tabby
	icon_state = "cat"
	icon_living = "cat"
	icon_dead = "cat_dead"
	held_state = "cat"
	faction = list(FACTION_CAT)
