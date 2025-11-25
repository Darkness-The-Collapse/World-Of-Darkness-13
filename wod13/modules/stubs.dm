// TEMPORAL DEFINES, DATUMS ETC. WHILE BUILD TRANSFERING TO MODERN TG
/datum/species/kindred
	name = "Vampire"

/datum/species/ghoul
/datum/species/kuei_jin
/datum/species/garou

/obj/item/stack/dollar

/mob/living/simple_animal/hostile/zombie

/datum/action/breathe_chi
/datum/action/area_chi
/mob/living/carbon/proc/enter_frenzymod()
/mob/living/carbon/proc/frenzystep()
/datum/preferences/proc/reset_character()
/atom/movable/screen/drinkblood
	name = "Drink Blood"
	icon = 'code/modules/wod13/disciplines.dmi'
/atom/movable/screen/drinkblood/proc/bite()
/turf/open/floor/plating/shit
/mob/living/carbon/proc/CheckFrenzyMove()
	return TRUE
/datum/warform
/datum/warform/proc/transform(animal_atom, mob/living/carbon/human/owner, masquerady = TRUE, time)

/mob/living/simple_animal
	var/datum/warform/warform
	var/mob/living/carbon/human/my_creator
/datum/movespeed_modifier/silver_slowdown
	multiplicative_slowdown = 0.3
/obj/effect/decal/cleanable/gasoline
/obj/item/gas_can
	var/stored_gasoline
/obj/item
	var/vampire_cost = 0 //TEMPORAL COST
	var/masquerade_violating = FALSE
/obj/projectile/beam/beam_rifle/vampire
/obj/effect/fire
/proc/adjust_gnosis(amount, mob/living/carbon/C, sound = TRUE)
/mob/living/carbon/werewolf
/datum/socialrole/hunter
/datum/antagonist/small_hunter
/datum/vampireclane/setite
	var/last_setite_warning = 0
/obj/structure/vaultdoor/pincode/bank
	var/pincode
/proc/find_door_pin(door_type)
/datum/garou_tribe/wendigo
