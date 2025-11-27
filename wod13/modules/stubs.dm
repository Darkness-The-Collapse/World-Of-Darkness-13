// TEMPORAL DEFINES, DATUMS ETC. WHILE BUILD TRANSFERING TO MODERN TG

#define LETHAL "lethal"
#define BASHING "bashing"


/datum/species/kindred
	name = "Vampire"

/datum/species/ghoul
	var/mob/living/carbon/human/master
	var/changed_master = FALSE
	var/last_vitae = 0
	var/list/datum/discipline/disciplines = list()

/datum/species/kuei_jin
/datum/species/garou

/obj/item/stack/dollar

/obj/item/melee/classic_baton/vampire

/mob/living/simple_animal/hostile/zombie

/datum/storage/concrete/vtm/holster

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

/datum/vampireclane/true_brujah
/datum/vampireclane/brujah
/datum/vampireclane/old_clan_tzimisce
/datum/vampireclane/tzimisce
/datum/chi_discipline
	var/level
/datum/chi_discipline/proc/post_gain(mob/living/carbon/human/user)
	return
/datum/action/chi_discipline
	var/level_icon_state = "1" //And this is the state for the action icon
	var/datum/chi_discipline/discipline
	var/active_check = FALSE

/datum/vampireclane/caitiff
/obj/effect/landmark/sarcophagus
/datum/antagonist/sabbatist
/datum/antagonist/noddist
/proc/get_gen_bloodpool(gen)
/mob/living/proc/update_blood_hud()
