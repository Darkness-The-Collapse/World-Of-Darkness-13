// TEMPORAL DEFINES, DATUMS ETC. WHILE BUILD TRANSFERING TO MODERN TG
/datum/species/kindred
	name = "Vampire"

/datum/species/ghoul
/datum/species/kuei_jin
/datum/species/garou

/obj/item/stack/dollar

//mob/living/carbon/human/npc
mob/living/carbon/human/npc/proc/Aggro(mob/M, attacked = FALSE)

/mob/living/carbon/human/proc/AdjustHumanity(value, limit, forced = FALSE)
/mob/living/carbon/human/proc/AdjustMasquerade(value, forced = FALSE)
//mob/living/carbon/human/npc/proc/backinvisible(atom/A)
/mob/living/proc/CheckEyewitness(mob/living/source, mob/attacker, range = 0, affects_source = FALSE)

/datum/morality_path
/datum/morality_path/proc/trigger_morality(trig_event)
/mob/living/simple_animal/hostile/zombie

/proc/get_vamp_skin_color(value = "albino")
	return "vamp1"

/datum/action/breathe_chi
/datum/action/area_chi
/mob/living/carbon/proc/enter_frenzymod()
/mob/living/carbon/proc/frenzystep()
/datum/preferences/proc/reset_character()
/atom/movable/screen/drinkblood
	name = "Drink Blood"
	icon = 'code/modules/wod13/disciplines.dmi'
/atom/movable/screen/drinkblood/proc/bite()
/proc/secret_vampireroll(dices_num = 1, hardness = 1, mob/living/rollperformer, stealthy = FALSE, decap_rolls = TRUE, autosuccesses = 0)
/turf/open/floor/plating/shit
/proc/get_a_willpower(mob/living/Living)
/mob/living/carbon/proc/CheckFrenzyMove()
	return TRUE
/datum/warform
/datum/warform/proc/transform(animal_atom, mob/living/carbon/human/owner, masquerady = TRUE, time)

/mob/living/simple_animal
	var/datum/warform/warform
	var/mob/living/carbon/human/my_creator
