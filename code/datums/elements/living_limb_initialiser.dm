/// Spawns a living limb mob inside a limb upon attachment if it doesn't have one
/datum/element/living_limb_initialiser

/datum/element/living_limb_initialiser/Attach(atom/target)
	. = ..()
	if(!isbodypart(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_BODYPART_CHANGED_OWNER, PROC_REF(try_animate_limb))

/datum/element/living_limb_initialiser/Detach(atom/target)
	UnregisterSignal(target, COMSIG_BODYPART_CHANGED_OWNER)
	return ..()
