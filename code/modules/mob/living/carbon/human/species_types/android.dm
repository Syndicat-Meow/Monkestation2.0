/datum/species/android
	name = "Android"
	id = SPECIES_ANDROID
	species_traits = list(
		NO_DNA_COPY,
		NOTRANSSTING,
		NO_UNDERWEAR,
	)
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_GENELESS,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOBREATH,
		TRAIT_NOCLONELOSS,
		TRAIT_NOFIRE,
		TRAIT_NOHUNGER,
		TRAIT_NOMETABOLISM,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_TOXIMMUNE,
		TRAIT_NOBLOOD,
	)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = null
	mutanttongue = /obj/item/organ/internal/tongue/robot
	mutantstomach = null
	mutantheart = null
	mutantliver = null
	mutantlungs = null
	species_language_holder = /datum/language_holder/synthetic
	wing_types = list(/obj/item/organ/external/wings/functional/robotic)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/android,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/android,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/android,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/android,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/android,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/android,
	)
	examine_limb_id = SPECIES_HUMAN

/datum/species/android/on_species_gain(mob/living/carbon/C)
	. = ..()
	// Androids don't eat, hunger or metabolise foods. Let's do some cleanup.
	C.set_safe_hunger_level()

// Monkestation Addition Start
/datum/species/android/get_scream_sound(mob/living/carbon/human/human)
	return 'monkestation/sound/voice/screams/silicon/scream_silicon.ogg'

/datum/species/android/get_laugh_sound(mob/living/carbon/human/human)
	return pick(
		'monkestation/sound/voice/laugh/silicon/laugh_siliconE1M0.ogg',
		'monkestation/sound/voice/laugh/silicon/laugh_siliconE1M1.ogg',
		'monkestation/sound/voice/laugh/silicon/laugh_siliconM2.ogg',
	)
// Monkestation Addition End
