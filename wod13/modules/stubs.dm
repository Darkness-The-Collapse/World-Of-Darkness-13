// TEMPORAL DEFINES, DATUMS ETC. WHILE BUILD TRANSFERING TO MODERN TG
/datum/species/kindred
	name = "Vampire"

SUBSYSTEM_DEF(city_time)
	name = "City Time"
	wait = 150
	priority = FIRE_PRIORITY_DEFAULT

	var/hour = 21
	var/minutes = 0

	var/timeofnight = "21:00"

/obj/item/stack/dollar

/mob/living/carbon/human/npc
/mob/living/carbon/human/npc/proc/Aggro(mob/M, attacked = FALSE)

/mob/living/carbon/human/proc/AdjustHumanity(value, limit, forced = FALSE)
/mob/living/carbon/human/proc/AdjustMasquerade(value, forced = FALSE)
/mob/living/carbon/human/npc/proc/backinvisible(atom/A)
/mob/living/proc/CheckEyewitness(mob/living/source, mob/attacker, range = 0, affects_source = FALSE)
